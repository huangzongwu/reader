//
//  DataManager.m
//  reader
//
//  Created by Ram Mohan on 24/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DataManager.h"

#import <CoreData/CoreData.h>
#import "AppData.h"
#import "SBJson.h"

@implementation DataManager 

@synthesize dbCtx;
@synthesize data;

-(id) initWithDBContext:(NSManagedObjectContext *) ctx {
    self = [super init];
    if (self) {
        dbCtx = ctx;
        data = nil;
        modified = NO;
        [self loadData];
    }
    return self;
}

-(void) loadData {
    NSFetchRequest *req = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"AppData" inManagedObjectContext:self.dbCtx];
    [req setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:[self getPredicate]];
    [req setPredicate:predicate];
    
    [req setFetchLimit:1];
    
    NSError *err;
    NSArray *userProfiles = [self.dbCtx executeFetchRequest:req error:&err];
    if ([userProfiles count] > 0) {
        AppData *appDataDAO = [userProfiles objectAtIndex:0];
        self.data = (NSMutableDictionary *) [[[SBJsonParser alloc] init] objectWithData:appDataDAO.data];
        exists = YES;
    } else {
        self.data = [self getEmptyObject];
        exists = NO;
    }
}

-(NSString *) getPredicate {
    // To be implemented by derived classes
    return [NSString stringWithFormat:@"type=%d AND id=%@", dataType, dataId];
}

-(NSMutableDictionary *) getEmptyObject {
    // to be implemented by dervied classes
    return nil;
}

-(BOOL) hasData {
    return exists;
}

-(BOOL) save {
    if (!modified)
        return NO;
    
    SBJsonWriter *jsonWriter = [[SBJsonWriter alloc] init];
    NSError *err = nil;
    NSData *jsonData = [jsonWriter dataWithObject:self.data];
    if (jsonData == nil) { 
        return NO;
    }
    
    AppData *appDataDAO = nil;
    
    NSFetchRequest *req = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"AppData" inManagedObjectContext:self.dbCtx];
    [req setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:[self getPredicate]];
    [req setPredicate:predicate];
    [req setFetchLimit:1];
    
    NSArray *userProfiles = [self.dbCtx executeFetchRequest:req error:&err];
    if ([userProfiles count] > 0) {
        appDataDAO = [userProfiles objectAtIndex:0];
    } else {
        appDataDAO = [NSEntityDescription insertNewObjectForEntityForName:@"AppData" inManagedObjectContext:self.dbCtx];
        [appDataDAO setId:dataId];
        [appDataDAO setType:dataType];
    }
    
    [appDataDAO setData:jsonData];
    
    if ([self.dbCtx save:nil]) {
        modified = NO;
        exists = YES;
        return YES;
    } else {
        modified = NO;
        exists = YES;
        return NO;
    }
}

@end
