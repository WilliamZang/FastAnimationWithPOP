//
//  UIView+FastAnimationSpec.m
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-12.
//  Copyright 2014年 WilliamZang. All rights reserved.
//

#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "UIView+FastAnimation.h"
#import "FAAnimationTest.h"

SpecBegin(UIViewFastAnimation)

describe(@"UIView+FastAnimation", ^{
    __block UIView *targetView = nil;
    beforeAll(^{

    });
    
    beforeEach(^{
        targetView = [[UIView alloc] init];
    });
    
    afterEach(^{
        targetView = nil;
    });
    
    it(@"awake from nib", ^{
        FAAnimationTest *testAnimation = [[FAAnimationTest alloc] init];
        testAnimation.bindingView = targetView;
        [testAnimation awakeFromNib];
        expect(testAnimation.animationHasPerform).will.beTruthy();
    });
    
    it(@"manual animation", ^{
        FAAnimationTest *testAnimation = [[FAAnimationTest alloc] init];
        testAnimation.bindingView = targetView;
        [targetView startFAAnimation];
        expect(testAnimation.animationHasPerform).will.beTruthy();
    });
    
    it(@"check memory leak", ^{
        __weak FAAnimationTest *testAnimationWeak = nil;
        @autoreleasepool {
            FAAnimationTest *testAnimation = [[FAAnimationTest alloc] init];
            testAnimationWeak = testAnimation;
            testAnimation.bindingView = targetView;
            targetView = nil;
        }
        expect(testAnimationWeak).to.beNil();
        @autoreleasepool {
            FAAnimationTest *testAnimation = [[FAAnimationTest alloc] init];
            testAnimationWeak = testAnimation;
            [targetView addAnimation:testAnimation];
            targetView = nil;
        }
        expect(testAnimationWeak).to.beNil();
        
    });
    afterAll(^{

    });
});

SpecEnd
