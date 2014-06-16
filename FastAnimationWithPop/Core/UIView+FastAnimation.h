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
/**
 *  The property 'startAnimationWhenAwakeFromNib' default value is YES.
 *  The animation won't auto start if startAnimationWhenAwakeFromNib is NO.
 */
@property (nonatomic, assign) BOOL startAnimationWhenAwakeFromNib;

- (void)startFAAnimation;
- (void)stopFAAnimation;
- (void)reverseFAAnimation;
- (void)stopReverseFAAnimation;


- (void)startFAAnimationNested;
- (void)stopFAAnimationNested;
- (void)reverseFAAnimationNested;
- (void)stopReverseFAAnimationNested;


@end
