//
//  FAAnimationButtonScale.m
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-26.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import "FastAnimationWithPop.h"

#define kScaleBindingObject  @"animationParams.scaleBindingObject"
@implementation FAAnimationButtonScale

+ (void)bindingAnimation:(UIControl *)control
{
    id obj = [[FAAnimationButtonScale alloc] init];
    [control setValue:obj forKeyPath:kScaleBindingObject];
    [control addTarget:obj action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [control addTarget:obj action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpInside|UIControlEventTouchUpOutside];
}

+ (void)unbindingAnimation:(UIControl *)control
{
    id obj = [control valueForKeyPath:kScaleBindingObject];
    [control removeTarget:obj action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [control removeTarget:obj action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpInside|UIControlEventTouchUpOutside];

}

- (IBAction)touchDown:(id)sender
{
    [FAAnimationZoomOut performAnimation:sender];
}

- (IBAction)touchUp:(id)sender
{
    [FAAnimationZoomOut stopAnimation:sender];
    [FAAnimationZoomOut reverseAnimation:sender];
}

@end
