//
//  FAAnimationButtonScale.m
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-26.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import "FastAnimationWithPop.h"

@interface FAAnimationButtonScale()

@property (nonatomic, weak) FAAnimationZoomOut *internalAnimation;

@end

@implementation FAAnimationButtonScale

- (void)configView:(UIView *)view
{
    [super configView:view];
    NSAssert([view isKindOfClass:[UIControl class]], @"bindingView must a control!");
    FAAnimationZoomOut *animation = [[FAAnimationZoomOut alloc] init];
    self.internalAnimation = animation;
    self.internalAnimation.bindingView = view;
    UIControl *control = (UIControl *)view;
    [control addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [control addTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpInside|UIControlEventTouchUpOutside];
    
}

- (void)releaseLifetimeFromObject:(UIView *)view
{
    UIControl *control = (UIControl *)view;
    [control removeTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [control removeTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpInside|UIControlEventTouchUpOutside];
}

- (IBAction)touchDown:(id)sender
{
    [self.internalAnimation startAnimation];
}

- (IBAction)touchUp:(id)sender
{
    [self.internalAnimation stopAnimation];
    [self.internalAnimation reverseAnimation];
}

@end
