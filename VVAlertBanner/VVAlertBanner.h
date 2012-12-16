//
//  VVAlertBanner.h
//
//  Created by Wei Wang onevcat on 2012/12/16.
//  Copyright (c) 2012 - onevcat.com - All rights reserved.
//

#import <UIKit/UIKit.h>

//All styles of alert
typedef enum
{
    VVAlertBannerStyleDefault,
    VVAlertBannerStyleConnection,
    VVAlertBannerStyleError
} VVAlertBannerStyle;

@interface VVAlertBanner : UIView

//Text for alert details
@property(nonatomic, assign) IBOutlet UILabel *bannerTitle;
@property(nonatomic, assign) IBOutlet UILabel *bannerDetail;

//Image for different alert
@property(nonatomic, assign) IBOutlet UIImageView *bannerImage;

//Activity for VVAlertBannerStyleConnection
@property(nonatomic, assign) IBOutlet UIActivityIndicatorView *activity;

#pragma mark - View methods

//With time interval
+ (VVAlertBanner *)bannerInView:(UIView *)view
                        ofStyle:(VVAlertBannerStyle)style
                      withTitle:(NSString *)title
                      andDetail:(NSString *)detail
                      hideAfter:(NSTimeInterval)interval;

//With selector
+ (VVAlertBanner *)bannerInView:(UIView *)view
                        ofStyle:(VVAlertBannerStyle)style
                      withTitle:(NSString *)title
                      andDetail:(NSString *)detail
                       hideWith:(SEL)selector;

#pragma mark - Window methods

//With time interval
+ (VVAlertBanner *)bannerInWindow:(UIWindow *)window
                          ofStyle:(VVAlertBannerStyle)style
                        withTitle:(NSString *)title
                        andDetail:(NSString *)detail
                        hideAfter:(NSTimeInterval)interval;

//With selector
+ (VVAlertBanner *)bannerInWindow:(UIWindow *)window
                          ofStyle:(VVAlertBannerStyle)style
                        withTitle:(NSString *)title
                        andDetail:(NSString *)detail
                         hideWith:(SEL)selector;

//Dismiss part
- (void)dismissTransition;

- (void)dismissAlert;

@end
