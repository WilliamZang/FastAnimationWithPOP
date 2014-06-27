FastAnimation
=============
[![Build Status](https://travis-ci.org/WilliamZang/FastAnimationWithPOP.svg?branch=master)](https://travis-ci.org/WilliamZang/FastAnimationWithPOP)

A very simplifty animation framework. Powerby [Facebook POP](https://github.com/facebook/pop). Use **fast animation** you can add animations without any lines of code.

You can see the DEMO in project [DEMO](https://github.com/WilliamZang/FastAnimationWithPopDemo).

**If you like this, please star me!**

![Demo](https://raw.githubusercontent.com/WilliamZang/FastAnimationWithPOP/master/Docs/demo.gif)
## Features
* Use property to add an animation to any view.
* Auto run when awake from NIB.
* You can also stop autorun and manual run animations.
* Control the animation's detail, like delay, duration time, etc.
* Use property to binding animations to a control.
* Easy way to extension animations only create a class comform protocol `FastAnimationProtocol`,`ControlFastAnimationProtocol`, and `FastAnimationReverseProtocol`.

## Requirements

Minimum iOS Target: iOS 6.0+

XCode version: 5.0+

## Install
The easiest way to install FastAnimation is using [CocoaPods](http://cocoadocs.org):

1. Add the pod to podfile `pod 'FastAnimation'`

2. Refresh your project pods `pod install`

If you want to see the new features, you can add pod `pod 'FastAnimation', :head` to fetch the newest version.

## Usage

### 1. Use it with stroy board

You can add an animation to a view by setup the user defined runtime attributes.

![StroyBoard1](https://raw.githubusercontent.com/WilliamZang/FastAnimationWithPOP/master/Docs/stroyBoard1.png)

![StroyBoard2](https://raw.githubusercontent.com/WilliamZang/FastAnimationWithPOP/master/Docs/stroyBoard2.png)

Here's some property's meaning:

#### In UIView

* animationType
 
	What animation would you like? You can give the answer with this property.
	You can use full class name, or without `FAAnimation` prefix.
	
* delay

	When you don't want to start animation immediately, you can set a value for `delay` time with seconds.
	
* animationParams

	This has a lot of functions. Each animation need own params. It's all in the property `animationParams`
	
	You can find the infomation in each animation header. Like this

```objective-c
#define kSpringBounciness   (@"animationParams.springBounciness")
#define kSpringSpeed        (@"animationParams.springSpeed")
#define kDynamicsTension    (@"animationParams.dynamicsTension")
#define kDynamicsFriction   (@"animationParams.dynamicsFriction")
#define kDynamicsMass       (@"animationParams.dynamicsMass")
```
	
* startAnimationWhenAwakeFromNib

	Don't want to auto run? No problem. You can set `NO` to property `startAnimationWhenAwakeFromNib`

#### In UIControl

* bindingAnimationType

	You can binding control's event with some animations. 


### 2. Use it by coding

To use it by coding is as simply as using the stroy board.

You can just set the animation type property and perform ```- (void)startFAAnimation```. Like this

```objective-c
UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
view.backgroundColor = [UIColor redColor];
view.animationType = @"Shake";
view.animationParams[@"velocity"] = @-7000;
// You can also set params like this
// [view setValue:@-7000 forKeyPath:kShakeVelocity];
[view startFAAnimation];
```

You can also use other methods like:

```objective-c
// In UIView instance.
- (void)startFAAnimation;
- (void)reverseFAAnimation;
// In UIControl instance.
- (void)bindingFAAnimation;
- (void)unbindingFAAnimation;
```
### 3. Extension a new animiation

To extension a new animation, you just need create a new class conform protocol `FastAnimationProtocol`,`ControlFastAnimationProtocol`, and `FastAnimationReverseProtocol`.

Like this:

```objective-c
// new_animation.h
@interface FAAnimationNewAnimation : NSObject<FastAnimationProtocol, 
FastAnimationReverseProtocol> // Maybe only FastAnimationProtocol

@end
// new_animation.m
@implementation FAAnimationBounceRight

+ (void)performAnimation:(UIView *)view
{
    // some thing you like.
}

+ (void)stopAnimation:(UIView *)view
{
    // some thing you like.
}

+ (void)reverseAnimation:(UIView *)view
{
     // some thing you like.
}

+ (void)stopReverse:(UIView *)view
{
     // some thing you like.
}
@end

```

### 4. More animation control

* stop animations:

If you want to stop animation, you can use following methods in UIView instance.

```objective-c
- (void)stopFAAnimation;
- (void)stopReverseFAAnimation;
```

* nested animatinons:

You can use following methods in UIView instance to make a nested animation. All the subviews may move on.

```objective-c
- (void)startFAAnimationNested;
- (void)stopFAAnimationNested;
- (void)reverseFAAnimationNested;
- (void)stopReverseFAAnimationNested;
```

### Now included animations:

* Bounce animations: `BounceLeft`,`BounceRight`,`BounceUp`,`BounceDown`
* Zoom in animations: `ZoomInX`,`ZoomInY`
* Shake animation
* Group animation
* Zoom out animation
* Button scale animation
* **More animations are waiting for your contributing...**

## TODO

* Make the DEMO more beautiful.
* Transition animiatons.
* Make sure all the features have unit tests.
* More fun and powerful animations.
* iOS 5 support.
* Swift support.

# Contributing
First off, thank you for considering contributing to FastAnimation. It's people like you that make FastAnimation such a great library.

```Not only add features or fix bugs, you can also fix my language mistakes(Sorry about my English!) or add more unit test or more guides or what ever.```

### 1. Where do I go from here?

If you've noticed a bug or have a question you can [make one issue](https://github.com/WilliamZang/FastAnimationWithPOP/issues/new)!

### 2. Fork & create a branch

If this is something you think you can fix, then
[fork FastAnimationWithPOP](https://help.github.com/articles/fork-a-repo)
and create a branch with a descriptive name.

If you want to give some beautiful DEMO, then fork [FastAnimationWithPopDemo](https://github.com/WilliamZang/FastAnimationWithPopDemo).

A good branch name would be (where issue #325 is the ticket you're working on):

```sh
git checkout -b 325-add-new-anmiation
```

### 3. Implement your fix or feature

At this point, you should be ready to make your changes! Don't hesitate to ask for help;
everyone is a beginner at first :smile_cat:

### 4. Sync implement the DEMO

If you add a new animation. You'd better to add effect to [FastAnimationWithPopDemo](https://github.com/WilliamZang/FastAnimationWithPopDemo) project.

### 5. Unit test

If it's a new feature. You'd better make it's unit test. You can make unit test in target `FastAnimationWithPopTests`.

### 6. Run tests against

Once you've implemented your code, please use Command+U to test it again.

We care about quality, so your PR won't be merged until all tests pass.

### 7. Make a Pull Request

At this point, you should switch back to your master branch and make sure it's
up to date with FastAnimation's master branch:

```sh
git remote add upstream git@github.com:WilliamZang/FastAnimationWithPOP.git
git checkout master
git pull upstream master
```

Then update your feature branch from your local copy of master, and push it!

```sh
git checkout 325-add-new-anmiation
git rebase master
git push --set-upstream origin 325-add-new-anmiation
```

Finally, go to GitHub and [make a Pull Request](https://help.github.com/articles/creating-a-pull-request) :D

### 8. Keeping your Pull Request updated

If a maintainer asks you to "rebase" your PR, they're saying that a lot of code
has changed, and that you need to update your branch so it's easier to merge.

To learn more about rebasing in Git, there are a lot of
[good](http://git-scm.com/book/en/Git-Branching-Rebasing)
[resources](https://help.github.com/articles/interactive-rebase),
but here's the suggested workflow:

```sh
git checkout 325-add-new-anmiation
git pull --rebase upstream master
git push -f 325-add-new-anmiation
```



## Licensing

The MIT License (MIT)

Copyright (c) 2014 William

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.