//
//  RoundShadImgView.swift
//  SW3IBDesign
//
//  Created by Don Mag on 2/16/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

@IBDesignable

class RoundShadImgView: UIView {

	var imageView: UIImageView!
	
	@IBInspectable var image: UIImage? {
		didSet { self.imageView.image = image }
	}

	@IBInspectable var cornerRadius: CGFloat = 0.0 {
		didSet {
			self.layer.cornerRadius = cornerRadius
			self.imageView.layer.cornerRadius = cornerRadius
			self.imageView.layer.masksToBounds = cornerRadius > 0
		}
	}
	
	@IBInspectable var borderWidth: CGFloat = 0.0 {
		didSet {
			self.layer.borderWidth = borderWidth
		}
	}

	@IBInspectable var borderColor: UIColor = UIColor.black {
		didSet {
			self.layer.borderColor = borderColor.cgColor
		}
	}

	@IBInspectable var shadowRadius: CGFloat = 0.0 {
		didSet {
			self.layer.shadowRadius = shadowRadius
			self.imageView.layer.cornerRadius = cornerRadius
			self.imageView.layer.masksToBounds = cornerRadius > 0
		}
	}
	
	@IBInspectable var shadowOpacity: Float = 0.0 {
		didSet {
			self.layer.shadowOpacity = shadowOpacity
		}
	}
	
	@IBInspectable var shadowColor: UIColor? = UIColor.black {
		didSet {
			self.layer.shadowColor = shadowColor?.cgColor
		}
	}
	
	@IBInspectable var shadowOffset: CGSize = CGSize.zero {
		didSet {
			self.layer.shadowOffset = shadowOffset
		}
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubviews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		addSubviews()
	}
	
	func addSubviews() {
		imageView = UIImageView()
		imageView.backgroundColor = UIColor.clear
		imageView.contentMode = UIViewContentMode.scaleToFill
		addSubview(imageView)
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		imageView.frame = self.bounds
	}
	
}
