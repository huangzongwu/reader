//
//  AppDelegate.m
//  reader
//
//  Created by Ram Mohan on 24/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import <CoreData/CoreData.h>
#import "UserManager.h"
#import "DeviceManager.h"
#import "CatalogManager.h"

#import "ViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

@synthesize managedObjectContext        = __managedObjectContext;
@synthesize managedObjectModel          = __managedObjectModel;
@synthesize persistentStoreCoordinator  = __persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    [self doTest];
    
    return YES;
}

-(void) doTest {
    CatalogManager *cm = [[CatalogManager alloc] initWithDBContext:self.managedObjectContext];
   // NSArray *cats = [cm getCategories];
    NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
    [data setObject:[[NSMutableArray alloc] init]  forKey:@"categories"];
    [[data objectForKey:@"categories"] addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"123", @"cid",@"Myth",@"name", nil] ];
    [[data objectForKey:@"categories"] addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"124", @"cid",@"FolkStories",@"name", nil] ];
    [data setObject:[[NSMutableDictionary alloc] init] forKey:@"cat-tree"];
    [cm setCategories:data];
    [cm save];
   
    NSLog(@"TEST OK...");
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}


#pragma mark - CoreData Stack
- (NSManagedObjectContext *)managedObjectContext 
{
    if (__managedObjectContext != nil) {
        return __managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        __managedObjectContext = [[NSManagedObjectContext alloc] init];
        [__managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return __managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (__managedObjectModel != nil) {
        return __managedObjectModel;
    }
    
        //NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
        //__managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];    
    __managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    return __managedObjectModel;
}

-(NSPersistentStoreCoordinator *) persistentStoreCoordinator {
    
    if (__persistentStoreCoordinator != nil) {
        NSLog(@"DB Exists already");
        return __persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"reader.sqlite"];
    
    NSError *error = nil;
    __persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    
    if (![__persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        
            // TODO: rather than abruptly terminating the app, message user appropriately.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    } else {
        NSLog(@"DB Created..");
    }
    
    return __persistentStoreCoordinator;
    
}

#pragma mark - APP Helper methods
- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil)
        {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error])
            {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
            } 
        }
}

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
