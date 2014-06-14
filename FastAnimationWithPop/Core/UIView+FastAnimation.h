//
//  UIView+FastAnimation.h
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-12.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FastAnimation)

@property (nonatomic, copy) NSString *animationType;
@property (nonatomic, assign) NSTimeInterval delay;
@property (nonatomic, readonly) NSMutableDictionary *animationParams;

- (void)startFAAnimation;
- (void)stopFAAnimation;
@end
