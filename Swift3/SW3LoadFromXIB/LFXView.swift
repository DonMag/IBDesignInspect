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

	@IBOutlet weak var theLabel: UILabel!
//	@IBOutlet weak var view : UIView!
	
	@IBInspectable var theText: String = "This is the XIB View" {
		didSet {
			self.theLabel.text = theText
		}
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		xibSetup()
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		xibSetup()
	}
	
	private func xibSetup() {
		let view = loadViewFromXib()
		view.frame = bounds
		view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		view.layer.cornerRadius = 24.0
		view.layer.masksToBounds = true
		addSubview(view)
		sendSubview(toBack: view)
	}
	
	private func loadViewFromXib() -> UIView {
		let nib = UINib(nibName: String(describing: type(of: self)), bundle: Bundle(for: type(of: self)))
		if let cView = nib.instantiate(withOwner: self, options: nil).first as? UIView {
			return cView
		}
		else {
			print("Unable to load custom view!")
			return UIView()
		}
	}

}
