//
//  WishListManager.m
//  reader
//
//  Created by Ram Mohan on 24/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WishListManager.h"

@implementation WishListManager

-(id) initWithDBContext:(NSManagedObjectContext *)ctx {
    self = [super initWithDBContext:ctx];
    if (self) {
        dataType = 6;
        dataId = @"1";
        [super loadData];
    }
    return self;
}

-(NSMutableDictionary *) getEmptyObject {
    return [[NSMutableDictionary alloc] init];
}

-(NSArray *) getWishList {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for(NSString *bId in self.data ) {
        [result addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:bId,@"bid",[self.data objectForKey:bId],@"title", nil]];
    }
    return  ([result count] ==0) ? nil : result ;
}

-(void) addBook:(NSString *) bookId withTitle:(NSString *) title {
    [self.data setObject:title forKey:bookId];
    modified = YES;
}

-(void) removeBook:(NSString *) bookId {
    [self.data removeObjectForKey:bookId];
    modified = YES;
}

@end
