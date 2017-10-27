//
//  UIViewController+Present.m
//  RCTTFChangeAppIcon
//
//  Created by 左建军 on 2017/10/27.
//  Copyright © 2017年 tuofeng. All rights reserved.
//

#import "UIViewController+Present.h"
#import <objc/runtime.h>

@implementation UIViewController (Present)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method presentM = class_getInstanceMethod(self.class, @selector(presentViewController:animated:completion:));
        Method presentSwizzlingM = class_getInstanceMethod(self.class, @selector(dy_presentViewController:animated:completion:));
        
        method_exchangeImplementations(presentM, presentSwizzlingM);
    });
}

- (void)dy_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    
    if ([viewControllerToPresent isKindOfClass:[UIAlertController class]]) {
        UIAlertController *alertController = (UIAlertController *)viewControllerToPresent;
        if (alertController.title == nil && alertController.message == nil) {
            BOOL changeAppIconAlert = [[NSUserDefaults standardUserDefaults] boolForKey:@"changeAppIconAlert"];
            if (changeAppIconAlert == YES) {
                [self dy_presentViewController:viewControllerToPresent animated:flag completion:completion];
            }
            return;
        } else {
            [self dy_presentViewController:viewControllerToPresent animated:flag completion:completion];
            return;
        }
    }
    
    [self dy_presentViewController:viewControllerToPresent animated:flag completion:completion];
}


@end
