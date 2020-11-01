//
//  Color.swift
//  Home work_2.2
//
//  Created by Pavel Anpleenko on 01.11.2020.
//

import UIKit

struct Color {
	let red: Float
	let green: Float
	let blue: Float
	
	static func setDefaulColor() -> Color {
		Color(red: 1.00, green: 1.00, blue: 1.00)
	}
	
	static func setNewColor(color: Color) -> UIColor {
		UIColor(red: CGFloat(color.red),
				green: CGFloat(color.green),
				blue: CGFloat(color.blue),
				alpha: 1.0)
	}
}
