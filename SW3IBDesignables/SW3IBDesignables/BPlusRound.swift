//
//  BPlusRound.swift
//  SW3IBDesignables
//
//  Created by Don Mag on 3/17/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

@IBDesignable

class BPlusRoundInnerView: UIView {
	
	override func draw(_ rect: CGRect) {
		let h = rect.height
		let w = rect.width
		var color:UIColor = UIColor.yellow
		
		var drect = CGRect(x: (w * 0.25),y: (h * 0.25),width: (w * 0.5),height: (h * 0.5))
		var bpath:UIBezierPath = UIBezierPath(rect: drect)
		
		color.set()
		bpath.stroke()
		
		print("arrgh")
	}
	
}

class BPlusRound: UIButton {

	var subImageView: BPlusRoundInnerView!

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
		commonInit()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		commonInit()
	}
	
	func commonInit() {
		subImageView = BPlusRoundInnerView()
		
		subImageView.backgroundColor = UIColor.orange
		
		subImageView.isUserInteractionEnabled = false
		
		addSubview(subImageView)

		let cRadius: CGFloat = 12.0 // min(self.frame.size.height, self.frame.size.width) / 2.0
		self.layer.cornerRadius = cRadius
		self.subImageView.layer.cornerRadius = cRadius
		self.subImageView.layer.masksToBounds = true

	}
	
	override func layoutSubviews() {
		super.layoutSubviews()

		let cRadius: CGFloat = 12.0 // min(self.frame.size.height, self.frame.size.width) / 2.0
		self.layer.cornerRadius = cRadius
		self.subImageView.layer.cornerRadius = cRadius

		subImageView.frame = self.bounds
	}
	

}
