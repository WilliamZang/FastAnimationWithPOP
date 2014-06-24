//
//  UIControl+FastAnimation.h
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-14.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (FastAnimation)

@property (nonatomic, copy) NSString *bindingAnimationType;

- (void)bindingFAAnimation;

- (void)unbindingFAAnimation;


@end
