//
//  LFXView.swift
//  SW3LoadFromXIB
//
//  Created by Don Mag on 1/18/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

@IBDesignable

class LFXView: UIView {

	@IBOutlet var theContentView: UIView!
	
	@IBOutlet weak var theLabel: UILabel!
	
	@IBInspectable var theText: String = "This is the XIB View" {
		didSet {
			self.theLabel.text = theText
		}
	}
	
	convenience init(with someText: String) {
		self.init(frame: CGRect.zero)
		theText = someText
		theLabel.text = someText
	}
	
	convenience init(with someText: String, and color: UIColor) {
		self.init(frame: CGRect.zero)
		theText = someText
		theLabel.text = someText
		theLabel.textColor = color
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}
	
	private func commonInit() {
		
		if self.subviews.count == 0 {
			
			let nib = UINib(nibName: String(describing: type(of: self)), bundle: Bundle(for: type(of: self)))
			if let cView = nib.instantiate(withOwner: self, options: nil).first as? UIView {
				theContentView = cView
			} else {
				// shouldn't happen
				theContentView = UIView()
			}
			
			addSubview(theContentView)
			
			theContentView.translatesAutoresizingMaskIntoConstraints = false
			
			theContentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
			theContentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
			theContentView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
			theContentView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
			
			// just to show some customization
			theContentView.layer.cornerRadius = 24.0
			theContentView.layer.masksToBounds = true
			
		}
		
	}

}
