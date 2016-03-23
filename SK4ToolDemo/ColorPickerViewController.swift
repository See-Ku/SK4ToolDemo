//
//  ColorPickerViewController.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/03/30.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit
import SK4Toolkit

class ColorPickerViewController: UIViewController {

	let check = SK4LeakCheck(name: "ColorPickerViewController")

	@IBOutlet weak var colorPicker: SK4ColorPicker!

	@IBAction func onColorSelect(sender: AnyObject) {
		selectColorLabel.backgroundColor = colorPicker.color
	}

	@IBOutlet weak var selectColorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

		selectColorLabel.backgroundColor = colorPicker.color
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// eof
