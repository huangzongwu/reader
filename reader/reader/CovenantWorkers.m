//
//  CovenantWorkers.m
//  reader
//
//  Created by Ram Mohan on 26/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CovenantWorkers.h"

#import "Worker.h"

@implementation CovenantWorkers

@synthesize downloadWorker;
@synthesize bookPreferenceSyncWorker;
@synthesize bookPurchaseSyncWorker;

-(id) init {
    self = [super init];
    if (self) {
        self.downloadWorker = UIBackgroundTaskInvalid;
        self.bookPreferenceSyncWorker = UIBackgroundTaskInvalid;
        self.bookPurchaseSyncWorker = UIBackgroundTaskInvalid;
    }
    return self;
}

#pragma mark - download worker
-(void) startDownloadWorker {
    if (self.downloadWorker != UIBackgroundTaskInvalid) 
        return;

    dispatch_queue_t myQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    UIApplication *app = [UIApplication sharedApplication];
    self.downloadWorker = [app beginBackgroundTaskWithExpirationHandler:^{
        [app endBackgroundTask:self.downloadWorker];
        self.downloadWorker = UIBackgroundTaskInvalid;
        NSLog(@"Download worker ended..");
    }];
    dispatch_async_f(myQueue, dispatch_get_context(myQueue), &download_worker);
}

-(void) stopDownloadWorker { }

#pragma mark - book Preference Sync Worker 
-(void) startBookPreferenceSyncWorker {
    if (self.bookPreferenceSyncWorker != UIBackgroundTaskInvalid)
        return;
    
    dispatch_queue_t myQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    UIApplication *app = [UIApplication sharedApplication];
    self.bookPreferenceSyncWorker = [app beginBackgroundTaskWithExpirationHandler:^{
        [app endBackgroundTask:self.bookPreferenceSyncWorker];
        self.bookPreferenceSyncWorker = UIBackgroundTaskInvalid;
        NSLog(@"Book Preference worker ended...");
    }];
    dispatch_async_f(myQueue, dispatch_get_context(myQueue), &book_preference_sync_worker);
}

-(void) stopBookPreferenceSyncWorker { }

#pragma mark - book purchase sync worker
-(void) startBookPurchaseSyncWorker {
    if (self.bookPurchaseSyncWorker != UIBackgroundTaskInvalid)
        return;
        
    dispatch_queue_t myQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    UIApplication *app = [UIApplication sharedApplication];
    self.bookPurchaseSyncWorker = [app beginBackgroundTaskWithExpirationHandler:^{
        [app endBackgroundTask:self.bookPurchaseSyncWorker];
        self.bookPurchaseSyncWorker = UIBackgroundTaskInvalid;
        NSLog(@"Book purchase sync worker ended..");
    }];
    dispatch_async_f(myQueue, dispatch_get_context(myQueue), &book_purchase_syn_worker);
}

-(void) stopBookPurchaseSyncWorker { }


@end
