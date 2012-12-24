//
//  UserManager.h
//  reader
//
//  Created by Ram Mohan on 24/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DataManager.h"

@interface UserManager : DataManager

-(NSString *) getName;
-(void) setName:(NSString *) name;

-(NSString *) getEmail;
-(void) setEmail:(NSString *) email;


@end
