//
//  MainView.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/04/05.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit
import SK4Toolkit

class MainView: UIView {

	var word = ""

	override func drawRect(rect: CGRect) {
		let ic = SK4ImageContext.currentContext()
		ic.setStrokeColor(UIColor.blackColor())
		ic.strokeRect(rect)

		if word.isEmpty == false {
			let atr = SK4TextAttributes()
			atr.alignment = .Center
			atr.font = UIFont(name: "AvenirNext-Heavy", size: bounds.height)
			word.sk4DrawInRect(rect, withAttributes: atr.attributes, vertical: .Center)
		}
	}

	weak var titleLabel: UILabel!

	override func layoutSubviews() {
		super.layoutSubviews()

		titleLabel?.text = "AvenirNext-Heavy \(bounds.height)"
	}

}

// eof
