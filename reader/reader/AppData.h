//
//  AppData.h
//  reader
//
//  Created by Ram Mohan on 24/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface AppData : NSManagedObject

@property (nonatomic) int16_t type;
@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSData * data;

@end
