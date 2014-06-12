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
@property (nonatomic, assign) CGFloat springBounciness;
@property (nonatomic, assign) CGFloat springSpeed;
@property (nonatomic, assign) CGFloat dynamicsTension;
@property (nonatomic, assign) CGFloat dynamicsFriction;
@property (nonatomic, assign) CGFloat dynamicsMass;
@property (nonatomic, assign) NSTimeInterval delay;

@end
