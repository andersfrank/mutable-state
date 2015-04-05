//
//  AppDelegate.m
//  Transactions
//
//  Created by Anders Frank on 2015-04-05.
//  Copyright (c) 2015 Frank. All rights reserved.
//

#import "AppDelegate.h"
#import "TransactionExamplesViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    self.window.rootViewController =
    [[UINavigationController alloc] initWithRootViewController:[TransactionExamplesViewController new]];
    
    return YES;
}



@end
