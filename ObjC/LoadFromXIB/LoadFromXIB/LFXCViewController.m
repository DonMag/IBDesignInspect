//
//  LFXCViewController.m
//  LoadFromXIB
//
//  Created by Don Mag on 3/20/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

#import "LFXCViewController.h"

@interface LFXCViewController ()

@end

@implementation LFXCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
	self.view.layer.cornerRadius = 24.0;
	self.view.layer.masksToBounds = YES;
	
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)setTheText:(NSString *)theText {
	self.theLabel.text = theText;
}

@end
