//
//  AppPreferenceManager.m
//  reader
//
//  Created by Ram Mohan on 24/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppPreferenceManager.h"

@implementation AppPreferenceManager

-(id) initWithDBContext:(NSManagedObjectContext *)ctx {
    self = [super initWithDBContext:ctx];
    if (self) {
        dataType = 4;
        dataId = @"1";
    }
    return self;
}

-(NSMutableDictionary *) getEmptyObject {
    NSMutableDictionary *obj = [[NSMutableDictionary alloc] init];
    [obj setObject:[NSNumber numberWithInt:0] forKey:@"nightmode"];
    [obj setObject:[NSNumber numberWithInt:0] forKey:@"orientationlock"];
    [obj setObject:@"RGB()" forKey:@"hlfgcolor"];
    [obj setObject:@"RGB()" forKey:@"hlbgcolor"];
    [obj setObject:[NSNumber numberWithInt:0] forKey:@"hltxtdecoration"];
    [obj setObject:@"RGB()" forKey:@"ntfgcolor"];
    [obj setObject:@"RGB()" forKey:@"ntbgcolor"];
    [obj setObject:[NSNumber numberWithInt:0] forKey:@"nttxtdecoration"];
    //[obj setObject:nil forKey:@"fontfamily"];
    [obj setObject:@"1.0" forKey:@"fontsize"];
    return obj;
}

-(BOOL) getNightDisplayMode {
    if ([[self.data objectForKey:@"nightmode"] intValue] == 1)
        return YES;
    return NO;
}

-(void) setNightDisplayMode:(BOOL) nightMode {
    if (nightMode == 1)
        [self.data setObject:[NSNumber numberWithInt:nightMode] forKey:@"nightmode"];
        
    [self.data setObject:[NSNumber numberWithInt:0] forKey:@"nightmode"];
}

-(int) getOrientationLockMode {
    
}

-(void) setOrientationLockMode:(int) orientaitonLockMode {}

-(NSString *) getHighLightBackGroundColor {}
-(void) setHighLightBackGroundColor:(NSString *) color {}

-(NSString *) getHighLightForeGroundColor {}
-(void) setHighLightForeGroundColor:(NSString *) color {}

-(int) getHighLightTextDecorationMode {}
-(void) setHighLightTextDecorationMode:(int) textDecorationMode {}

-(NSString *) getNoteForeGroundColor {}
-(void) setNoteForeGroundColor:(NSString *) color {}

-(NSString *) getNoteBackGroundColor {}
-(void) setNoteBackGroundColor:(NSString *) color {}

-(int) getNoteTextDecrorationMode {}
-(void) setNoteTextDecorationMode:(int) textDecorationMode {}

-(NSString *) getFontFamily {}
-(void) setFamily:(NSString *) fontFamily {}

-(float) getFontSize {}
-(void) setFontSize:(float) fontSize {}

@end
