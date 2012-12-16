//
//  VVAlertBanner.m
//
//  Created by Wei Wang onevcat on 2012/12/16.
//  Copyright (c) 2012 - onevcat.com - All rights reserved.
//

#import "VVAlertBanner.h"
#import <QuartzCore/QuartzCore.h>

//Define time transition for showing and dismissing
#define TIME_TRANSITON 0.40

//
//Private Method
//
@interface VVAlertBanner ()


@property(nonatomic, assign) VVAlertBannerStyle style;

+ (VVAlertBanner *)bannerView;

- (void)showTransition;

@end

@implementation VVAlertBanner

@synthesize style = alertStyle;
@synthesize bannerTitle, bannerDetail, bannerImage, activity;

//Static vvBanner to check if alert already in view to dismiss it
static VVAlertBanner *vvBanner = nil;

#pragma mark - Lifecycle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
    }
    return self;
}

#pragma mark - Setter

- (void)setStyle:(VVAlertBannerStyle)style
{
    self.bannerImage.contentMode = UIViewContentModeScaleToFill;

    if (style == VVAlertBannerStyleDefault)
    {
        self.activity.hidden = YES;
        self.bannerImage.image = [UIImage imageNamed:@"bannerTick.png"];
    }
    else if (style == VVAlertBannerStyleConnection)
    {
        self.activity.hidden = NO;
//        self.bannerImage.image = [UIImage imageNamed:@"VVAlertBanner.bundle/metal.png"];
    }
    else if (style == VVAlertBannerStyleError)
    {
        self.activity.hidden = YES;
        self.bannerImage.image = [UIImage imageNamed:@"bannerCross.png"];
    }
}

#pragma mark - View methods

+ (VVAlertBanner *)bannerInView:(UIView *)view
                        ofStyle:(VVAlertBannerStyle)style
                      withTitle:(NSString *)title
                      andDetail:(NSString *)detail
                      hideAfter:(NSTimeInterval)interval
{
    //check if alert already in view to dismiss it
    if (vvBanner)
    {
        [vvBanner dismissAlert];
    }

    VVAlertBanner *alertBannerView = [VVAlertBanner bannerView];
    vvBanner = alertBannerView;

    if (style == VVAlertBannerStyleError)
    {
        alertBannerView.backgroundColor = [UIColor colorWithRed:1.00f green:0.61f blue:0.54f alpha:0.70f];
    }
    else if (style == VVAlertBannerStyleConnection) {
        alertBannerView.backgroundColor = [UIColor colorWithRed:0.90f green:0.74f blue:0.45f alpha:0.7f];
    }
    else
    {
        alertBannerView.backgroundColor = [UIColor colorWithRed:0.18 green:1 blue:0. alpha:0.7];
    }

    alertBannerView.bannerTitle.textColor = [UIColor whiteColor];
    alertBannerView.bannerTitle.text = title;
    alertBannerView.frame = CGRectMake(0, 0, view.bounds.size.width, 46);
    [alertBannerView setStyle:style];

    //Check if detail for alert
    if (detail)
    {
        alertBannerView.bannerDetail.textColor = [UIColor whiteColor];
        alertBannerView.bannerDetail.text = detail;
        [alertBannerView.bannerDetail sizeToFit];
    }
    else
    {
        alertBannerView.bannerDetail.hidden = YES;
        alertBannerView.bannerImage.frame = CGRectMake(15, 5, 35, 35);
        alertBannerView.bannerTitle.frame = CGRectMake(57, 12, 240, 21);
    }

    //Add alert to view
    [view addSubview:alertBannerView];

    //Add delay to dismiss alert
    if (interval != 0)
    {
        [alertBannerView performSelector:@selector(dismissAlert) withObject:view afterDelay:interval];
    }

    //Show alert in view
    return alertBannerView;
}

+ (VVAlertBanner *)bannerInView:(UIView *)view
                        ofStyle:(VVAlertBannerStyle)style
                      withTitle:(NSString *)title
                      andDetail:(NSString *)detail
                       hideWith:(SEL)selector
{
    //check if alert already in view to dismiss it
    if (vvBanner)
    {
        [vvBanner dismissAlert];
    }

    VVAlertBanner *alertBannerView = [VVAlertBanner bannerView];
    vvBanner = alertBannerView;

    if (style == VVAlertBannerStyleError)
    {
        alertBannerView.backgroundColor = [UIColor colorWithRed:1.00f green:0.61f blue:0.54f alpha:0.90f];
    }
    else if (style == VVAlertBannerStyleConnection) {
        alertBannerView.backgroundColor = [UIColor colorWithRed:0.90f green:0.74f blue:0.45f alpha:0.9f];
    }
    else
    {
        alertBannerView.backgroundColor = [UIColor colorWithRed:0.48 green:0.71 blue:0.42 alpha:0.9];
    }

    alertBannerView.bannerTitle.textColor = [UIColor whiteColor];
    alertBannerView.bannerTitle.text = title;
    alertBannerView.frame = CGRectMake(0, 0, view.bounds.size.width, 50);
    [alertBannerView setStyle:style];

    //Check if detail for alert
    if (detail)
    {
        alertBannerView.bannerDetail.textColor = [UIColor whiteColor];
        alertBannerView.bannerDetail.text = detail;
        [alertBannerView.bannerDetail sizeToFit];
    }
    else
    {
        alertBannerView.bannerDetail.hidden = YES;
        alertBannerView.bannerImage.frame = CGRectMake(15, 5, 35, 35);
        alertBannerView.bannerTitle.frame = CGRectMake(57, 12, 240, 21);
    }

    //Add alert to view
    [view addSubview:alertBannerView];

    //
    //Code to dismiss alert with a define selector
    //

    //Show alert in view
    return alertBannerView;
}

#pragma mark - Window methods

+ (VVAlertBanner *)bannerInWindow:(UIWindow *)window
                          ofStyle:(VVAlertBannerStyle)style
                        withTitle:(NSString *)title
                        andDetail:(NSString *)detail
                        hideAfter:(NSTimeInterval)interval
{
    //check if alert already in view to dismiss it
    if (vvBanner)
    {
        [vvBanner dismissAlert];
    }


    VVAlertBanner *alertBannerView = [VVAlertBanner bannerView];
    vvBanner = alertBannerView;

    alertBannerView = [self bannerInView:window ofStyle:style withTitle:title andDetail:detail hideAfter:interval];

    //Define alert's frame
    if (![UIApplication sharedApplication].statusBarHidden)
    {
        CGRect frame = alertBannerView.frame;
        frame.origin.y += [UIApplication sharedApplication].statusBarFrame.size.height;
        alertBannerView.frame = frame;
    }

    [window addSubview:alertBannerView];

    if (interval != 0)
    {
        [alertBannerView performSelector:@selector(dismissAlert) withObject:window afterDelay:interval];
    }

    //Show alert in window
    return alertBannerView;
}

+ (VVAlertBanner *)bannerInWindow:(UIWindow *)window
                          ofStyle:(VVAlertBannerStyle)style
                        withTitle:(NSString *)title
                        andDetail:(NSString *)detail
                         hideWith:(SEL)selector
{
    //check if alert already in view to dismiss it
    if (vvBanner)
    {
        [vvBanner dismissAlert];
    }


    VVAlertBanner *alertBannerView = [VVAlertBanner bannerView];
    vvBanner = alertBannerView;

    alertBannerView = [self bannerInView:window ofStyle:style withTitle:title andDetail:detail hideWith:selector];

    //Define alert's frame
    if (![UIApplication sharedApplication].statusBarHidden)
    {
        CGRect frame = alertBannerView.frame;
        frame.origin.y += [UIApplication sharedApplication].statusBarFrame.size.height;
        alertBannerView.frame = frame;
    }

    [window addSubview:alertBannerView];

    //
    //Code to Dismiss alert with a define selector
    //

    //Show alert in window
    return alertBannerView;
}

#pragma mark - Touches Events

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //If alert is touched, it dismiss
    [self dismissAlert];
}

#pragma mark - Dismiss Alert

- (void)dismissTransition
{
    CATransition *hideAlertTransition = [CATransition animation];
    [hideAlertTransition setDuration:TIME_TRANSITON];
    [hideAlertTransition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [hideAlertTransition setType:kCATransitionPush];
    [hideAlertTransition setSubtype:kCATransitionFromTop];
    [self.layer addAnimation:hideAlertTransition forKey:nil];
    self.frame = CGRectMake(0, -self.frame.size.height, self.frame.size.width, self.frame.size.height);
}

- (void)dismissAlert
{
    [self dismissTransition];
    vvBanner = nil;

    //Remove alert from view
    [self performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:TIME_TRANSITON];
}

#pragma mark - Pivate Method

- (void)showTransition
{
    CATransition *transition = [CATransition animation];
    transition.duration = TIME_TRANSITON;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromBottom;
    [vvBanner.layer addAnimation:transition forKey:nil];
}

+ (VVAlertBanner *)bannerView
{
    //Check nib file
    vvBanner = (VVAlertBanner *) [[[UINib nibWithNibName:@"VVAlertBanner" bundle:nil]
            instantiateWithOwner:self options:nil]
            objectAtIndex:0];

    [vvBanner showTransition];

    return vvBanner;
}

@end
