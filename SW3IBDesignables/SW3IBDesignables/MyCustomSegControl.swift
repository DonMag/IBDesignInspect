//
//  MyCustomSegControl.swift
//  SW3IBDesignables
//
//  Created by Don Mag on 3/28/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

@IBDesignable

class MyCustomSegControl: UISegmentedControl {

	@IBInspectable var background: UIColor = UIColor.clear {
		didSet {
			backgroundColor = background
		}
	}
	
	@IBInspectable var tint: UIColor = UIColor.clear {
		didSet {
			tintColor = tint
		}
	}
	
	@IBInspectable var borderColor: UIColor = UIColor.clear {
		didSet {
			layer.borderColor = borderColor.cgColor
		}
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		setupUI()
	}
	
	override func prepareForInterfaceBuilder() {
		super.prepareForInterfaceBuilder()
		
		setupUI()
	}
	
	func setupUI() {
		layer.cornerRadius =  bounds.height / 2
		setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: UIBarMetrics.default)
		trimEdges()
	}
	
	func trimEdges() {
		let mask = CAShapeLayer()
		mask.frame = CGRect(x: 1, y: 1, width: bounds.width - 4, height: bounds.height - 4)
		mask.path = UIBezierPath(roundedRect: mask.frame, cornerRadius: bounds.height / 2).cgPath
		layer.mask = mask
	}
	

}
