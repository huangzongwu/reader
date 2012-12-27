//
//  AppDelegate.h
//  reader
//
//  Created by Ram Mohan on 24/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CovenantNotificationCenter;
@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    CovenantNotificationCenter *notificationCenter;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@property (strong, nonatomic) CovenantNotificationCenter *notificationCenter;

@property (readonly, strong, nonatomic) NSManagedObjectContext  *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel    *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory;
- (void)saveContext;

@end
