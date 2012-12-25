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
        [super loadData];
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
    if (nightMode == 1) {
        [self.data setObject:[NSNumber numberWithInt:nightMode] forKey:@"nightmode"];
    } else {
        [self.data setObject:[NSNumber numberWithInt:0] forKey:@"nightmode"];
    }
    modified = YES;
}

-(int) getOrientationLockMode {
    return [[self.data objectForKey:@"orientationlock"] intValue];
}

-(void) setOrientationLockMode:(int) orientaitonLockMode {
    if ( (orientaitonLockMode < 0) || (orientaitonLockMode > 2) ) 
        return;
    [self.data   setObject:[NSNumber numberWithInt:orientaitonLockMode] forKey:@"orientationlock"];
    modified = YES;
}

-(NSString *) getHighLightBackGroundColor {
     return [self.data objectForKey:@"hlbgcolor"];   
}

-(void) setHighLightBackGroundColor:(NSString *) color {
    [self.data setObject:color forKey:@"hlbgcolor"];
    modified = YES;
}

-(NSString *) getHighLightForeGroundColor {
    return [self.data objectForKey:@"hlfgcolor"];
}

-(void) setHighLightForeGroundColor:(NSString *) color {
    [self.data setObject:color forKey:@"hlfgcolor"];
    modified = YES;
}

-(int) getHighLightTextDecorationMode {
    return [[self.data objectForKey:@"hltxtdecoration"] intValue];
}

-(void) setHighLightTextDecorationMode:(int) textDecorationMode {
    if ( (textDecorationMode < 0) || (textDecorationMode > 2) ) 
        return;
    
    [self.data setObject:[NSNumber numberWithInt:textDecorationMode] forKey:@"hltxtdecoration"];
    modified = YES;
}

-(NSString *) getNoteForeGroundColor {
    return [self.data objectForKey:@"ntfgcolor"];
}

-(void) setNoteForeGroundColor:(NSString *) color {
    [self.data setObject:color forKey:@"ntfgcolor"];
    modified = YES;
}

-(NSString *) getNoteBackGroundColor {
  return [self.data objectForKey:@"ntbgcolor"];  
}

-(void) setNoteBackGroundColor:(NSString *) color {
    [self.data setObject:color forKey:@"ntbgcolor"];
    modified = YES;
}

-(int) getNoteTextDecrorationMode {
    return [[self.data objectForKey:@"nttxtdecoration"] intValue];
}

-(void) setNoteTextDecorationMode:(int) textDecorationMode {
    if ( (textDecorationMode < 0) || (textDecorationMode > 3) ) 
        return;
    [self.data setObject:[NSNumber numberWithInt:textDecorationMode] forKey:@"nttxtdecoration"];
    modified = YES;
}

-(NSString *) getFontFamily {
    return [self.data objectForKey:@"fontfamily"];
}

-(void) setFamily:(NSString *) fontFamily {
    [self.data setObject:fontFamily forKey:@"fontfamily"];
    modified = YES;
}

-(float) getFontSize {
    return [[self.data objectForKey:@"fontsize"] floatValue];
}

-(void) setFontSize:(float) fontSize {
    [self.data setObject:[NSNumber numberWithFloat:fontSize] forKey:@"fontsize"];
    modified = YES;
}

@end
