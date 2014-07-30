//
//  FastAnimation.h
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-12.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FastAnimationProtocol <NSObject>

- (void)startAnimation;
- (void)stopAnimation;
@end

@protocol FastAnimationReverseProtocol <NSObject>

- (void)reverseAnimation;
- (void)stopReverse;

@end