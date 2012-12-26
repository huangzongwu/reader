//
//  API.h
//  reader
//
//  Created by Ram Mohan on 26/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface API : NSObject {

}

+(id) sendPostRequestTo:(NSString *) targetURL withData:(NSDictionary *) postData;

+(NSDictionary *) categories;

@end
