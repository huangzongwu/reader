//
//  CovenantWorkers.h
//  reader
//
//  Created by Ram Mohan on 26/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CovenantWorkers : NSObject {
    UIBackgroundTaskIdentifier downloadWorker;
    UIBackgroundTaskIdentifier bookPreferenceSyncWorker;
    UIBackgroundTaskIdentifier bookPurchaseSyncWorker;
}

@property (nonatomic, assign) UIBackgroundTaskIdentifier downloadWorker;
@property (nonatomic, assign) UIBackgroundTaskIdentifier bookPreferenceSyncWorker;
@property (nonatomic, assign) UIBackgroundTaskIdentifier bookPurchaseSyncWorker;

-(void) startDownloadWorker;
-(void) stopDownloadWorker;

-(void) startBookPreferenceSyncWorker;
-(void) stopBookPreferenceSyncWorker;

-(void) startBookPurchaseSyncWorker;
-(void) stopBookPurchaseSyncWorker;

@end
