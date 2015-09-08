//
//  MINavigationController.m
//  MINavigationControllerDemo
//
//  Created by WangLin on 11/14/13.
//  Copyright (c) 2013 im.codar. All rights reserved.
//

#import "MINavigationController.h"
#import <QuartzCore/QuartzCore.h>

@interface MINavigationController () {
    CALayer *_animationLayer;
}
@end

@implementation MINavigationController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.navigationBar.hidden = YES;
    _animationLayer = [CALayer layer];
    _animationLayer.delegate = self;
    _animationLayer.frame = self.view.bounds;
    _animationLayer.masksToBounds = YES;
    [_animationLayer setContentsGravity:kCAGravityBottomLeft];
    [self.view.layer addSublayer:_animationLayer];

    _duration=_duration==0?0.4:_duration;
    _scale = _scale==0?0.9:_scale;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    _animationLayer.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadAnimationLayer {
    UIGraphicsBeginImageContext(self.visibleViewController.view.bounds.size);
    [self.visibleViewController.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [_animationLayer setContents:(id) viewImage.CGImage];
    [_animationLayer setHidden:NO];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [_animationLayer removeFromSuperlayer];
    [self.view.layer insertSublayer:_animationLayer atIndex:0];
    if (animated) {
        [self loadAnimationLayer];
        UIView *toView = [viewController view];
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
        [animation setFromValue:[NSValue valueWithCATransform3D:CATransform3DMakeTranslation(self.view.bounds.size.width, 0, 0)]];
        [animation setToValue:[NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0, 0, 0)]];
        [animation setDuration:_duration];
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeBoth;
        [toView.layer addAnimation:animation forKey:@"fromRight"];

        CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"transform"];
        [animation1 setToValue:[NSValue valueWithCATransform3D:CATransform3DMakeScale(_scale, _scale, _scale)]];
        [animation1 setDuration:_duration];
        animation1.delegate = self;
        animation1.removedOnCompletion = NO;
        animation1.fillMode = kCAFillModeBoth;
        [_animationLayer addAnimation:animation1 forKey:@"scale"];
    }
    [super pushViewController:viewController animated:NO];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    [_animationLayer removeFromSuperlayer];
    [self.view.layer insertSublayer:_animationLayer above:self.navigationBar.layer];
    if (animated) {
        [self loadAnimationLayer];
        UIView *toView = [[self.viewControllers objectAtIndex:[self.viewControllers indexOfObject:self.visibleViewController] - 1] view];
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
        [animation setFromValue:[NSValue valueWithCATransform3D:CATransform3DIdentity]];
        [animation setToValue:[NSValue valueWithCATransform3D:CATransform3DMakeTranslation(self.view.bounds.size.width, 0, 0)]];
        [animation setDuration:_duration];
        animation.delegate = self;
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeBoth;
        [_animationLayer addAnimation:animation forKey:@"fromLeft"];

        CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"transform"];
        [animation1 setFromValue:[NSValue valueWithCATransform3D:CATransform3DMakeScale(_scale, _scale, _scale)]];
        [animation1 setToValue:[NSValue valueWithCATransform3D:CATransform3DIdentity]];
        [animation1 setDuration:_duration];
        animation1.delegate = self;
        animation1.removedOnCompletion = NO;
        animation1.fillMode = kCAFillModeBoth;
        [toView.layer addAnimation:animation1 forKey:@"scale"];
    }
    return [super popViewControllerAnimated:NO];
}

- (void)animationDidStop:(CAAnimation *)animation finished:(BOOL)flag {
    [_animationLayer setContents:nil];
    [_animationLayer removeAllAnimations];
    [self.visibleViewController.view.layer removeAllAnimations];
}


@end
