//
//  NAPI.m
//  reader
//
//  Created by Ram Mohan on 27/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NAPI.h"

@implementation NAPI


+(id) instance {
    return nil;
}

-(id) init {
    if ((self = [super init])) {
        const char *moduleQueueName = [[self moduleName] UTF8String];
        moduleQueue = dispatch_queue_create(moduleQueueName, NULL);
    }
    return self;
}




- (NSString *)moduleName {
    return NSStringFromClass([self class]);
}

@end
