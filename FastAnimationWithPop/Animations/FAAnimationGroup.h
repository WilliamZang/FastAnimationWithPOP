//
//  FAAnimationGroup.h
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-14.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FastAnimationProtocol.h"
/**
 *  Use animationParams.animations property to description which animations
 *  include in group, separat with ',' or ' ' . It must not be nil!
 */
#define kIncludeAnimations       (@"animationParams.animations")

@interface FAAnimationGroup : NSObject<FastAnimationProtocol>

@end
