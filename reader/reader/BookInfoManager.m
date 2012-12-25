//
//  BookInfoManager.m
//  reader
//
//  Created by Ram Mohan on 25/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BookInfoManager.h"

@implementation BookInfoManager

-(id) initWithDBContext:(NSManagedObjectContext *)ctx forBookWithId:(NSString *) bookId {
    self = [super initWithDBContext:ctx];
    if (self) {
        dataId = bookId;
        dataType = 10;
        [super loadData];
    }
    return self;
}

-(NSMutableDictionary *) getEmptyObject {
    NSMutableDictionary *obj = [[NSMutableDictionary alloc] init];
    [obj setObject:[[NSMutableDictionary alloc] init] forKey:@"info"];
    [obj setObject:@"" forKey:@"review"];
    [obj setObject:@"" forKey:@"rating"];
    [obj setObject:@"" forKey:@"like"];
    return obj;
}

@end
