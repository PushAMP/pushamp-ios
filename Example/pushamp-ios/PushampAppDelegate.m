//
//  PushampAppDelegate.m
//  pushamp-ios
//
//  Created by CocoaPods on 03/25/2015.
//  Copyright (c) 2014 Dmitry Ziltcov. All rights reserved.
//

#import "PushampAppDelegate.h"

@implementation PushampAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}
- (void)applicationDidBecomeActive:(UIApplication *)application
{
#if DEBUG
    [PushAMP engageWithAPIKey:@"iosdev_apptoken" delegate:self];
#else
    [PushAMP engageWithAPIKey:@"iosprod_apptoken" delegate:self];
#endif
    
    //now ask the user if they want to recieve push notifications. You can place this in another part of your app.
    [[PushAMP shared] registerForRemoteNotifications];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)tokenData
{
    // Call the convenience method registerDeviceToken, this helps us track device tokens for you
    [[PushAMP shared] registerDeviceToken:tokenData];
    
    // This would be a good time to save the token and associate it with a user that you want to notify later.
    NSString *tokenString = [PushAMP deviceTokenFromData:tokenData];
    NSLog(@"%@", tokenString);
    
    // For instance you can associate it with a user's email address
    // [[PushAMP shared] subscribeToChannel:@"user@example.com"];
    // You can then use the /broadcast endpoint to notify all devices subscribed to that email address. No need to save tokens!
    // Don't forget to unsubscribe from the channel when the user logs out of your app!
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"%@", [error description]);
    //Common reason for errors:
    //  1.) Simulator does not support receiving push notifications
    //  2.) User rejected push alert
    //  3.) "no valid 'aps-environment' entitlement string found for application"
    //      This means your provisioning profile does not have Push Notifications configured.
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
