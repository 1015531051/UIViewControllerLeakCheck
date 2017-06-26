//
//  NSMutableSet+SharedMutableSet.h
//  yimei
//
//  Created by QF on 2017/6/17.
//  Copyright © 2017年 yixin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableSet (SharedMutableSet)

+(NSMutableSet*)sharedMutableSet;

+(void)addViewController:(UIViewController*)viewController;

+(void)removeViewControll:(UIViewController*)viewController;

+(void)checkViewControllerLeaks;

@end
