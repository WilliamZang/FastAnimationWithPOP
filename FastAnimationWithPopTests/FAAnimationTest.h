//
//  TestAnimation.h
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-12.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FAAnimationBase.h"
#import "FastAnimationProtocol.h"
@interface FAAnimationTest : FAAnimationBase<FastAnimationProtocol>

- (BOOL)animationHasPerform;

@end

@interface FAAnimationTestReverse : FAAnimationTest<FastAnimationReverseProtocol>

- (BOOL)reverseAnimationHasPerform;

@end