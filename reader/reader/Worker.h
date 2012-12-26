//
//  Worker.h
//  reader
//
//  Created by Ram Mohan on 26/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
//  Background workers...
//

#import <Foundation/Foundation.h>

void book_purchase_syn_worker(void *data);
void book_preference_sync_worker(void *data);
void download_worker(void *data);


