//
//  TestAnimation.m
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-12.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import "FAAnimationTest.h"

@interface FAAnimationTest()
@property (nonatomic, assign) BOOL animationHasPerform;

@end

@interface FAAnimationTestReverse()
@property (nonatomic, assign) BOOL reverseAnimationHasPerform;

@end


@implementation FAAnimationTest

- (void)startAnimation
{
    self.animationHasPerform = YES;
}

- (void)stopAnimation
{

}

@end

@implementation FAAnimationTestReverse

- (void)reverseAnimation
{
    self.reverseAnimationHasPerform = YES;
}

- (void)stopReverse
{
    
}

@end