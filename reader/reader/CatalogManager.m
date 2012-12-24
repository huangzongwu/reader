//
//  CatalogManager.m
//  reader
//
//  Created by Ram Mohan on 24/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CatalogManager.h"

@implementation CatalogManager

//-(NSString *) getPredicate {
//    return @"type=3 AND id=1";
//}

-(id) initWithDBContext:(NSManagedObjectContext *)ctx {
    self = [super initWithDBContext:ctx];
    if (self) {
        dataType = 3;
        dataId = @"1";
    }
    return self;
}

-(NSMutableDictionary *) getEmptyObject {
    NSMutableDictionary *obj = [[NSMutableDictionary alloc] init];
    [obj setObject:[[NSMutableArray alloc] init] forKey:@"categories"];
    [obj setObject:[[NSMutableDictionary alloc] init] forKey:@"cat-tree"];
    return obj;
}

-(NSArray *) getCategories {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for(NSDictionary *cat in [self.data objectForKey:@"categories"] ) {
        //NSString *key = [cat objectForKey:@"cid"];
        //if ([[self.data objectForKey:@"cat-tree"] objectForKey:key] != nil) {
            [result addObject:cat];
        //}
    }    
    return result;
}

-(void) setCategories:(NSDictionary *) categories {
    self.data = (NSMutableDictionary *) categories;
    modified = YES;
}

-(NSArray *) getSubCategories:(NSString *) categoryId {
    return nil;
}

@end
