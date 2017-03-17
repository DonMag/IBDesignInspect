//
//  ViewController.swift
//  SW3LoadFromXIB
//
//  Created by Don Mag on 1/18/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


	@IBAction func btnTapped(_ sender: Any) {
		
		let lfxV = LFXView()
		
		lfxV.translatesAutoresizingMaskIntoConstraints = false
		
		lfxV.theText = "Hello LFX"
		lfxV.theLabel.textColor = UIColor.red
		
		self.view.addSubview(lfxV)

		if let btn = sender as? UIButton {
			
			lfxV.widthAnchor.constraint(equalToConstant: 240).isActive = true
			lfxV.heightAnchor.constraint(equalToConstant: 150).isActive = true
			lfxV.topAnchor.constraint(equalTo: btn.bottomAnchor, constant: 24).isActive = true
			lfxV.centerXAnchor.constraint(equalTo: btn.centerXAnchor).isActive = true

		}
		
	}
	
}

