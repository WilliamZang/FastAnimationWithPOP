//
//  TestAnimation.m
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-12.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import "FAAnimationTest.h"

static BOOL g_animationHasPerform = NO;
@implementation FAAnimationTest

+ (BOOL)animationHasPerform
{
    return g_animationHasPerform;
}

+ (void)performAnimation:(id)view duration:(NSTimeInterval)duration
{
    g_animationHasPerform = YES;
}

+ (void)resetHasPerform
{
    g_animationHasPerform = NO;
}
@end
