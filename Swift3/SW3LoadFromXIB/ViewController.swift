//
//  ViewController.swift
//  SW3LoadFromXIB
//
//  Created by Don Mag on 1/18/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	var lfxV: LFXView?

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	
	@IBAction func loadThenConfigTapped(_ sender: Any) {

		if lfxV != nil {
			lfxV?.removeFromSuperview()
			lfxV = nil
		}
		
		lfxV = LFXView()
		
		if let v = lfxV {
		
			v.translatesAutoresizingMaskIntoConstraints = false
			
			v.theText = "Hello LFX"
			v.theLabel.textColor = UIColor.red
			
			self.view.addSubview(v)
			
			if let btn = sender as? UIButton {
				
				v.widthAnchor.constraint(equalToConstant: 240).isActive = true
				v.heightAnchor.constraint(equalToConstant: 150).isActive = true
				v.topAnchor.constraint(equalTo: btn.bottomAnchor, constant: 24).isActive = true
				v.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
				
			}

		}
		
	}
	
	@IBAction func loadWithConfigTapped(_ sender: Any) {
		
		if lfxV != nil {
			lfxV?.removeFromSuperview()
			lfxV = nil
		}
		
		lfxV = LFXView.init(with: "Wowzer!", and: UIColor.orange)
		
		if let v = lfxV {
			
			v.translatesAutoresizingMaskIntoConstraints = false
			
			self.view.addSubview(v)
			
			if let btn = sender as? UIButton {
				
				v.widthAnchor.constraint(equalToConstant: 240).isActive = true
				v.heightAnchor.constraint(equalToConstant: 150).isActive = true
				v.topAnchor.constraint(equalTo: btn.bottomAnchor, constant: 24).isActive = true
				v.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
				
			}
			
		}
		
	}
	
}

