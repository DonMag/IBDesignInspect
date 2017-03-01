//
//  WithoutCustomClassViewController.swift
//  SW3IBDesignables
//
//  Created by Don Mag on 3/1/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class WithoutCustomClassViewController: UIViewController {
	
	@IBOutlet weak var theImageView: UIImageView!
	

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		self.addBezierPath()
	}
	
	func addBezierPath() -> Void {
		
		let roundingValue: CGFloat = 20
		
		let rect = theImageView.bounds
		let y: CGFloat = rect.size.height - roundingValue
		let curveTo: CGFloat = rect.size.height
		
		let myBezier: UIBezierPath = UIBezierPath()
		myBezier.move(to: CGPoint(x: 0, y: y))
		myBezier.addQuadCurve(to: CGPoint(x: rect.width, y: y), controlPoint: CGPoint(x: rect.width / 2, y: curveTo))
		myBezier.addLine(to: CGPoint(x: rect.width, y: 0))
		myBezier.addLine(to: CGPoint(x: 0, y: 0))
		myBezier.close()
		
		let maskForPath = CAShapeLayer()
		maskForPath.path = myBezier.cgPath
		theImageView.layer.mask = maskForPath
		
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
