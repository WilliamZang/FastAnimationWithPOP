//
//  NSObject+FastAnimation.m
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-16.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import "NSObject+FastAnimation.h"
#import "FastAnimationWithPop.h"
#import <objc/runtime.h>

@implementation NSObject (FastAnimation)

- (void)swizzle_awakeFromNib
{
    [self swizzle_awakeFromNib];
    UIView *view = (UIView *)self;
    if ([view isKindOfClass:UIView.class] && view.startAnimationWhenAwakeFromNib) {
        [view startFAAnimation];
    }
    
    UIControl *control = (UIControl *)self;
    if ([control isKindOfClass:UIControl.class]) {
        [control bindingFAAnimation];
    }
    
}

+ (void)load
{
    Method original, swizzle;
    
    original = class_getInstanceMethod(self, @selector(awakeFromNib));
    swizzle = class_getInstanceMethod(self, @selector(swizzle_awakeFromNib));
    method_exchangeImplementations(original, swizzle);
}
@end
