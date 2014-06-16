//
//  TestAnimation.h
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-12.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FastAnimationProtocol.h"
@interface FAAnimationTest : NSObject<FastAnimationProtocol>

+ (BOOL)animationHasPerform;
+ (void)resetHasPerform;
@end

@interface FAAnimationTestReverse : FAAnimationTest<FastAnimationReverseProtocol>

+ (BOOL)reverseAnimationHasPerform;

@end