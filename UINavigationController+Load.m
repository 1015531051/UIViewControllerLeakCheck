//
//  UINavigationController+Load.m
//  yimei
//
//  Created by QF on 2017/6/16.
//  Copyright © 2017年 yixin. All rights reserved.
//

#import "UINavigationController+Load.h"
#import "NSMutableSet+SharedMutableSet.h"

@implementation UINavigationController (Load)

+(void)load{
#ifdef DEBUG
    [self exchangePopViewController];
#endif
}

+(void)exchangePopViewController{
    Method popViewControllerAnimated = class_getInstanceMethod([self class], @selector(popViewControllerAnimated:));
    Method my_popViewControllerAnimated = class_getInstanceMethod([self class], @selector(my_popViewControllerAnimated:));
    method_exchangeImplementations(popViewControllerAnimated, my_popViewControllerAnimated);
}

-(UIViewController*)my_popViewControllerAnimated:(BOOL)animated{
    NSInteger viewControllerCount = self.viewControllers.count;
    UIViewController *popViewController = self.viewControllers[viewControllerCount-1];
    [NSMutableSet addViewController:popViewController];
    
    popViewController = [self my_popViewControllerAnimated:animated];
    
    [NSMutableSet checkViewControllerLeaks];
    return popViewController;
}

@end
