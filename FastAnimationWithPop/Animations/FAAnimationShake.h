//
//  FAAnimationShake.h
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-14.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FAAnimationBase.h"
#import "FastAnimationProtocol.h"

@interface FAAnimationShake : FAAnimationBase<FastAnimationProtocol>

@property (nonatomic, strong) IBInspectable NSNumber *velocity;

@end
