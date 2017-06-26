//
//  UIViewController+Load.m
//  yimei
//
//  Created by YJD on 2017/6/16.
//  Copyright © 2017年 yixin. All rights reserved.
//

#import "UIViewController+Load.h"
#import <objc/runtime.h>
#import "NSMutableSet+SharedMutableSet.h"

@implementation UIViewController (Load)

+(void)load{
#ifdef DEBUG
    [self exchangeMethod];
#endif
}

+(void)exchangeMethod{
    Method dismissViewControllerMethod = class_getInstanceMethod([self class], @selector(dismissViewControllerAnimated:completion:));
    Method my_dismissViewControllerMethod = class_getInstanceMethod([self class], @selector(my_dismissViewControllerAnimated:completion:));
    method_exchangeImplementations(dismissViewControllerMethod, my_dismissViewControllerMethod);
    
    Method deallocMethod = class_getInstanceMethod([self class], NSSelectorFromString(@"dealloc"));
    Method my_deallocMethod = class_getInstanceMethod([self class], @selector(my_dealloc));
    method_exchangeImplementations(deallocMethod, my_deallocMethod);
}

-(void)my_dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion{
    [NSMutableSet addViewController:self];
    [self my_dismissViewControllerAnimated:flag completion:completion];
    [NSMutableSet checkViewControllerLeaks];
}

-(void)my_dealloc{
    [NSMutableSet removeViewControll:self];
    [self my_dealloc];
}


@end
