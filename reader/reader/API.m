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

// TODO: server address should be configurable
NSString *API_SERVER = @"http://199.189.84.119/japi";

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
+(NSDictionary *) signup:(NSDictionary *) userData {
    return nil;
}

#pragma mark - signin
+(NSDictionary *) signin:(NSDictionary *) userData {
    return nil;
}
 
#pragma mark - signout
+(NSDictionary *) signout:(NSDictionary *) userdata {
    return nil;
}

#pragma mark - activate account
+(NSDictionary *) activateAccount:(NSDictionary *) userData {
    return nil;
}

#pragma mark - getAccount Info
+(NSDictionary *) getAccountInfo:(NSDictionary *) userData {
    return nil;
}

#pragma mark - update account infi
+(NSDictionary *) updateAccountInfo:(NSDictionary *) userData {
    return nil;
}

#pragma mark - change password
+(NSDictionary *) changePassword:(NSDictionary *) userData {
    return nil;
}

#pragma mark - reset password
+(NSDictionary *) resetPassword:(NSDictionary *) userData {
    return nil;
}

#pragma mark - update device name
+(NSDictionary *) updateDeviceName:(NSDictionary *) userData {
    return nil;
}

#pragma mark - unlink device
+(NSDictionary *) unlinkDevice:(NSDictionary *) userData {
    return nil;
}

#pragma mark - get catalogue
+(NSDictionary *) getCatalogue {
    NSString *url = [NSString stringWithFormat:@"%@/catalog/all", API_SERVER];
    
    id respData = [API sendPostRequestTo:url withData:nil];
    return (respData == nil) ? nil: (NSDictionary *) respData; 
}

#pragma mark - get catalogue quick books
+(NSDictionary *) getCatalogueQuickBooks:(NSDictionary *) userData {
    return nil;
}

#pragma mark - get catalog books
+(NSDictionary *) getCatalogueBooks:(NSDictionary *) userData {
    return nil;
}

#pragma mark - catalogue search
+(NSDictionary *) catalogueSearch:(NSDictionary *) userData {
    return nil;
}

#pragma mark - inapp purchase
+(NSDictionary *) bookPurchased:(NSDictionary *) userData {
    return nil;
}

#pragma mark - transaction history
+(NSDictionary *) getTransactionHistory:(NSDictionary *) userData {
    return nil;
}

#pragma mark - get my books
+(NSDictionary *) getMyBooks:(NSDictionary *) userData {
    return nil;
}

#pragma mark - download a book
+(NSDictionary *) downloadBook:(NSDictionary *) userData {
    return nil;
}

#pragma mark - get Book Details
+(NSDictionary *) getBookDetails:(NSDictionary *) userData {
    return nil;
}

#pragma mark - get book summary info
+(NSDictionary *) getBookSummary:(NSDictionary *) userData {
    return nil;
}

#pragma mark - like a book
+(NSDictionary *) likeBook:(NSDictionary *) userData {
    return nil;
}

#pragma mark - get my likes 
+(NSDictionary *) getMyLikes:(NSDictionary *) userData {
    return nil;
}

#pragma mark - unlike a book
+(NSDictionary *) unlikeBook:(NSDictionary *) userData {
    return nil;
}

#pragma mark - add a book to wishlist
+(NSDictionary *) addToWishList:(NSDictionary *) userData {
    return nil;
}

#pragma mark - get my wishlist
+(NSDictionary *) getMyWishList:(NSDictionary *) userData {
    return nil;
}

#pragma mark - remove from my wishlist
+(NSDictionary *) removeFromWishList:(NSDictionary *) userData {
    return nil;
}

@end
