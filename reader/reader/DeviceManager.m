//
//  DeviceManager.m
//  reader
//
//  Created by Ram Mohan on 24/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DeviceManager.h"


@implementation DeviceManager

-(id) initWithDBContext:(NSManagedObjectContext *)ctx {
    self = [super initWithDBContext:ctx];
    if (self) {
        dataType = 2;
        dataId = @"1";
        [super loadData];
    }
    return self;
}

-(NSString *) getPredicate {
    return @"type=2 AND id=1";
}

-(NSMutableDictionary *) getEmptyObject {
    NSMutableDictionary *obj = [[NSMutableDictionary alloc] init];
    [obj setObject:[[NSMutableDictionary alloc] init] forKey:@"local"];
    [obj setObject:[[NSMutableArray alloc] init] forKey:@"remote"];
    return obj;
}


-(NSDictionary *) getLocalDeviceData {
    if (exists) 
        return [self.data objectForKey:@"local"];
    return nil;
}

-(void) setLocalDeviceId:(NSString *) devId {
    if ([[[self.data objectForKey:@"local"] objectForKey:@"id"] isEqualToString:devId])
        return;
    
    [[self.data objectForKey:@"local"] setObject:devId forKey:@"id"];
    modified = YES;
}

-(void) setLocalDeviceName:(NSString *) devName {
    if ([[[self.data objectForKey:@"local"] objectForKey:@"name"] isEqualToString:devName])
        return;
        
    [[self.data objectForKey:@"local"] setObject:devName forKey:@"name"];
    modified = YES;
}

-(NSArray *) getRemoteDevices {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for(NSDictionary *dev in [self.data objectForKey:@"remote"] ) {
        [result addObject:[dev objectForKey:@"name"]];
    }
    return (NSArray *)result;
}

-(void) setRemoteDevices:(NSArray *) devices {
    [self.data setObject:devices forKey:@"remote"];
    modified = YES;
}

@end
