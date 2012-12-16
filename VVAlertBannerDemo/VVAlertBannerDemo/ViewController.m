//
//  ViewController.m
//  VVAlertBannerDemo
//
//  Created by OneV on 12-12-16.
//  Copyright (c) 2012年 OneV's Den. All rights reserved.
//

#import "ViewController.h"
#import "VVAlertBannerViewQueue.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)normalPressed:(id)sender {
    VVBanner *banner = [VVBanner bannerOfStyle:VVAlertBannerStyleDefault withTitle:@"Normal" andDetail:@"Everthing Gose OK" hideAfter:3 inView:self.view];
    [[VVAlertBannerViewQueue shared] addAlert:banner];
}

- (IBAction)networkPressed:(id)sender {
    VVBanner *banner = [VVBanner bannerOfStyle:VVAlertBannerStyleConnection withTitle:@"Network" andDetail:@"Doing network" hideAfter:3 inView:self.view];
    [[VVAlertBannerViewQueue shared] addAlert:banner];
}

- (IBAction)errorPressed:(id)sender {
    VVBanner *banner = [VVBanner bannerOfStyle:VVAlertBannerStyleError withTitle:@"Error" andDetail:@"Something Gose wrong : (" hideAfter:3 inView:self.view];
    [[VVAlertBannerViewQueue shared] addAlert:banner];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
