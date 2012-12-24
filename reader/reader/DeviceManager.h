//
//  DeviceManager.h
//  reader
//
//  Created by Ram Mohan on 24/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
//  data: {'local': {'id': ..., 'name': ... }, 
//          'remote': [ {'id': ...., 'name': ...}, {'id': ..., 'name': ...}, ...] 
//  }
//

#import <Foundation/Foundation.h>

#import "DataManager.h"

@interface DeviceManager : DataManager 


-(NSDictionary *) getLocalDeviceData;
-(void) setLocalDeviceId:(NSString *) devId;
-(void) setLocalDeviceName:(NSString *) devName;

-(NSArray *) getRemoteDevices;
-(void) setRemoteDevices:(NSArray *) devices;

@end
