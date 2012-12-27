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
+(NSDictionary *) signout:(NSDictionary *) userdata;
+(NSDictionary *) activateAccount:(NSDictionary *) userData;
+(NSDictionary *) getAccountInfo:(NSDictionary *) userData;
+(NSDictionary *) updateAccountInfo:(NSDictionary *) userData;
+(NSDictionary *) changePassword:(NSDictionary *) userData;
+(NSDictionary *) resetPassword:(NSDictionary *) userData;
+(NSDictionary *) updateDeviceName:(NSDictionary *) userData;
+(NSDictionary *) unlinkDevice:(NSDictionary *) userData;
+(NSDictionary *) getCatalogue;
+(NSDictionary *) getCatalogueQuickBooks:(NSDictionary *) userData;
+(NSDictionary *) getCatalogueBooks:(NSDictionary *) userData;
+(NSDictionary *) catalogueSearch:(NSDictionary *) userData;
+(NSDictionary *) bookPurchased:(NSDictionary *) userData;
+(NSDictionary *) getTransactionHistory:(NSDictionary *) userData;
+(NSDictionary *) getMyBooks:(NSDictionary *) userData;
+(NSDictionary *) downloadBook:(NSDictionary *) userData;
+(NSDictionary *) getBookDetails:(NSDictionary *) userData;
+(NSDictionary *) getBookSummary:(NSDictionary *) userData;
+(NSDictionary *) likeBook:(NSDictionary *) userData;
+(NSDictionary *) getMyLikes:(NSDictionary *) userData;
+(NSDictionary *) unlineBook:(NSDictionary *) userData;
+(NSDictionary *) addToWishList:(NSDictionary *) userData;
+(NSDictionary *) getMyWishList:(NSDictionary *) userData;
+(NSDictionary *) removeFromWishList:(NSDictionary *) userData;

@end
