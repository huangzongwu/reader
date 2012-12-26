//
//  NSNotificationCenterAdditions.m
//  reader
//
//  Created by Ram Mohan on 26/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSNotificationCenterAdditions.h"

@implementation NSNotificationCenter (NSNotificationCenterAdditions)

-(void) _postMyNotification:(NSNotification *) notification
{
	[[[self class] defaultCenter] postNotification:notification];
}

- (void) postNotificationOnMainThread:(NSNotification *) notification waitUntilDone:(BOOL) wait
{
	if ([NSThread isMainThread])
		return [self postNotification:notification];
	[self performSelectorOnMainThread:@selector(_postMyNotification:) withObject:notification waitUntilDone:wait];
}

@end


