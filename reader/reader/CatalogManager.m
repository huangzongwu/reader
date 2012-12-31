//
//  CatalogManager.m
//  reader
//
//  Created by Ram Mohan on 24/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CatalogManager.h"

@implementation CatalogManager

-(id) initWithDBContext:(NSManagedObjectContext *)ctx {
    self = [super initWithDBContext:ctx];
    if (self) {
        dataType = 3;
        dataId = @"1";
        [super loadData];
    }
    return self;
}

-(NSMutableDictionary *) getEmptyObject {
    NSMutableDictionary *obj = [[NSMutableDictionary alloc] init];
    [obj setObject:[[NSMutableArray alloc] init] forKey:@"categories"];
    [obj setObject:[[NSMutableArray alloc] init] forKey:@"meta_categories"];
    return obj;
}

-(NSArray *) getCategories {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for(NSDictionary *cat in [self.data objectForKey:@"categories"] ) {
            if ([[cat objectForKey:@"level"] isEqualToString:@"3"]) {
                [result addObject:cat];
            }
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
