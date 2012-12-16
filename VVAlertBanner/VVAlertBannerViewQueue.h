//
//  VVAlertViewQuene.h
//
//  Created by Wei Wang onevcat on 2012/12/16.
//  Copyright (c) 2012 - onevcat.com - All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VVAlertBanner.h"

@interface VVBanner : NSObject
+ (VVBanner *)bannerOfStyle:(VVAlertBannerStyle)style
                  withTitle:(NSString *)title
                  andDetail:(NSString *)detail
                  hideAfter:(NSTimeInterval)interval
                     inView:(UIView *)view;

@end

@interface VVAlertBannerViewQueue : NSObject

@property (nonatomic,retain) NSMutableArray *alertBannerItems;

+(VVAlertBannerViewQueue *)shared;
-(void) addAlert:(VVBanner *)alert;

@end
