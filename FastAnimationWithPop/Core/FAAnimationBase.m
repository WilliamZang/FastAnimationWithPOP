//
//  FAAnimationBase.m
//  FastAnimationWithPop
//
//  Created by zangchengwei on 14-7-28.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import "FastAnimationWithPop.h"

@implementation FAAnimationBase

- (void)awakeFromNib
{
    [super awakeFromNib];
    if (!self.stopPerformWhenAwake && [self.class conformsToProtocol:@protocol(FastAnimationProtocol)]) {
        [self performSelector:@selector(startAnimation) withObject:nil afterDelay:self.performAwakeAnimationDelay];
    }
}

- (void)setBindingView:(UIView *)bindingView
{
    if (_bindingView != bindingView) {
        [self releaseLifetimeFromObject:_bindingView];
        [self bindLifetimeToObject:bindingView];
    }
}

- (void)bindLifetimeToObject:(UIView *)view
{
    [view addAnimation:self];
}

- (void)releaseLifetimeFromObject:(UIView *)view
{
    [view removeAnimation:self];
}

- (void)configView:(UIView *)view
{
    _bindingView = view;
}
@end
