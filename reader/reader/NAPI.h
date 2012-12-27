//
//  NAPI.h
//  reader
//
//  Created by Ram Mohan on 27/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NAPI : NSObject {
    dispatch_queue_t moduleQueue;
}

//@property (readonly) dispatch_queue_t moduleQueue;

+(id) instance;

- (NSString *)moduleName;

@end
