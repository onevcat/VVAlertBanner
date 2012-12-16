//
//  VVAlertViewQuene.m
//
//  Created by Wei Wang onevcat on 2012/12/16.
//  Copyright (c) 2012 - onevcat.com - All rights reserved.
//

#import "VVAlertBannerViewQueue.h"


@interface VVBanner ()
@property (nonatomic,assign) VVAlertBannerStyle bannerStyle;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *detail;
@property (nonatomic,strong) UIImage *image;
@property (nonatomic,assign) NSTimeInterval interval;
@property (nonatomic, strong) UIView *container;
@end

@implementation VVBanner
+ (VVBanner *)bannerOfStyle:(VVAlertBannerStyle)style
                  withTitle:(NSString *)title
                  andDetail:(NSString *)detail
                  hideAfter:(NSTimeInterval)interval
                     inView:(UIView *)view
{
    VVBanner *instance = [[VVBanner alloc] init];
    instance.title = title;
    instance.detail = detail;
    instance.bannerStyle = style;
    instance.interval = interval;
	instance.container = view;
    return instance;
}
@end


@interface VVAlertBannerViewQueue ()
-(void) popAlert;
-(void) showAlert;
@end

static VVAlertBannerViewQueue *queue = nil;

@implementation VVAlertBannerViewQueue
@synthesize alertBannerItems = _alertBannerItems;
+(VVAlertBannerViewQueue *)shared
{
    if (!queue) {
        queue = [[VVAlertBannerViewQueue alloc] init];
    }
    return queue;
}

-(id)init
{
    self = [super init];
    if (self) {
        self.alertBannerItems = [NSMutableArray array];
    }
    return self;
}

-(void) addAlert:(VVBanner *)alert
{
	[self.alertBannerItems addObject:alert];
	if ([self.alertBannerItems count] == 1)
	{
		[self showAlert];
	}
}

-(void) showAlert
{
	VVBanner *alert = [self.alertBannerItems objectAtIndex:0];
    [VVAlertBanner bannerInView:alert.container ofStyle:alert.bannerStyle withTitle:alert.title andDetail:alert.detail hideAfter:alert.interval];
	[self performSelector:@selector(popAlert) withObject:nil afterDelay:alert.interval + 1];
}

-(void)popAlert
{
	[self.alertBannerItems removeObjectAtIndex:0];
	if ([self.alertBannerItems count] != 0)
	{
		[self showAlert];
	}
}

@end
