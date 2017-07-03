//
//  AppDelegate.m
//  autolayoutSBT
//
//  Created by 1 on 25.04.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import "AppDelegate.h"
#import "TaskOneViewController.h"
#import "TaskTwoViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    TaskTwoViewController *vc=[TaskTwoViewController new];
    UINavigationController *nc=[[UINavigationController alloc]initWithRootViewController:vc];
    self.window=[[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    [self.window setRootViewController:nc];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
