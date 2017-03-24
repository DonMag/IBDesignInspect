//
//  SecurityButton.swift
//  SW3IBDesignables
//
//  Created by Don Mag on 3/17/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

@IBDesignable
class SecurityButton: UIButton {

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
		
		layer.borderWidth = 1.0
		layer.borderColor = color.cgColor
		layer.cornerRadius = 6.0
		
		_contentEdgeInsets = UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: 8.0)
		updateEdgeInsets()
	}

	private var _contentEdgeInsets: UIEdgeInsets = UIEdgeInsets.zero {
		didSet { updateEdgeInsets() }
	}
	override public var contentEdgeInsets: UIEdgeInsets {
		get { return super.contentEdgeInsets }
		set { _contentEdgeInsets = newValue }
	}
	
	private func updateEdgeInsets() {
		let initialEdgeInsets = contentEdgeInsets
	
		let t = _contentEdgeInsets.top + initialEdgeInsets.top
		let l = _contentEdgeInsets.left + initialEdgeInsets.left
		let b = _contentEdgeInsets.bottom + initialEdgeInsets.bottom
		let r = _contentEdgeInsets.right + initialEdgeInsets.right
		
		super.contentEdgeInsets = UIEdgeInsets(top: t, left: l, bottom: b, right: r)
	}
	
	@IBInspectable
	var color: UIColor = UIColor.black {
		didSet {
			setTitleColor(color, for: .normal)
		}
	}
	
}
