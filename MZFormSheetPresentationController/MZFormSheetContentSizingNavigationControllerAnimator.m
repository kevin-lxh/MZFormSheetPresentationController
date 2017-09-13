//
//  MZFormSheetContentSizingNavigationAnimator.m
//  MZFormSheetPresentationController Objective-C Example
//
//  Created by Michal Zaborowski on 21.10.2015.
//  Copyright © 2015 Michal Zaborowski. All rights reserved.
//

#import "MZFormSheetContentSizingNavigationControllerAnimator.h"
#import "MZFormSheetPresentationController.h"
#import "MZFormSheetPresentationViewController.h"

@implementation MZFormSheetContentSizingNavigationControllerAnimator

- (instancetype)init {
    if (self = [super init]) {
        _duration = 0.25;
    }
    return self;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *targetView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    UIViewController *targetViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:targetView];
    targetView.frame = [transitionContext finalFrameForViewController:targetViewController];
    
    MZFormSheetPresentationController *presentationController = (id)targetViewController.mz_formSheetPresentingPresentationController.presentationController;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        [presentationController layoutPresentingViewController];
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return self.duration;
}

@end
