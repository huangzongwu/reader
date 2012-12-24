//
//  BookData.h
//  reader
//
//  Created by Ram Mohan on 24/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Book;

@interface BookData : NSManagedObject

@property (nonatomic, retain) NSData * data;
@property (nonatomic, retain) Book *id;

@end
