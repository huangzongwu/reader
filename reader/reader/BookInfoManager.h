//
//  BookInfoManager.h
//  reader
//
//  Created by Ram Mohan on 25/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DataManager.h"

@interface BookInfoManager : DataManager

-(id) initWithDBContext:(NSManagedObjectContext *)ctx forBookWithId:(NSString *) bookId;


@end
