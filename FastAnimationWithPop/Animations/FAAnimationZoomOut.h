//
//  FAAnimationZoomOut.h
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-26.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FAAnimationBase.h"
#import "FastAnimationProtocol.h"

@interface FAAnimationZoomOut : FAAnimationBase <FastAnimationProtocol, FastAnimationReverseProtocol>

@property (nonatomic, strong) IBInspectable NSNumber *scale;

@end
