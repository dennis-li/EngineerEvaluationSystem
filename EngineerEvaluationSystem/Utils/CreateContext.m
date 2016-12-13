//
//  CreateContext.m
//  SUES
//
//  Created by lixu on 16/11/18.
//  Copyright © 2016年 lixu. All rights reserved.
//

#import "CreateContext.h"

@implementation CreateContext

#pragma mark - Core Data

- (void)saveContext:(NSManagedObjectContext *)managedObjectContext
{
    NSError *error = nil;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

+(NSManagedObjectContext *)createContext
{
    static NSManagedObjectContext *context = nil;
    static CreateContext *manager = nil;
    static dispatch_once_t oneceToken;
    
    dispatch_once(&oneceToken, ^{
        manager = [[self alloc] init];
        context = [manager createMainQueueManagedObjectContext];
    });
    return context;
}

- (NSManagedObjectContext *)createMainQueueManagedObjectContext
{
    NSManagedObjectContext *managedObjectContext = nil;
    NSPersistentStoreCoordinator *coordinator = [self createPersistentStoreCoordinator];
    if (coordinator != nil) {
        managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return managedObjectContext;
}


//返回应用程序的托管对象模型。
//如果模型不存在,它从应用程序的创建模型。
- (NSManagedObjectModel *)createManagedObjectModel
{
    NSManagedObjectModel *managedObjectModel = nil;
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Future" withExtension:@"momd"];
    managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return managedObjectModel;
}


//返回应用程序的持久性存储协调员。
//如果协调不存在,这是创建和应用程序的商店添加到它。
- (NSPersistentStoreCoordinator *)createPersistentStoreCoordinator
{
    NSPersistentStoreCoordinator *persistentStoreCoordinator = nil;
    NSManagedObjectModel *managedObjectModel = [self createManagedObjectModel];
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Future.sqlite"];
    
    NSError *error = nil;
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return persistentStoreCoordinator;
}

//返回应用程序的文档目录的URL

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
