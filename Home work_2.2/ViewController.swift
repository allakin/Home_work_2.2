//
//  ViewController.swift
//  Home work_2.2
//
//  Created by Pavel Anpleenko on 18.10.2020.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var colorView: UIView!
  @IBOutlet weak var redColorNumberLabel: UILabel!
  @IBOutlet weak var greenColorNumberLabel: UILabel!
  @IBOutlet weak var blueColorNumberLabel: UILabel!
  
  @IBOutlet weak var redSlider: UISlider!
  @IBOutlet weak var greenSlider: UISlider!
  @IBOutlet weak var blueSlider: UISlider!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setDefaultColor()
  }

  @IBAction func changeViewColor() {
    let redColor = roundPosition(for: redSlider)
    let greenColor = roundPosition(for: greenSlider)
    let blueColor = roundPosition(for: blueSlider)
    
    colorView.backgroundColor = UIColor(red: CGFloat(redColor),
                                        green: CGFloat(greenColor),
                                        blue: CGFloat(blueColor),
                                        alpha: 1.0)
    
    redColorNumberLabel.text = "\(redColor)"
    greenColorNumberLabel.text = "\(greenColor)"
    blueColorNumberLabel.text = "\(blueColor)"
  }
  
  func setDefaultColor() {
    redColorNumberLabel.text = "\(redSlider.value)"
    greenColorNumberLabel.text = "\(greenSlider.value)"
    blueColorNumberLabel.text = "\(blueSlider.value)"
    
    colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                        green: CGFloat(greenSlider.value),
                                        blue: CGFloat(blueSlider.value),
                                        alpha: 1.0)
  }
  
  func roundPosition(for slider: UISlider) -> Float {
    round(slider.value * 100) / 100
  }
}

