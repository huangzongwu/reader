//
//  UserManager.m
//  reader
//
//  Created by Ram Mohan on 24/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UserManager.h"

@implementation UserManager

-(NSString *) getPredicate {
    return @"type=1 AND id=1";
}

-(NSMutableDictionary *) getEmptyObject {
    NSMutableDictionary *obj = [[NSMutableDictionary alloc] init];
    [obj setObject:@"" forKey:@"name"];
    [obj setObject:@"" forKey:@"email"];
    [obj setObject:@"" forKey:@"password"];
    return obj;
}


-(NSString *) getName {
    if (exists)
        return [self.data objectForKey:@"name"];
    return nil;
}

-(void) setName:(NSString *) name {
    if ([[self.data objectForKey:@"name"] isEqualToString:name])
        return;
        
    [self.data setObject:name forKey:@"name"];
    modified = YES;
}

-(NSString *) getEmail {
    if (exists)
        return [self.data objectForKey:@"email"];
    return nil;
}

-(void) setEmail:(NSString *) email {
    if ([[self.data objectForKey:@"email"] isEqualToString:email])
        return;
    
    [self.data setObject:email forKey:@"email"];
    modified = YES;
}


@end
