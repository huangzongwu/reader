//
//  CatalogManager.h
//  reader
//
//  Created by Ram Mohan on 24/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DataManager.h"

@interface CatalogManager : DataManager

-(NSArray *) getCategories;
-(void) setCategories:(NSDictionary *) categories;
-(NSArray *) getSubCategories:(NSString *) categoryId;


@end
