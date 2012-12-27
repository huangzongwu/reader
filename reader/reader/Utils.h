//
//  Utils.h
//  reader
//
//  Created by Ram Mohan on 26/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject


+(NSString *) urlEscapedString:(NSString *) originalString;
+(NSDictionary *) getDeviceDetails;

@end
