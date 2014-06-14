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
        [FAAnimationTest resetHasPerform];
    });
    
    it(@"Check prop", ^{

        NSString *type = @"SomeType@!@";
        targetView.animationType = type;
        expect(targetView.animationType).to.equal(type);
        
        NSNumber *value1 = [NSNumber numberWithDouble:3.15];
        targetView.delay = value1.doubleValue;
        expect(@(targetView.delay)).to.equal(value1);
        
        NSString *paramValue = @"SomeValue";
        [targetView setValue:paramValue forKeyPath:@"animationParams.someValue"];
        expect([targetView valueForKeyPath:@"animationParams.someValue"]).to.equal(paramValue);
        targetView.startAnimationWhenAwakeFromNib = NO;
        expect(targetView.startAnimationWhenAwakeFromNib).to.beFalsy();
    });  
    
    it(@"Normal awakeFromNib", ^{
        [targetView awakeFromNib];
    });
    
    it(@"set not exists class", ^{
        targetView.animationType = @"NotExistsClass";

        BOOL hasAssert = NO;
        @try {
            [targetView awakeFromNib];
        }
        @catch (NSException *exception){
            hasAssert = YES;
            expect(exception.description).to.equal(@"The property 'animationType' must a class name and conforms protocol 'FastAnmationProtocol'");
        }
        expect(hasAssert).to.beTruthy();
    });
    
    it(@"add test animation with full class name", ^{
       targetView.animationType = @"FAAnimationTest";

        [targetView awakeFromNib];
        expect([FAAnimationTest animationHasPerform]).will.beTruthy();
    });
    
    it(@"add test animation with short name", ^{
        targetView.animationType = @"Test";

        [targetView awakeFromNib];
        expect([FAAnimationTest animationHasPerform]).will.beTruthy();
    });
    
    it (@"startAnimationWhenAwakeFromNib prop", ^{
        targetView.animationType = @"Test";
        targetView.startAnimationWhenAwakeFromNib = NO;
        [targetView awakeFromNib];
        expect([FAAnimationTest animationHasPerform]).will.beFalsy();
    });
    
    it(@"manual startAnimation", ^{
        targetView.animationType = @"Test";
        targetView.startAnimationWhenAwakeFromNib = NO;
        [targetView startFAAnimation];
        expect([FAAnimationTest animationHasPerform]).will.beTruthy();
    });
    afterEach(^{
        targetView = nil;
    });
    
    afterAll(^{

    });
});

SpecEnd
