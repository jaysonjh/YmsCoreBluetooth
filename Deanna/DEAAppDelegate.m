//
//  DTAppDelegate.m
//  Deanna
//
//  Created by Charles Choi on 12/17/12.
//  Copyright (c) 2012 Yummy Melon Software. All rights reserved.
//

#import "DEAAppDelegate.h"
#import "DEAHomeViewController.h"
#import "DEAPeripheralsViewController.h"
#import "YMSBluetoothService.h"

@implementation DEAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initializeUserDefaults];
    [self initializeAppServices];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    //DEAHomeViewController *vc = [[DEAHomeViewController alloc] initWithNibName:@"DEAHomeViewController" bundle:nil];
    DEAPeripheralsViewController *pvc = [[DEAPeripheralsViewController alloc] initWithNibName:@"DEAPeripheralsViewController" bundle:nil];
    
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:pvc];
    
    
    self.window.rootViewController = nvc;
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    YMSBluetoothService *btleService = [YMSBluetoothService sharedService];
    [btleService persistPeripherals];
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    //sDTBTLEService *btleService = [DTBTLEService sharedService];
    //[btleService loadPeripherals];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)initializeUserDefaults {
    NSDictionary *appDefaults = @{@"storedPeripherals": @[]};
    [[NSUserDefaults standardUserDefaults] registerDefaults:appDefaults];
}

- (void)initializeAppServices {
    [YMSBluetoothService sharedService];
}

@end