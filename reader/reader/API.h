//
//  API.h
//  reader
//
//  Created by Ram Mohan on 26/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *API_SERVER;

@interface API : NSObject {

}

+(id) sendPostRequestTo:(NSString *) targetURL withData:(NSDictionary *) postData;


+(void ) signup:(NSDictionary *) userData;
+(void) signin:(NSDictionary *) userData;
+(void) signout:(NSDictionary *) userdata;
+(void) activateAccount:(NSDictionary *) userData;
+(void) getAccountInfo:(NSDictionary *) userData;
+(void) updateAccountInfo:(NSDictionary *) userData;
+(void) changePassword:(NSDictionary *) userData;
+(void) resetPassword:(NSDictionary *) userData;
+(void) updateDeviceName:(NSDictionary *) userData;
+(void) unlinkDevice:(NSDictionary *) userData;
+(void) getCatalogue;
+(void) getCatalogueQuickBooks:(NSDictionary *) userData;
+(void) getCatalogueBooks:(NSDictionary *) userData;
+(void) catalogueSearch:(NSDictionary *) userData;
+(void) bookPurchased:(NSDictionary *) userData;
+(void) getTransactionHistory:(NSDictionary *) userData;
+(void) getMyBooks:(NSDictionary *) userData;
+(void) downloadBook:(NSDictionary *) userData;
+(void) getBookDetails:(NSDictionary *) userData;
+(void) getBookSummary:(NSDictionary *) userData;
+(void) likeBook:(NSDictionary *) userData;
+(void) getMyLikes:(NSDictionary *) userData;
+(void) unlineBook:(NSDictionary *) userData;
+(void) addToWishList:(NSDictionary *) userData;
+(void) getMyWishList:(NSDictionary *) userData;
+(void) removeFromWishList:(NSDictionary *) userData;

@end
