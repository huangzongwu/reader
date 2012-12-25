//
//  BookPreferenceManager.m
//  reader
//
//  Created by Ram Mohan on 24/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BookPreferenceManager.h"

@implementation BookPreferenceManager

-(id) initWithDBContext:(NSManagedObjectContext *)ctx forBookWithId:(NSString *) bookId {
    self = [super initWithDBContext:ctx];
    if (self) {
        dataId = bookId;
        dataType = 5;
        [super loadData];
    }
    return self;
}

-(NSMutableDictionary *) getEmptyObject {
    NSMutableDictionary *obj = [[NSMutableDictionary alloc] init];
    [obj setObject:@"" forKey:@"currch"];
    [obj setObject:@"" forKey:@"currpg"];
    [obj setObject:[[NSMutableDictionary alloc] init] forKey:@"bm"];
    [obj setObject:[[NSMutableDictionary alloc] init] forKey:@"hl"];
    [obj setObject:[[NSMutableDictionary alloc] init] forKey:@"nt"];
    return obj;
}

-(NSString *) getCurrentChapter {
    return ([[self.data objectForKey:@"currch"] isEqualToString:@""]) ? nil : [self.data objectForKey:@"currch"] ;
}

-(void) setCurrentChapter:(NSString *) chapterXPath {
    if ([[self.data objectForKey:@"currch"] isEqualToString:chapterXPath])
        return;
    
    [self.data setObject:chapterXPath forKey:@"currch"];
    modified = YES;
}

-(NSString *) getCurrentPage {
    return [self.data objectForKey:@"currpg"];
}

-(void) setCurrentPage:(NSString *) pageXPath {
    if ([[self.data objectForKey:@"currpg"] isEqualToString:pageXPath])
        return;
        
    [self.data setObject:pageXPath forKey:@"currpg"];
    modified = YES;
}

-(NSArray *) getBookMarksForChapter:(NSString *) chapter {
    return (NSArray *) [[self.data objectForKey:@"bm"] objectForKey:chapter];
}

-(void) addBookMark:(NSString *) bookMarkXPath inChapter:(NSString *) chapter {
    if (![[self.data objectForKey:@"bm"] objectForKey:chapter])
        [[self.data objectForKey:@"bm"] setObject:[[NSMutableArray alloc] init] forKey:chapter];

    NSMutableDictionary *rec = [[NSMutableDictionary alloc] init];
    [rec setObject:bookMarkXPath forKey:@"start"];
    
    [[[self.data objectForKey:@"bm"] objectForKey:chapter] addObject:rec];
    modified = YES;
}

-(void) removeBookMark:(NSString *) bookMarkXPath inChapter:(NSString *) chapter {
    NSMutableDictionary *rec = [[NSMutableDictionary alloc] init];
    [rec setObject:bookMarkXPath forKey:@"start"];
    [rec setObject:chapter forKey:@"chapter"];
    
    [[[self.data objectForKey:@"bm"] objectForKey:chapter] removeObject:rec];
    modified = YES;
}

-(NSArray *) getHighLightsForChapter:(NSString *) chapter {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for(NSString *hlId in [[self.data objectForKey:@"hl"] objectForKey:chapter] ) {
        [result addObject:[[[self.data objectForKey:@"hl"] objectForKey:chapter] objectForKey:hlId] ];
    }
    return ([result count] == 0) ? nil : (NSArray *)result;
}

-(void) addHighLight:(NSString *) hlId start:(NSString *) startXPath end:(NSString *) endXPath inChapter:(NSString *) chapter {
    if ( ![[self.data objectForKey:@"hl"] objectForKey:chapter] )
        [[self.data objectForKey:@"hl"] setObject:[[NSMutableDictionary alloc] init] forKey:chapter];
     
    NSMutableDictionary *rec = [[NSMutableDictionary alloc] init];
    [rec setObject:startXPath forKey:@"start"];
    [rec setObject:endXPath forKey:@"end"];
    
    [[[self.data objectForKey:@"hl"] objectForKey:chapter] setObject:rec forKey:hlId];
    modified = YES;
}

-(void) removeHighLight:(NSString *) hlId fromChapter:(NSString *) chapter {
    [[[self.data objectForKey:@"hl"] objectForKey:chapter] removeObjectForKey:hlId];
    modified = YES;
}

-(NSArray *) getNotesForChapter:(NSString *) chapter {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for(NSString *ntId in [[self.data objectForKey:@"nt"] objectForKey:chapter] ) {
        [result addObject:[[[self.data objectForKey:@"nt"] objectForKey:chapter] objectForKey:ntId] ];
    }    
    return ([result count] == 0) ? nil : (NSArray *)result ;
}

-(void) addNote:(NSString *) noteId start:(NSString *) startXPath end:(NSString *) endXPath withNote:(NSString *) notes inChapter:(NSString *) chapter {
    
    if ( ![[self.data objectForKey:@"nt"] objectForKey:chapter] )
        [[self.data objectForKey:@"nt"] setObject:[[NSMutableDictionary alloc] init]  forKey:chapter];
    
    NSMutableDictionary *rec = [[NSMutableDictionary alloc] init];
    [rec setObject:startXPath forKey:@"start"];
    [rec setObject:endXPath forKey:@"end"];
    [rec setObject:notes forKey:@"note"];
    
    [[[self.data objectForKey:@"nt"] objectForKey:chapter] setObject:rec forKey:noteId];
    modified = YES;
}

-(void) removeNote:(NSString *) noteId fromChapter:(NSString *) chapter {
    [[[self.data objectForKey:@"nt"] objectForKey:chapter] removeObjectForKey:noteId];
    modified = YES;
}

@end
