//
//  FAAnimationBounceRight.h
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-12.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FAAnimationBounceBase : FAAnimationBase

@property (nonatomic, strong) IBInspectable NSNumber *springBounciness;
@property (nonatomic, strong) IBInspectable NSNumber *springSpeed;
@property (nonatomic, strong) IBInspectable NSNumber *dynamicsTension;
@property (nonatomic, strong) IBInspectable NSNumber *dynamicsFriction;
@property (nonatomic, strong) IBInspectable NSNumber *dynamicsMass;

@end



@interface FAAnimationBounceRight : FAAnimationBounceBase

@end

@interface FAAnimationBounceLeft : FAAnimationBounceBase

@end

@interface FAAnimationBounceUp : FAAnimationBounceBase

@end

@interface FAAnimationBounceDown : FAAnimationBounceBase

@end