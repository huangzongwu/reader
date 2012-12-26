//
//  Worker.m
//  reader
//
//  Created by Ram Mohan on 26/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Worker.h"

void book_purchase_syn_worker(void *data) {
    // monitors for book purchase at remote locations periodically
    @try {
        NSLog(@"[Worker] Book-Purchase-Sync : running");
    }
    @catch (NSException *exception) {
        ;
    }
    @finally {
        dispatch_queue_t myQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        // Run every one minute
        int64_t interval = 1 * 60 * (int64_t) 1000000000;
        dispatch_time_t tm = dispatch_walltime(DISPATCH_TIME_NOW, interval);
        dispatch_after_f(tm, myQueue, dispatch_get_context(myQueue), &book_purchase_syn_worker);
    }
}

void book_preference_sync_worker(void *data) {
    // uploads local changes in book preferences periodically
}

void download_worker(void *data) {
    // syncs books
}
