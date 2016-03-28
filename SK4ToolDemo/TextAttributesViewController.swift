//
//  TextAttributesViewController.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/03/27.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit
import SK4Toolkit

class TextAttributesViewController: UIViewController {

	let check = SK4LeakCheck(name: "TextAttributes")

	@IBOutlet weak var atrLabel: UILabel!

	func setAtrLabel() {

		let atr = SK4TextAttributes()
		atr.alignment = .Center

		let str = NSMutableAttributedString()

		atr.font = UIFont(name: "AmericanTypewriter-CondensedBold", size: 28)
		atr.textColor = UIColor.blueColor()
		str.sk4AppendString("AmericanTypewriter-CondensedBold\n", attrs: atr.attributes)

		atr.font = UIFont(name: "AvenirNext-Regular", size: 24)
		atr.textColor = UIColor.redColor()
		atr.backColor = UIColor.blackColor()
		str.sk4AppendString("AvenirNext-Regular", attrs: atr.attributes)

		atr.font = UIFont(name: "BradleyHandITCTT-Bold", size: 20)
		atr.textColor = UIColor.greenColor()
		atr.backColor = UIColor.clearColor()
		str.sk4AppendString("\nBradleyHandITCTT-Bold\n", attrs: atr.attributes)

		atr.font = UIFont(name: "AvenirNextCondensed-Heavy", size: 32)
		atr.textColor = UIColor.darkGrayColor()
		str.sk4AppendString("AvenirNextCondensed-Heavy", attrs: atr.attributes)

		atrLabel.attributedText = str
	}

    override func viewDidLoad() {
        super.viewDidLoad()

		setAtrLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// eof
