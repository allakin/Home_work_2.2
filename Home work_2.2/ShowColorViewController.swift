//
//  ShowColorViewController.swift
//  Home work_2.2
//
//  Created by Pavel Anpleenko on 01.11.2020.
//

import UIKit

class ShowColorViewController: UIViewController, ChangedBackgroundColorDelegate {
	var color = Color.setDefaulColor()
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	@IBAction func unwind(_ unwindSegue: UIStoryboardSegue) {}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		let destinationVC = segue.destination as! EditBackgroundColorViewController
		destinationVC.color = color
		destinationVC.delegate = self
	}
	
	func setNewBackgroundColor(color: Color) {
		navigationController?.isNavigationBarHidden = false
		view.backgroundColor = Color.setNewColor(color: color)
		self.color = color
		print(color)
	}
}
