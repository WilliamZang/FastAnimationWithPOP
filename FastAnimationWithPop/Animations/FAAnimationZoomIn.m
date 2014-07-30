//
//  FAAnimationZoomInX.m
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-14.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//
#import "FastAnimationWithPop.h"

@interface FAAnimationZoomInBase()

@property (nonatomic, strong) POPSpringAnimation *internalAnimation;
@property (nonatomic, strong) POPSpringAnimation *internalReverseAnimation;

- (NSString *)animationPropertyNamed;
- (void)preConfig;

@end

@implementation FAAnimationZoomInBase

- (void)configView:(UIView *)view
{
    [super configView:view];
    self.internalAnimation = [POPSpringAnimation animationWithPropertyNamed:[self animationPropertyNamed]];
    self.internalReverseAnimation = [POPSpringAnimation animationWithPropertyNamed:[self animationPropertyNamed]];
    [self preConfig];
}

- (NSString *)animationPropertyNamed
{
    NSAssert(NO, @"implement in subclass");
    return nil;
}

- (void)preConfig
{
    self.internalAnimation.toValue = @(1.0);
}

- (void)startAnimation
{
    [self.bindingView.layer pop_addAnimation:self.internalAnimation forKey:SELF_IDENTIFICATION];
}

- (void)stopAnimation
{
    [self.bindingView.layer pop_removeAnimationForKey:SELF_IDENTIFICATION];
}

- (void)reverseAnimation
{
    [self.bindingView.layer pop_addAnimation:self.internalReverseAnimation forKey:[NSString stringWithFormat:@"-%@", SELF_IDENTIFICATION]];
}

- (void)stopReverse
{
    [self.bindingView.layer pop_removeAnimationForKey:[NSString stringWithFormat:@"-%@", SELF_IDENTIFICATION]];
}
@end


@implementation FAAnimationZoomInX

- (NSString *)animationPropertyNamed
{
    return kPOPLayerScaleX;
}

- (void)preConfig
{
    [super preConfig];
    self.bindingView.layer.transform = CATransform3DMakeScale(0.001, 1.0, 1.0);
    self.internalAnimation.toValue = @(1.0);
    self.internalReverseAnimation.toValue = @(0.001);
}

@end

@implementation FAAnimationZoomInY

- (NSString *)animationPropertyNamed
{
    return kPOPLayerScaleY;
}

- (void)preConfig
{
    [super preConfig];
    self.bindingView.layer.transform = CATransform3DMakeScale(1.0, 0.001, 1.0);
    self.internalAnimation.toValue = @(1.0);
    self.internalReverseAnimation.toValue = @(0.001);
}
@end
