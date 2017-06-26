//
//  NSMutableSet+SharedMutableSet.m
//  yimei
//
//  Created by QF on 2017/6/17.
//  Copyright © 2017年 yixin. All rights reserved.
//

#import "NSMutableSet+SharedMutableSet.h"

@implementation NSMutableSet (SharedMutableSet)

+(NSMutableSet*)sharedMutableSet{
    static NSMutableSet *sharedMutableSet = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMutableSet = [[NSMutableSet alloc] init];
    });
    
    return sharedMutableSet;
}


+(void)addViewController:(UIViewController *)viewController{
    NSMutableSet * sharedMutableSet = [NSMutableSet sharedMutableSet];
    NSString *VCName = NSStringFromClass([viewController class]);
    [sharedMutableSet addObject:VCName];
}

+(void)removeViewControll:(UIViewController *)viewController{
    NSMutableSet * sharedMutableSet = [NSMutableSet sharedMutableSet];
    NSString *VCName = NSStringFromClass([viewController class]);
    [sharedMutableSet removeObject:VCName];
}

+(void)checkViewControllerLeaks{
    NSMutableSet * sharedMutableSet = [NSMutableSet sharedMutableSet];
    for (NSString *VCName in sharedMutableSet) {
        NSLog(@"\n\n\n%@   Maybe leaked!\n\n\n",VCName);
    }
}

@end
