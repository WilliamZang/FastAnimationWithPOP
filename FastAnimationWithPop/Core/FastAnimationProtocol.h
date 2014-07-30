//
//  FastAnimation.h
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-12.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FastAnimationProtocol <NSObject>

@optional
+ (void)performAnimation:(UIView *)view;
+ (void)stopAnimation:(UIView *)view;

- (void)startAnimation;
- (void)stopAnimation;
@end

@protocol ControlFastAnimationProtocol <NSObject>

+ (void)bindingAnimation:(UIControl *)control;

+ (void)unbindingAnimation:(UIControl *)control;

@end

@protocol FastAnimationReverseProtocol <NSObject>

@optional
+ (void)reverseAnimation:(UIView *)view;
+ (void)stopReverse:(UIView *)view;

- (void)reverseAnimation;
- (void)stopReverse;

@end