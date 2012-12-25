//
//  BookPreferenceManager.h
//  reader
//
//  Created by Ram Mohan on 24/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DataManager.h"

@interface BookPreferenceManager : DataManager

-(id) initWithDBContext:(NSManagedObjectContext *)ctx forBookWithId:(NSString *) bookId;

-(NSString *) getCurrentChapter;
-(void) setCurrentChapter:(NSString *) chapterXPath;

-(NSString *) getCurrentPage;
-(void) setCurrentPage:(NSString *) pageXPath;

-(NSArray *) getBookMarksForChapter:(NSString *) chapter;
-(void) addBookMark:(NSString *) bookMarkXPath inChapter:(NSString *) chapter;
-(void) removeBookMark:(NSString *) bookMarkXPath inChapter:(NSString *) chapter;

-(NSArray *) getHighLightsForChapter:(NSString *) chapter;
-(void) addHighLight:(NSString *) hlId start:(NSString *) startXPath end:(NSString *) endXPath inChapter:(NSString *) chapter;
-(void) removeHighLight:(NSString *) hlId fromChapter:(NSString *) chapter;

-(NSArray *) getNotesForChapter:(NSString *) chapter;
-(void) addNote:(NSString *) noteId start:(NSString *) startXPath end:(NSString *) endXPath withNote:(NSString *) notes inChapter:(NSString *) chapter;
-(void) removeNote:(NSString *) noteId fromChapter:(NSString *) chapter;

@end
