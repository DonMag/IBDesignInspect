//
//  LFXView.m
//  LoadFromXIB
//
//  Created by Don Mag on 3/17/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

#import "LFXView.h"

@interface LFXView ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintViewWidth;

@end

@implementation LFXView

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	
	if (self) {
		[self xibSetup];
	}
	
	return self;
}

- (id)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	
	if (self) {
		[self xibSetup];
	}
	
	return self;
}

- (void)awakeFromNib {
	[super awakeFromNib];
	[self xibSetup];
}

- (void)prepareForInterfaceBuilder {
	[self xibSetup];
}

- (void)xibSetup {
	
	if (!self.subviews.count) {
		
		UIView *view = [self loadFromXIB];
		
		view.frame = self.bounds;
		view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		view.layer.cornerRadius = 24.0;
		view.layer.masksToBounds = YES;
		[self addSubview:view];
		[self sendSubviewToBack:view];
		
		for (UIView *v in view.subviews) {
			if ([v isKindOfClass:[UILabel class]]) {
				self.theLabel = (UILabel *)v;
				break;
			}
		}
		
		// just an example of changing a constant when the custom view is loaded
		if (CGRectGetHeight([UIScreen mainScreen].bounds) == 667) {
			_constraintViewWidth.constant = 60;
		}
		
	}
	
}

- (UIView *)loadFromXIB {
	
	NSString *className = NSStringFromClass([self class]);
	NSBundle *bundle = [NSBundle bundleForClass:[self class]];
	UINib *nib = [UINib nibWithNibName:className bundle:bundle];
	UIView *v = [nib instantiateWithOwner:self options:nil].firstObject;
	
	return v;
	
}

- (void)setTheText:(NSString *)theText {
	self.theLabel.text = theText;
}


@end
