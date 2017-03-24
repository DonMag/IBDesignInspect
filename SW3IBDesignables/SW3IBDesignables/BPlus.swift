//
//  BPlus.swift
//  SW3IBDesignables
//
//  Created by Don Mag on 3/17/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class BPlusInnerView: UIView {

	var strokeColor: UIColor = UIColor.black
	
	override func draw(_ rect: CGRect) {
		
		super.draw(rect)
		
		let halfW = rect.size.width / 2;
		let halfH = rect.size.height / 2;
		
		// draw a diamond shape inside the rounded rect, just to demonstrate a little additional drawing
		let xoff = halfW * 0.1;
		let yoff = halfH * 0.1;
		
		let pth = UIBezierPath()
		
		pth.lineWidth = 2.0;
		
		pth.move(to: CGPoint(x: xoff, y: halfH))
		pth.addLine(to: CGPoint(x: halfW, y: yoff))
		pth.addLine(to: CGPoint(x: rect.size.width - xoff, y: halfH))
		pth.addLine(to: CGPoint(x: halfW, y: rect.size.height - yoff))

		pth.close()
		
		strokeColor.set()

		pth.stroke()
		
	}
	

}

@IBDesignable

class BPlus: UIButton {

	var subImageView: BPlusInnerView!

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
	
	override func awakeFromNib() {
		super.awakeFromNib()
		addSubviews()
	}
	
	func addSubviews() {
		if subImageView == nil {
			subImageView = BPlusInnerView()
			subImageView.isUserInteractionEnabled = false
			addSubview(subImageView)
		}
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		let cRadius: CGFloat = min(self.bounds.size.height, self.bounds.size.width) / 2.0
		self.layer.cornerRadius = cRadius
		self.subImageView.layer.cornerRadius = cRadius
		self.subImageView.layer.masksToBounds = true

		subImageView.backgroundColor = self.backgroundColor == nil ? UIColor.clear : self.backgroundColor
		subImageView.strokeColor = self.titleColor(for: .normal) == nil ? UIColor.black : self.titleColor(for: .normal)!
		
		subImageView.frame = self.bounds
	}
	

}
