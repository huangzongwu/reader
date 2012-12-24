//
//  Book.h
//  reader
//
//  Created by Ram Mohan on 24/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Book : NSManagedObject

@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSString * title;
@property (nonatomic) int16_t downloadState;
@property (nonatomic, retain) NSString * checksum;
@property (nonatomic) int64_t dataSize;
@property (nonatomic) NSTimeInterval downloadedOn;
@property (nonatomic) NSTimeInterval lastReadOn;
@property (nonatomic, retain) NSManagedObject *data;

@end
