//
//  EditBackgroundColorViewController.swift
//  Home work_2.2
//
//  Created by Pavel Anpleenko on 18.10.2020.
//

import UIKit

protocol ChangedBackgroundColorDelegate {
	func setNewBackgroundColor(color: Color)
}

class EditBackgroundColorViewController: UIViewController {
	@IBOutlet weak var colorView: UIView!
	
	@IBOutlet weak var redColorNumberLabel: UILabel!
	@IBOutlet weak var greenColorNumberLabel: UILabel!
	@IBOutlet weak var blueColorNumberLabel: UILabel!
	
	@IBOutlet weak var redSlider: UISlider!
	@IBOutlet weak var greenSlider: UISlider!
	@IBOutlet weak var blueSlider: UISlider!
	
	@IBOutlet weak var saveButton: UIButton!
	
	var delegate: ChangedBackgroundColorDelegate!
	var color: Color!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationController?.isNavigationBarHidden = true
		
		colorView.layer.cornerRadius = 20
		saveButton.layer.cornerRadius = saveButton.frame.size.height / 2
		
		setSliderPosition()
		setColorValueInLabel()
		setBackgroundViewColor()
		print(color)
	}
	
	@IBAction func changeViewColor(sender: UISlider) {
		setBackgroundViewColor()
		
		switch sender.tag {
		case 0:
			redColorNumberLabel.text = roundPosition(for: redSlider)
		case 1:
			greenColorNumberLabel.text = roundPosition(for: greenSlider)
		case 2:
			blueColorNumberLabel.text = roundPosition(for: blueSlider)
		default:
			break
		}
	}
	
	
	@IBAction func saveColorPressed(_ sender: Any) {
		let newColor = Color(red: Float(roundPosition(for: redSlider)) ?? 1.00,
							 green: Float(roundPosition(for: greenSlider)) ?? 1.00,
							 blue: Float(roundPosition(for: blueSlider)) ?? 1.00)
		delegate.setNewBackgroundColor(color: newColor)
	}
	
	private func setBackgroundViewColor() {
		colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
											green: CGFloat(greenSlider.value),
											blue: CGFloat(blueSlider.value),
											alpha: 1)
	}
	
	private func setSliderPosition() {
		redSlider.value = color.red
		greenSlider.value = color.green
		blueSlider.value = color.blue
	}
	
	private func setColorValueInLabel() {
		redColorNumberLabel.text = roundPosition(for: redSlider)
		greenColorNumberLabel.text = roundPosition(for: greenSlider)
		blueColorNumberLabel.text = roundPosition(for: blueSlider)
	}
	
	private func roundPosition(for slider: UISlider) -> String {
		String(format: "%.2f", slider.value)
	}
}

