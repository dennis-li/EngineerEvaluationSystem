//
//  AppDelegate.m
//  EngineerEvaluationSystem
//
//  Created by lixu on 16/12/3.
//  Copyright © 2016年 lixu. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginVCTL = [mainStoryboard instantiateViewControllerWithIdentifier:@"LoginVC"];
    UINavigationController *rootCtrl = [[UINavigationController alloc] initWithRootViewController:loginVCTL];
    self.window.rootViewController = rootCtrl;
    return YES;
}

-(void)changeRootCtroller:(BOOL)isLogin
{
    //    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:250.0f/255.0f green:210.0f/255.0f blue:40.0f/255.0f alpha:1.0f]];
    UIViewController *rootVCT = nil;
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.window.rootViewController = [storyBoard instantiateInitialViewController];
    rootVCT = [storyBoard instantiateInitialViewController];
    
    [UIView transitionWithView:[[UIApplication sharedApplication].delegate window]
                      duration:1
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        BOOL oldState=[UIView areAnimationsEnabled];
                        [UIView setAnimationsEnabled:NO];
                        [[[UIApplication sharedApplication].delegate window] setRootViewController:rootVCT];
                        [UIView setAnimationsEnabled:oldState];
                        
                    }
                    completion:NULL];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
