//
//  UIControl+FastAnimation.m
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-14.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import "FastAnimationWithPop.h"
#import <objc/runtime.h>
#import "FastAnimiationUitls.h"

@implementation UIControl (FastAnimation)

DEFINE_RW_STRING_PROP(bindingAnimationType, setBindingAnimationType)

- (void)bindingFAAnimation
{
    if (self.bindingAnimationType) {
        Class animation = animationClassForString(self.bindingAnimationType);
        NSAssert([animation conformsToProtocol:@protocol(ControlFastAnimationProtocol)], @"If you want to binding an animation, the property 'bindingAnimationType' must a class name and conforms protocol 'FastAnmationProtocol'");
        [animation bindingAnimation:self];
    }

}

- (void)unbindingFAAnimation
{
    if (self.bindingAnimationType) {
        Class animation = animationClassForString(self.bindingAnimationType);
        NSAssert([animation conformsToProtocol:@protocol(ControlFastAnimationProtocol)], @"If you want to unbinding an animation, the property 'bindingAnimationType' must a class name and conforms protocol 'FastAnmationProtocol'");
        [animation unbindingAnimation:self];
    }
}
@end
