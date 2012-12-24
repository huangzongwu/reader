//
//  AppPreferenceManager.h
//  reader
//
//  Created by Ram Mohan on 24/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DataManager.h"

@interface AppPreferenceManager : DataManager

-(BOOL) getNightDisplayMode;
-(void) setNightDisplayMode:(BOOL) nightMode;

-(int) getOrientationLockMode;
-(void) setOrientationLockMode:(int) orientaitonLockMode;

-(NSString *) getHighLightBackGroundColor;
-(void) setHighLightBackGroundColor:(NSString *) color;

-(NSString *) getHighLightForeGroundColor;
-(void) setHighLightForeGroundColor:(NSString *) color;

-(int) getHighLightTextDecorationMode;
-(void) setHighLightTextDecorationMode:(int) textDecorationMode;

-(NSString *) getNoteForeGroundColor;
-(void) setNoteForeGroundColor:(NSString *) color;

-(NSString *) getNoteBackGroundColor;
-(void) setNoteBackGroundColor:(NSString *) color;

-(int) getNoteTextDecrorationMode;
-(void) setNoteTextDecorationMode:(int) textDecorationMode;

-(NSString *) getFontFamily;
-(void) setFamily:(NSString *) fontFamily;

-(float) getFontSize;
-(void) setFontSize:(float) fontSize;

@end
