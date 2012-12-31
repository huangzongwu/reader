//
//  API.m
//  reader
//
//  Created by Ram Mohan on 26/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "API.h"

#import "SBJson.h"
#import "Utils.h"
#import "CovenantNotification.h"
#import "NSNotificationCenterAdditions.h"

// TODO: server address should be configurable
//NSString *API_SERVER = @"http://199.189.84.119/japi";
NSString *API_SERVER = @"http://54.235.196.12/japi";

@implementation API



+(id) sendPostRequestTo:(NSString *) targetURL withData:(NSDictionary *) postData { 

    NSMutableString *sb = [[NSMutableString alloc] init];
    for(NSString *k in [postData allKeys] ) {
        ([sb length] != 0) ? [sb appendString:@"&"] : nil;
        
        [sb appendString:k];
        [sb appendString:@"="];
        if ([[postData objectForKey:k] isKindOfClass:[NSDictionary class]] || 
                [[postData objectForKey:k] isKindOfClass:[NSArray class] ] ) {
            
            SBJsonWriter *jsonWriter = [[SBJsonWriter alloc] init];
            NSString *jsonString = [jsonWriter stringWithObject:[postData objectForKey:k] ];
            if(jsonString != nil)
                [sb appendString:[Utils urlEscapedString:jsonString] ];
        } else {
            [sb appendString:[Utils urlEscapedString:[postData objectForKey:k]]];
        }
    }
    
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:targetURL] 
                                            cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData 
                                            timeoutInterval:30];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody:[sb dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLResponse *resp;
    NSError *err;
    NSData *data = [NSURLConnection sendSynchronousRequest:req returningResponse:&resp error:&err];
    
    if ((data != nil) && ([data length] != 0) ) {
        NSString *status = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
        id dataResponse = [jsonParser objectWithString:status];
        return dataResponse;
    } else {
        NSLog(@"Request failed...");
        NSLog(@"Error : %@", [err userInfo]);
        return nil;
    }
}

#pragma mark - signup
+(void) signup:(NSDictionary *) userData {

    
    NSString *URL = [NSString stringWithFormat:@"%@/user/signup", API_SERVER];
    
    NSArray *fields = [NSArray arrayWithObjects:@"src",@"email",@"name",@"pwd",
                                    @"did",nil];
    for(NSString *field in fields) {
        if ( ![userData objectForKey:field]) {
            NSDictionary *errResp = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:0],@"ec",
                                            field,@"em", nil];
            NSNotification *notificaiton = [NSNotification notificationWithName:COVNOTIFICATION_SIGNUP_RESULT_FAILED 
                                                                object:nil
                                                                userInfo:errResp];
            [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notificaiton waitUntilDone:NO];
            return;
        }
    }
    
    NSMutableDictionary *data =  [NSMutableDictionary dictionaryWithDictionary:userData]; 
    [data addEntriesFromDictionary:[Utils getDeviceDetails] ];
    
    NSDictionary *defaultResp = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:-1],@"ec", 
                                            @"internal server error", @"em",nil];
                                            
    id respData = [API sendPostRequestTo:URL withData:data];
    if ( !respData) {
        NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_SIGNUP_RESULT_FAILED 
                                                                     object:nil userInfo:defaultResp];
        [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
    } else {
        if ( [[(NSDictionary *)respData objectForKey:@"s"] intValue] == 0) {
            NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_SIGNUP_RESULT_FAILED 
                                                        object:nil 
                                                        userInfo:[respData objectForKey:@"d"]];
            [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
        } else {
            NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_SIGNUP_RESULT_OK 
                                                        object:nil 
                                                        userInfo:[respData objectForKey:@"d"]];
            [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
        }
    }
}

#pragma mark - signin
+(void) signin:(NSDictionary *) userData {
    
    NSString *URL = [NSString stringWithFormat:@"%@/user/signin", API_SERVER];
    
    NSArray *fields = [NSArray arrayWithObjects:@"src",@"repeat",@"email",@"pwd",@"did", nil];
    for(NSString *field in fields) {
        if (![userData objectForKey:field]) {
            NSDictionary *errResp = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:0],@"ec",
                                     field,@"em", nil];
            NSNotification *notificaiton = [NSNotification notificationWithName:COVNOTIFICATION_SIGNIN_RESULT_FAILED 
                                                                         object:nil
                                                                       userInfo:errResp];
            [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notificaiton waitUntilDone:NO];
            return;
        }
    }
    
    NSMutableDictionary *data =  [NSMutableDictionary dictionaryWithDictionary:userData]; 
    [data addEntriesFromDictionary:[Utils getDeviceDetails] ];
    
    NSDictionary *defaultResp = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:-1],@"ec", 
                                 @"internal server error", @"em",nil];
    
    id respData = [API sendPostRequestTo:URL withData:data];
    if (!respData) {
        NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_SIGNIN_RESULT_FAILED 
                                                                     object:nil userInfo:defaultResp];
        [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
    } else {
        if ( [[(NSDictionary *)respData objectForKey:@"s"] intValue] == 0) {
            NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_SIGNIN_RESULT_FAILED 
                                                                         object:nil 
                                                                       userInfo:[respData objectForKey:@"d"]];
            [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
        } else {
            NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_SIGNIN_RESULT_OK 
                                                                         object:nil 
                                                                       userInfo:[respData objectForKey:@"d"]];
            [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
        }
    }
    
}
 
#pragma mark - signout
+(void) signout:(NSDictionary *) userdata {

}

#pragma mark - activate account
+(void) activateAccount:(NSDictionary *) userData {

}

#pragma mark - getAccount Info
+(void) getAccountInfo:(NSDictionary *) userData {
    NSString *url = [NSString stringWithFormat:@"%@/user/profile", API_SERVER];
    NSArray *fields = [NSArray arrayWithObjects:@"src",@"sid",@"email",@"did", nil];
    for(NSString *fld in fields) {
        if (![userData objectForKey:fld]) {
            NSDictionary *errResp = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:0],@"ec",
                                     fld,@"em", nil];
            NSNotification *notificaiton = [NSNotification notificationWithName:COVNOTIFICATION_GET_ACCOUNT_INFO_RESULT_FAILED 
                                                                         object:nil
                                                                       userInfo:errResp];
            [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notificaiton waitUntilDone:NO];
            return;
        }
    }
    
    NSDictionary *defaultResp = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:-1],@"ec", 
                                 @"internal server error", @"em",nil];
    
    id respData = [API sendPostRequestTo:url withData:userData];
    if (!respData) {
        NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_GET_ACCOUNT_INFO_RESULT_FAILED
                                                                     object:nil userInfo:defaultResp];
        [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
    } else {
        if ( [[(NSDictionary *)respData objectForKey:@"s"] intValue] == 0) {
            NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_GET_ACCOUNT_INFO_RESULT_FAILED
                                                                         object:nil 
                                                                       userInfo:[respData objectForKey:@"d"]];
            [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
        } else {
            NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_GET_ACCOUNT_INFO_RESULT_OK
                                                                         object:nil 
                                                                       userInfo:[respData objectForKey:@"d"]];
            [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
        }
    }
    
}

#pragma mark - update account infi
+(void) updateAccountInfo:(NSDictionary *) userData {

}

#pragma mark - change password
+(void) changePassword:(NSDictionary *) userData {

}

#pragma mark - reset password
+(void) resetPassword:(NSDictionary *) userData {

}

#pragma mark - update device name
+(void) updateDeviceName:(NSDictionary *) userData {

}

#pragma mark - unlink device
+(void) unlinkDevice:(NSDictionary *) userData {

}

#pragma mark - get catalogue
+(void) getCatalogue {
    NSString *url = [NSString stringWithFormat:@"%@/catalog/all", API_SERVER];
    
    NSDictionary *defaultResp = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:-1],@"ec", 
                                 @"internal server error", @"em",nil];
    
    id respData = [API sendPostRequestTo:url withData:nil];
    if (!respData) {
        NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_GET_CATALOGUE_RESULT_FAILED
                                                                     object:nil userInfo:defaultResp];
        [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
    } else {
        if ( [[(NSDictionary *)respData objectForKey:@"s"] intValue] == 0) {
            NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_GET_CATALOGUE_RESULT_FAILED
                                                                         object:nil 
                                                                       userInfo:[respData objectForKey:@"d"]];
            [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
        } else {
            NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_GET_CATALOGUE_RESULT_OK
                                                                         object:nil 
                                                                       userInfo:[respData objectForKey:@"d"]];
            [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
        }
    }
}

#pragma mark - get catalogue quick books
+(void) getCatalogueQuickBooks:(NSDictionary *) userData {
    NSString *url = [NSString stringWithFormat:@"%@/catalog/quick_books", API_SERVER];
    
    NSArray *fields = [NSArray arrayWithObjects:@"cat_ids",@"counts", nil];
    for(NSString *fld in fields) {
        if (![userData objectForKey:fld]) {
            NSDictionary *errResp = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:0],@"ec",
                                     fld,@"em", nil];
            NSNotification *notificaiton = [NSNotification notificationWithName:COVNOTIFICATION_GET_CATALOGUE_QUICK_BOOKS_RESULT_FAILED 
                                                                         object:nil
                                                                       userInfo:errResp];
            [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notificaiton waitUntilDone:NO];
            return;
        }
    }
    
    NSDictionary *defaultResp = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:-1],@"ec", 
                                 @"internal server error", @"em",nil];
    
    id respData = [API sendPostRequestTo:url withData:userData];
    if (!respData) {
        NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_GET_CATALOGUE_QUICK_BOOKS_RESULT_FAILED
                                                                     object:nil userInfo:defaultResp];
        [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
    } else {
        if ( [[(NSDictionary *)respData objectForKey:@"s"] intValue] == 0) {
            NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_GET_CATALOGUE_QUICK_BOOKS_RESULT_FAILED
                                                                         object:nil 
                                                                       userInfo:[respData objectForKey:@"d"]];
            [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
        } else {
            NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_GET_CATALOGUE_QUICK_BOOKS_RESULT_OK
                                                                         object:nil 
                                                                       userInfo:[respData objectForKey:@"d"]];
            [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
        }
    }
    
}

#pragma mark - get catalog books
+(void) getCatalogueBooks:(NSDictionary *) userData {
    NSString *url = [NSString stringWithFormat:@"%@/catalog/books", API_SERVER];
    
    NSDictionary *defaultResp = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:-1],@"ec", 
                                 @"internal server error", @"em",nil];
    
    id respData = [API sendPostRequestTo:url withData:userData];
    if (!respData) {
        NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_GET_CATALOGUE_BOOKS_RESULT_FAILED
                                                                     object:nil userInfo:defaultResp];
        [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
    } else {
        if ( [[(NSDictionary *)respData objectForKey:@"s"] intValue] == 0) {
            NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_GET_CATALOGUE_BOOKS_RESULT_FAILED
                                                                         object:nil 
                                                                       userInfo:[respData objectForKey:@"d"]];
            [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
        } else {
            NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_GET_CATALOGUE_BOOKS_RESULT_OK
                                                                         object:nil 
                                                                       userInfo:[respData objectForKey:@"d"]];
            [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
        }
    }
}

#pragma mark - catalogue search
+(void) catalogueSearch:(NSDictionary *) userData {
    NSString *url = [NSString stringWithFormat:@"%@/catalog/search", API_SERVER];
    
    NSArray *fields = [NSArray arrayWithObjects:@"qry", nil];
    for(NSString *fld in fields) {
        if (![userData objectForKey:fld]) {
            NSDictionary *errResp = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:0],@"ec",
                                     fld,@"em", nil];
            NSNotification *notificaiton = [NSNotification notificationWithName:COVNOTIFICATION_GET_CATALOGUE_SEARCH_RESULT_FAILED
                                                                         object:nil
                                                                       userInfo:errResp];
            [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notificaiton waitUntilDone:NO];
            return; 
        }
    }
    
    NSDictionary *defaultResp = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:-1],@"ec", 
                                 @"internal server error", @"em",nil];
    
    id respData = [API sendPostRequestTo:url withData:userData];
    if (!respData) {
        NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_GET_CATALOGUE_SEARCH_RESULT_FAILED
                                                                     object:nil userInfo:defaultResp];
        [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
    } else {
        if ( [[(NSDictionary *)respData objectForKey:@"s"] intValue] == 0) {
            NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_GET_CATALOGUE_SEARCH_RESULT_FAILED
                                                                         object:nil 
                                                                       userInfo:[respData objectForKey:@"d"]];
            [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
        } else {
            NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_GET_CATALOGUE_SEARCH_RESULT_OK
                                                                         object:nil 
                                                                       userInfo:[respData objectForKey:@"d"]];
            [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
        }
    }
    
}

#pragma mark - inapp purchase
+(void) bookPurchased:(NSDictionary *) userData {

}

#pragma mark - transaction history
+(void) getTransactionHistory:(NSDictionary *) userData {
    NSString *url = [NSString stringWithFormat:@"%@/txn/history", API_SERVER];
    
    NSArray *fields = [NSArray arrayWithObjects:@"src",@"sid",@"did", nil];
    for(NSString *fld in fields) {
        if (![userData objectForKey:fld]) {
            NSDictionary *errResp = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:0],@"ec",
                                     fld,@"em", nil];
            NSNotification *notificaiton = [NSNotification notificationWithName:COVNOTIFICATION_GET_TRANSACTION_HISTORY_RESULT_FAILED
                                                                         object:nil
                                                                       userInfo:errResp];
            [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notificaiton waitUntilDone:NO];
            return; 
        }
    }
    
    NSDictionary *defaultResp = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:-1],@"ec", 
                                 @"internal server error", @"em",nil];
    
    id respData = [API sendPostRequestTo:url withData:userData];
    if (!respData) {
        NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_GET_TRANSACTION_HISTORY_RESULT_FAILED
                                                                     object:nil userInfo:defaultResp];
        [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
    } else {
        if ( [[(NSDictionary *)respData objectForKey:@"s"] intValue] == 0) {
            NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_GET_TRANSACTION_HISTORY_RESULT_FAILED
                                                                         object:nil 
                                                                       userInfo:[respData objectForKey:@"d"]];
            [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
        } else {
            NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_GET_TRANSACTION_HISTORY_RESULT_OK
                                                                         object:nil 
                                                                       userInfo:[respData objectForKey:@"d"]];
            [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
        }
    }
    
}

#pragma mark - get my books
+(void) getMyBooks:(NSDictionary *) userData {
    NSString *url = [NSString stringWithFormat:@"%@/user/profile/books", API_SERVER];
    
    NSArray *fields = [NSArray arrayWithObjects:@"src",@"sid",@"did", nil];
    for(NSString *fld in fields) {
        if (![userData objectForKey:fld]) {
            NSDictionary *errResp = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:0],@"ec",
                                     fld,@"em", nil];
            NSNotification *notificaiton = [NSNotification notificationWithName:COVNOTIFICATION_GET_TRANSACTION_HISTORY_RESULT_FAILED
                                                                         object:nil
                                                                       userInfo:errResp];
            [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notificaiton waitUntilDone:NO];
            return; 
        }
    }
    
    NSDictionary *defaultResp = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:-1],@"ec", 
                                 @"internal server error", @"em",nil];
    
    id respData = [API sendPostRequestTo:url withData:userData];
    if (!respData) {
        NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_GET_TRANSACTION_HISTORY_RESULT_FAILED
                                                                     object:nil userInfo:defaultResp];
        [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
    } else {
        if ( [[(NSDictionary *)respData objectForKey:@"s"] intValue] == 0) {
            NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_GET_TRANSACTION_HISTORY_RESULT_FAILED
                                                                         object:nil 
                                                                       userInfo:[respData objectForKey:@"d"]];
            [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
        } else {
            NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_GET_TRANSACTION_HISTORY_RESULT_OK
                                                                         object:nil 
                                                                       userInfo:[respData objectForKey:@"d"]];
            [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
        }
    }
}

#pragma mark - download a book
+(void) downloadBook:(NSDictionary *) userData {

}

#pragma mark - get Book Details
+(void) getBookDetails:(NSDictionary *) userData {
    NSString *url = [NSString stringWithFormat:@"%@/book/details", API_SERVER];
    
    NSArray *fields = [NSArray arrayWithObjects:@"src",@"pid", nil];
    for(NSString *fld in fields) {
        if (![userData objectForKey:fld]) {
            NSDictionary *errResp = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:0],@"ec",
                                     fld,@"em", nil];
            NSNotification *notificaiton = [NSNotification notificationWithName:COVNOTIFICATION_GET_BOOK_DETAILS_RESULT_FAILED
                                                                         object:nil
                                                                       userInfo:errResp];
            [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notificaiton waitUntilDone:NO];
            return; 
        }
    }
    
    NSDictionary *defaultResp = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:-1],@"ec", 
                                 @"internal server error", @"em",nil];
    
    id respData = [API sendPostRequestTo:url withData:userData];
    if (!respData) {
        NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_GET_BOOK_DETAILS_RESULT_FAILED
                                                                     object:nil userInfo:defaultResp];
        [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
    } else {
        if ( [[(NSDictionary *)respData objectForKey:@"s"] intValue] == 0) {
            NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_GET_TRANSACTION_HISTORY_RESULT_FAILED
                                                                         object:nil 
                                                                       userInfo:[respData objectForKey:@"d"]];
            [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
        } else {
            NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_GET_BOOK_DETAILS_RESULT_OK
                                                                         object:nil 
                                                                       userInfo:[respData objectForKey:@"d"]];
            [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
        }
    }
}

#pragma mark - get book summary info
+(void) getBookSummary:(NSDictionary *) userData {
    NSString *url = [NSString stringWithFormat:@"%@/books/summary", API_SERVER];
    
    NSArray *fields = [NSArray arrayWithObjects:@"src",@"sid",@"did",@"pids",@"fields", nil];
    for(NSString *fld in fields) {
        if (![userData objectForKey:fld]) {
            NSDictionary *errResp = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:0],@"ec",
                                     fld,@"em", nil];
            NSNotification *notificaiton = [NSNotification notificationWithName:COVNOTIFICATION_GET_BOOK_DETAILS_RESULT_FAILED
                                                                         object:nil
                                                                       userInfo:errResp];
            [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notificaiton waitUntilDone:NO];
            return; 
        }
    }
    
    NSDictionary *defaultResp = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:-1],@"ec", 
                                 @"internal server error", @"em",nil];
    
    id respData = [API sendPostRequestTo:url withData:userData];
    if (!respData) {
        NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_GET_BOOK_DETAILS_RESULT_FAILED
                                                                     object:nil userInfo:defaultResp];
        [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
    } else {
        if ( [[(NSDictionary *)respData objectForKey:@"s"] intValue] == 0) {
            NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_GET_TRANSACTION_HISTORY_RESULT_FAILED
                                                                         object:nil 
                                                                       userInfo:[respData objectForKey:@"d"]];
            [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
        } else {
            NSNotification *notification = [NSNotification notificationWithName:COVNOTIFICATION_GET_BOOK_DETAILS_RESULT_OK
                                                                         object:nil 
                                                                       userInfo:[respData objectForKey:@"d"]];
            [[NSNotificationCenter defaultCenter] postNotificationOnMainThread:notification waitUntilDone:NO];
        }
    }
}

#pragma mark - like a book
+(void) likeBook:(NSDictionary *) userData {

}

#pragma mark - get my likes 
+(void) getMyLikes:(NSDictionary *) userData {

}

#pragma mark - unlike a book
+(void) unlikeBook:(NSDictionary *) userData {

}

#pragma mark - add a book to wishlist
+(void) addToWishList:(NSDictionary *) userData {

}

#pragma mark - get my wishlist
+(void) getMyWishList:(NSDictionary *) userData {

}

#pragma mark - remove from my wishlist
+(void) removeFromWishList:(NSDictionary *) userData {

}

@end
