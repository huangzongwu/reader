//
//  DataManager.h
//  reader
//
//  Created by Ram Mohan on 24/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject {
    NSManagedObjectContext *dbCtx;
    NSMutableDictionary *data;
    
    int dataType;
    NSString *dataId;
    
    BOOL exists;
    BOOL modified;
    
}

@property (strong, atomic) NSManagedObjectContext *dbCtx;
@property (strong, atomic) NSMutableDictionary *data;

-(id) initWithDBContext:(NSManagedObjectContext *) ctx;
-(NSString *) getPredicate;
-(NSMutableDictionary *) getEmptyObject;
-(BOOL) hasData;
-(BOOL) save;

@end
