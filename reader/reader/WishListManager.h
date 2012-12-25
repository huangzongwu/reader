//
//  WishListManager.h
//  reader
//
//  Created by Ram Mohan on 24/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DataManager.h"

@interface WishListManager : DataManager

-(NSArray *) getWishList;
-(void) addBook:(NSString *) bookId withTitle:(NSString *) title;
-(void) removeBook:(NSString *) bookId;

@end
