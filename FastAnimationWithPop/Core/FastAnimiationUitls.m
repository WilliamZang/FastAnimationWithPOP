//
//  FastAnimiationUitls.m
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-16.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import "FastAnimiationUitls.h"

Class animationClassForString(NSString *animationType) {
    Class animationClass = NSClassFromString(animationType);
    if (animationClass == nil) {
        animationClass = NSClassFromString([@"FAAnimation" stringByAppendingString:animationType]);
    }
    return animationClass;
    
}