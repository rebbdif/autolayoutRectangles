//
//  AppDelegate.m
//  autolayoutSBT
//
//  Created by 1 on 25.04.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import "SLVAppDelegate.h"
#import "SLVTaskOneViewController.h"
#import "SLVTaskTwoViewController.h"

@interface SLVAppDelegate ()

@end

@implementation SLVAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIViewController *viewController = [SLVTaskOneViewController new];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setRootViewController:navigationController];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
