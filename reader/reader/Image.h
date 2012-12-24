//
//  Image.h
//  reader
//
//  Created by Ram Mohan on 24/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Image : NSManagedObject

@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSString * mimeType;
@property (nonatomic, retain) NSData * data;

@end
