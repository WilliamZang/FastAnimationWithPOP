//
//  FAAnimationBase.h
//  FastAnimationWithPop
//
//  Created by zangchengwei on 14-7-28.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FAAnimationBase : NSObject

@property (nonatomic, weak) IBOutlet UIView *bindingView;

@property (nonatomic, assign) IBInspectable BOOL stopPerformWhenAwake;

@property (nonatomic, assign) IBInspectable CGFloat performAwakeAnimationDelay;

- (void)configView:(UIView *)view;

- (void)bindLifetimeToObject:(UIView *)view;

- (void)releaseLifetimeFromObject:(UIView *)view;

@end
