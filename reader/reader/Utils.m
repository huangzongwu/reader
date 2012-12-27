//
//  Utils.m
//  reader
//
//  Created by Ram Mohan on 26/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Utils.h"

@implementation Utils

#pragma mark -
#pragma mark URLEscaping a string.
+(NSString *) urlEscapedString:(NSString *) originalString
{
	NSMutableString *escaped = [NSMutableString stringWithString:[originalString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
	
	[escaped replaceOccurrencesOfString:@"$" withString:@"%24" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
	[escaped replaceOccurrencesOfString:@"&" withString:@"%26" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
	[escaped replaceOccurrencesOfString:@"+" withString:@"%2B" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
	[escaped replaceOccurrencesOfString:@"," withString:@"%2C" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
	[escaped replaceOccurrencesOfString:@"/" withString:@"%2F" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
	[escaped replaceOccurrencesOfString:@":" withString:@"%3A" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
	[escaped replaceOccurrencesOfString:@";" withString:@"%3B" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
	[escaped replaceOccurrencesOfString:@"=" withString:@"%3D" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
	[escaped replaceOccurrencesOfString:@"?" withString:@"%3F" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
	[escaped replaceOccurrencesOfString:@"@" withString:@"%40" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
	[escaped replaceOccurrencesOfString:@" " withString:@"%20" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
	[escaped replaceOccurrencesOfString:@"\t" withString:@"%09" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
	[escaped replaceOccurrencesOfString:@"#" withString:@"%23" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
	[escaped replaceOccurrencesOfString:@"<" withString:@"%3C" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
	[escaped replaceOccurrencesOfString:@">" withString:@"%3E" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
	[escaped replaceOccurrencesOfString:@"\"" withString:@"%22" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
	[escaped replaceOccurrencesOfString:@"\n" withString:@"%0A" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
	
	return escaped;
}

#pragma mark - device details
+(NSDictionary *) getDeviceDetails {
    // TODO: remove below hard coded values
    NSMutableDictionary *obj = [[NSMutableDictionary alloc] init];
    [obj setObject:@"ios" forKey:@"dos"];
    [obj setObject:@"6.0" forKey:@"dosv"];
    [obj setObject:@"ipad" forKey:@"dtype"];
    [obj setObject:@"apple" forKey:@"dmf"];
    return obj;
}

@end
