//
//  ViewController.swift
//  SW3IBDesignables
//
//  Created by Don Mag on 2/27/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var theCustomView: RoundedBottomImageView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func greenButtonTapped(_ sender: Any) {
		theCustomView.image = UIImage(named: "swiftGreen256")
	}

	@IBAction func blueButtonTapped(_ sender: Any) {
		theCustomView.image = UIImage(named: "swiftBlue256")
	}
	
	@IBAction func redButtonTapped(_ sender: Any) {
		theCustomView.image = UIImage(named: "swiftRed256")
	}
	
}

