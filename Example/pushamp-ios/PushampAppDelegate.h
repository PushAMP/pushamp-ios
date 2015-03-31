//
//  PushampAppDelegate.h
//  pushamp-ios
//
//  Created by CocoaPods on 03/25/2015.
//  Copyright (c) 2014 Dmitry Ziltcov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <pushamp-ios/PushAMP.h>

@interface PushampAppDelegate : UIResponder <UIApplicationDelegate, PushAMPDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
