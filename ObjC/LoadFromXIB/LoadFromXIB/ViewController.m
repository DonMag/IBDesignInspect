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
	
//	UIBezierPath *pth = [UIBezierPath bezierPath];
//	
//	CGFloat w = 240.0;
//	CGFloat h = 200.0;
//	
//	CGPoint p = CGPointZero;
//
//	// start at top-left
//	[pth moveToPoint:p];
//	
//	// line to top-right
//	p.x = w;
//	[pth addLineToPoint:p];
//	
//	// line to bottom-right
//	p.y = h;
//	[pth addLineToPoint:p];
//	
//	// line to 40 left, 40 up
//	p.x -= 40;
//	p.y -= 40;
//	[pth addLineToPoint:p];
//	
//	// line to 40 left, 40 down (back to bottom)
//	p.x -= 40;
//	p.y += 40;
//	[pth addLineToPoint:p];
//	
//	// line to 40 left, 40 up
//	p.x -= 40;
//	p.y -= 40;
//	[pth addLineToPoint:p];
//	
//	// line to 40 left, 40 down (back to bottom)
//	p.x -= 40;
//	p.y += 40;
//	[pth addLineToPoint:p];
//	
//	// line to 40 left, 40 up
//	p.x -= 40;
//	p.y -= 40;
//	[pth addLineToPoint:p];
//	
//	// line to 40 left, 40 down (back to bottom)
//	p.x -= 40;
//	p.y += 40;
//	[pth addLineToPoint:p];
//
//	// line to starting point - top-left
//	[pth closePath];
//
//	// 240 x 200 rectangle at 40,40
//	CGRect r = CGRectMake(40, 40, w, h);
//	
//	// create a UIView
//	UIView *v = [[UIView alloc] initWithFrame:r];
//	v.backgroundColor = [UIColor redColor];
//	
//	// create a CAShapeLayer
//	CAShapeLayer *maskShape = [CAShapeLayer layer];
//	
//	// add the path to the CAShapeLayer
//	maskShape.path = pth.CGPath;
//	
//	// set the view's layer mask to the CAShapeLayer
//	v.layer.mask = maskShape;
//	
//	// add the masked subview to the view
//	[self.view addSubview:v];
//
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
