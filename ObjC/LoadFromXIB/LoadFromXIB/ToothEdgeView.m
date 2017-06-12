//
//  ToothEdgeView.m
//  LoadFromXIB
//
//  Created by Don Mag on 6/2/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

#import "ToothEdgeView.h"

@interface ToothEdgeView()

@end

@implementation ToothEdgeView

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	
	if (self) {
		[self mySetup];
	}
	
	return self;
}

- (id)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	
	if (self) {
		[self mySetup];
	}
	
	return self;
}

- (void)awakeFromNib {
	[super awakeFromNib];
	[self mySetup];
}

- (void)prepareForInterfaceBuilder {
	[self mySetup];
}

- (void)mySetup {
}

- (void)layoutSubviews {
	
	[super layoutSubviews];
	
	UIBezierPath *pth = [UIBezierPath bezierPath];
	
	CGFloat w = self.bounds.size.width;
	CGFloat h = self.bounds.size.height;
	CGFloat tValue = w / 6.0;
	
	CGPoint p = CGPointZero;
	
	// start at top-left
	[pth moveToPoint:p];
	
	// line to top-right
	p.x = w;
	[pth addLineToPoint:p];
	
	// line to bottom-right
	p.y = h;
	[pth addLineToPoint:p];
	
	// line to tValue left, tValue up
	p.x -= tValue;
	p.y -= tValue;
	[pth addLineToPoint:p];
	
	// line to tValue left, tValue down (back to bottom)
	p.x -= tValue;
	p.y += tValue;
	[pth addLineToPoint:p];
	
	// line to tValue left, tValue up
	p.x -= tValue;
	p.y -= tValue;
	[pth addLineToPoint:p];
	
	// line to tValue left, tValue down (back to bottom)
	p.x -= tValue;
	p.y += tValue;
	[pth addLineToPoint:p];
	
	// line to tValue left, tValue up
	p.x -= tValue;
	p.y -= tValue;
	[pth addLineToPoint:p];
	
	// line to tValue left, tValue down (back to bottom)
	p.x -= tValue;
	p.y += tValue;
	[pth addLineToPoint:p];
	
	// line to starting point - top-left
	[pth closePath];
	
	// create a CAShapeLayer
	CAShapeLayer *maskShape = [CAShapeLayer layer];
	
	// add the path to the CAShapeLayer
	maskShape.path = pth.CGPath;
	
	// set the view's layer mask to the CAShapeLayer
	self.layer.mask = maskShape;
	
}


@end
