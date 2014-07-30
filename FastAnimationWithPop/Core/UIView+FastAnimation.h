//
//  UIView+FastAnimation.h
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-12.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FAAnimationBase;
@interface UIView (FastAnimation)

- (void)startFAAnimation;
- (void)stopFAAnimation;
- (void)reverseFAAnimation;
- (void)stopReverseFAAnimation;


- (void)startFAAnimationNested;
- (void)stopFAAnimationNested;
- (void)reverseFAAnimationNested;
- (void)stopReverseFAAnimationNested;

- (void)addAnimation:(FAAnimationBase *)animation;
- (void)removeAnimation:(FAAnimationBase *)animation;

@end
