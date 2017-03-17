//
//  LXFView.m
//  LoadFromXIB
//
//  Created by Don Mag on 3/17/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

#import "LXFView.h"

@interface LXFView()

@end

BOOL bInit = NO;

@implementation LXFView


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

		bInit = YES;

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
