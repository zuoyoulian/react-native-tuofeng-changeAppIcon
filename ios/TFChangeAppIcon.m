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
    
    [[UIApplication sharedApplication] setAlternateIconName:iconName completionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"change App Icon error: %@", error);
        }
    }];
}

//+(void)load {
//    
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Method presentM = class_getInstanceMethod(self.class, @selector(presentViewController:animated:completion:));
//        Method presentSwizzlingM = class_getInstanceMethod(self.class, @selector(dy_presentViewController:animated:completion:));
//        
//        method_exchangeImplementations(presentM, presentSwizzlingM);
//    });
//}
//
//- (void)dy_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
//    
//    if ([viewControllerToPresent isKindOfClass:[UIAlertController class]]) {
//        NSLog(@"title : %@",((UIAlertController *)viewControllerToPresent).title);
//        NSLog(@"message : %@",((UIAlertController *)viewControllerToPresent).message);
//        
//        UIAlertController *alertController = (UIAlertController *)viewControllerToPresent;
//        if (alertController.title == nil && alertController.message == nil) {
////            if (self.alt) {
////                [self dy_presentViewController:viewControllerToPresent animated:flag completion:completion];
////            }
//            return;
//        } else {
//            [self dy_presentViewController:viewControllerToPresent animated:flag completion:completion];
//            return;
//        }
//    }
//    
//    [self dy_presentViewController:viewControllerToPresent animated:flag completion:completion];
//}

@end









