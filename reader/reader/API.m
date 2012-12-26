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

+(NSDictionary *) categories {
    NSString *url = [NSString stringWithFormat:@"http://199.189.84.119/japi/catalog/all"];
    
    id respData = [API sendPostRequestTo:url withData:nil];
    return (respData == nil) ? nil: (NSDictionary *) respData;
}

@end
