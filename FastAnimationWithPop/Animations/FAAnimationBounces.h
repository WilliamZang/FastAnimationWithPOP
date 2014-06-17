//
//  FAAnimationBounceRight.h
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-12.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FastAnimationProtocol.h"

#define kSpringBounciness   (@"animationParams.springBounciness")
#define kSpringSpeed        (@"animationParams.springSpeed")
#define kDynamicsTension    (@"animationParams.dynamicsTension")
#define kDynamicsFriction   (@"animationParams.dynamicsFriction")
#define kDynamicsMass       (@"animationParams.dynamicsMass")


@interface FAAnimationBounceRight : NSObject<FastAnimationProtocol, FastAnimationReverseProtocol>

@end

@interface FAAnimationBounceLeft : NSObject<FastAnimationProtocol, FastAnimationReverseProtocol>

@end

@interface FAAnimationBounceUp : NSObject<FastAnimationProtocol, FastAnimationReverseProtocol>

@end

@interface FAAnimationBounceDown : NSObject<FastAnimationProtocol, FastAnimationReverseProtocol>

@end