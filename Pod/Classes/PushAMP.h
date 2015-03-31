//
//  PushAMP.h
//  PushAMP-iOS
//
//  Created by Dmitry Ziltcov on 31/03/15.
//  Copyright (c) 2015 PushAMP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol PushAMPDelegate <NSObject>
@optional

- (void)tokenRegistrationDidFailWithError:(NSError *)error;
- (void)subscribeDidFailWithError:(NSError *)error;
- (void)unsubscribeDidFailWithError:(NSError *)error;
- (void)setBadgeDidFailWithError:(NSError *)error;

@end

@interface PushAMP : NSObject

@property (nonatomic, copy) NSString *apiKey;
@property (nonatomic, strong)NSString *deviceToken;

@property (nonatomic, weak) id<PushAMPDelegate> delegate;

/**
 * Get the shared PushAMP instance
 */
+ (PushAMP *)shared;

/**
 * Set the shared PushAMP instance's apiKey
 */
+ (void)engageWithAPIKey:(NSString *)apiKey;

/**
 * Set the shared PushAMP instance's apiKey and specify a PushAMPDelegate
 */
+ (void)engageWithAPIKey:(NSString *)apiKey delegate:(id<PushAMPDelegate>)delegate;

/**
 * Parse a device token given the raw data returned by Apple from registering for notifications
 */
+ (NSString *)deviceTokenFromData:(NSData *)tokenData;

/**
 * A convenience wrapper for [[UIApplication sharedApplication] registerForRemoteNotificationTypes:types];
 * deprecated in iOS7
 */
- (void)registerForRemoteNotificationTypes:(UIRemoteNotificationType)types;

/**
 * Preferred method for registering for notifications. Backwards compatible with iOS7
 */
- (void)registerForRemoteNotifications;

/**
 * Register the device's token with PushAMP
 */
- (void)registerDeviceToken:(NSData *)deviceToken;

/**
 * Register the device's token with PushAMP and subscribe the device's token to a broadcast channel
 */
- (void)registerDeviceToken:(NSData *)deviceToken channel:(NSString *)channel;

/**
 * Subscribe the device's token to a broadcast channel
 */
- (void)subscribeToChannel:(NSString *)channel;

/**
 * Unsubscribe the device's token from a broadcast channel
 */
- (void)unsubscribeFromChannel:(NSString *)channel;

- (void)unsubscribeFromAllChannels;

/**
 * return a list of all the channels to which the device is subscribed
 */
- (void)getChannels:(void (^)(NSArray *channels, NSError *error)) callback;
/**
 * set a list of the channels to which a device is subscribed
 */
- (void)setChannels:(NSArray*)channels;

/**
 * Set the device's badge number to the given value
 */
- (void)setBadge:(NSInteger)badge;

/**
 * Set the device's badge number to zero
 */
- (void)resetBadge;

@end