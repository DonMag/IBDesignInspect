//
//  RoundedBottomImageView.swift
//  SW3IBDesign
//
//  Created by Don Mag on 2/27/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

@IBDesignable

class RoundedBottomImageView: UIView {

	var imageView: UIImageView!
	
	@IBInspectable var image: UIImage? {
		didSet { self.imageView.image = image }
	}
	
	@IBInspectable var roundingValue: CGFloat = 0.0 {
		didSet {
			self.setNeedsLayout()
		}
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		doMyInit()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		doMyInit()
	}
	
	func doMyInit() {
		
		imageView = UIImageView()
		imageView.backgroundColor = UIColor.red
		imageView.contentMode = UIViewContentMode.scaleToFill
		addSubview(imageView)
		
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		imageView.frame = self.bounds

		let rect = self.bounds
		let y:CGFloat = rect.size.height - roundingValue
		let curveTo:CGFloat = rect.size.height
		
		let myBezier = UIBezierPath()
		myBezier.move(to: CGPoint(x: 0, y: y))
		myBezier.addQuadCurve(to: CGPoint(x: rect.width, y: y), controlPoint: CGPoint(x: rect.width / 2, y: curveTo))
		myBezier.addLine(to: CGPoint(x: rect.width, y: 0))
		myBezier.addLine(to: CGPoint(x: 0, y: 0))
		myBezier.close()
		
		let maskForPath = CAShapeLayer()
		maskForPath.path = myBezier.cgPath
		layer.mask = maskForPath
	
	}

}
