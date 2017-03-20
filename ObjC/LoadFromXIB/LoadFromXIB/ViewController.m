//
//  ViewController.m
//  LoadFromXIB
//
//  Created by Don Mag on 3/17/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

#import "ViewController.h"
#import "LFXView.h"
#import "LFXCViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)btnTapped:(id)sender {
	
//	LFXView *lfxV = [[LFXView alloc] init];
//	
//	lfxV.translatesAutoresizingMaskIntoConstraints = NO;
//	
//	lfxV.theText = @"Hello LFX";
//	lfxV.theLabel.textColor = [UIColor redColor];
//	
//	[self.view addSubview:lfxV];
//	
//	if ([sender isKindOfClass:[UIButton class]]) {
//		
//		UIButton *btn = (UIButton *)sender;
//
//		[lfxV.widthAnchor constraintEqualToConstant:240.0].active = YES;
//		[lfxV.heightAnchor constraintEqualToConstant:150.0].active = YES;
//		[lfxV.topAnchor constraintEqualToAnchor:btn.bottomAnchor constant:24.0].active = YES;
//		[lfxV.centerXAnchor constraintEqualToAnchor:btn.centerXAnchor].active = YES;
//		
//	}


	LFXCViewController *vc = [[LFXCViewController alloc] initWithNibName:@"LFXCViewController" bundle:nil];
	UIView *v = vc.view;
	
	v.translatesAutoresizingMaskIntoConstraints = NO;
	
	vc.theText = @"Hello LFX VC";
	vc.theLabel.textColor = [UIColor cyanColor];
	
	[self.view addSubview:v];
	
	if ([sender isKindOfClass:[UIButton class]]) {
		
		UIButton *btn = (UIButton *)sender;
		
		[v.widthAnchor constraintEqualToConstant:240.0].active = YES;
		[v.heightAnchor constraintEqualToConstant:150.0].active = YES;
		[v.topAnchor constraintEqualToAnchor:btn.bottomAnchor constant:24.0].active = YES;
		[v.centerXAnchor constraintEqualToAnchor:btn.centerXAnchor].active = YES;
		
	}
	
	
}

@end
