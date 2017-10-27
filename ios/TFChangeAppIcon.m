//
//  TFChangeAppIcon.m
//  RCTTFChangeAppIcon
//
//  Created by 左建军 on 2017/10/27.
//  Copyright © 2017年 tuofeng. All rights reserved.
//

#import "TFChangeAppIcon.h"
#import <objc/runtime.h>

#define iOS10_3Later ([UIDevice currentDevice].systemVersion.floatValue >= 10.3f)

@interface TFChangeAppIcon () {
    
}

@end

@implementation TFChangeAppIcon

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(changeAppIconWithInfo:(NSDictionary *)info callback:(RCTResponseSenderBlock)callback) {
    
    if (!iOS10_3Later || ![[UIApplication sharedApplication] supportsAlternateIcons]) {
        return;
    }
    
    // icon name
    NSString * iconName = [info objectForKey: @"iconName"];
    if ([iconName isEqualToString:@""]) {
        iconName = nil;
    }
    
    BOOL changeAppIconAlert = [info objectForKey: @"alert"];
    [[NSUserDefaults standardUserDefaults] setBool:changeAppIconAlert forKey:@"changeAppIconAlert"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [[UIApplication sharedApplication] setAlternateIconName:iconName completionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"change App Icon error: %@", error);
        }
    }];
}


@end









