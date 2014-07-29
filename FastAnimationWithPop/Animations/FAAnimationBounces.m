//
//  FAAnimationBounceRight.m
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-12.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import "FastAnimationWithPop.h"

@interface FAAnimationBounceBase()
@property (nonatomic, strong) POPSpringAnimation *internalAnimation;

- (NSString *)animationPropertyNamed;
- (void)preConfig;
@end

@implementation FAAnimationBounceBase

- (void)configView:(UIView *)view
{
    [super configView:view];
    self.internalAnimation = [POPSpringAnimation animationWithPropertyNamed:[self animationPropertyNamed]];
    [self preConfig];
}

- (NSString *)animationPropertyNamed
{
    NSAssert(NO, @"implement in subclass");
    return nil;
}

- (void)preConfig
{
    if (self.springBounciness) {
        self.internalAnimation.springBounciness = self.springBounciness.floatValue;
	}
    if (self.springSpeed) {
        self.internalAnimation.springSpeed = self.springSpeed.floatValue;
	}
    if (self.dynamicsTension) {
        self.internalAnimation.dynamicsTension = self.dynamicsTension.floatValue;
	}
    if (self.dynamicsFriction) {
        self.internalAnimation.dynamicsFriction = self.dynamicsFriction.floatValue;
	}
    if (self.dynamicsMass) {
        self.internalAnimation.dynamicsMass = self.dynamicsMass.floatValue;
	}
}

- (void)startAnimation
{
    [self.bindingView.layer pop_addAnimation:self.internalAnimation forKey:[@((NSInteger)self) stringValue]];
}

- (void)stopAnimation
{
    [self.bindingView.layer pop_removeAnimationForKey:[@((NSInteger)self) stringValue]];
}

@end

@implementation FAAnimationBounceRight

- (NSString *)animationPropertyNamed
{
    return kPOPLayerTranslationX;
}

- (void)preConfig
{
    [super preConfig];
    self.bindingView.layer.transform = CATransform3DMakeTranslation(-320, 0, 0);
    self.internalAnimation.toValue = @(0);
}
@end

@implementation FAAnimationBounceLeft

- (NSString *)animationPropertyNamed
{
    return kPOPLayerTranslationX;
}

- (void)preConfig
{
    [super preConfig];
    self.bindingView.layer.transform = CATransform3DMakeTranslation(320, 0, 0);
    self.internalAnimation.toValue = @(0);
}

@end

@implementation FAAnimationBounceUp

- (NSString *)animationPropertyNamed
{
    return kPOPLayerTranslationY;
}

- (void)preConfig
{
    [super preConfig];
    self.bindingView.layer.transform = CATransform3DMakeTranslation(0, 568, 0);
    self.internalAnimation.toValue = @(0);
}

@end

@implementation FAAnimationBounceDown

- (NSString *)animationPropertyNamed
{
    return kPOPLayerTranslationY;
}

- (void)preConfig
{
    [super preConfig];
    self.bindingView.layer.transform = CATransform3DMakeTranslation(0, -568, 0);
    self.internalAnimation.toValue = @(0);
}
@end
