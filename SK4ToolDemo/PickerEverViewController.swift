//
//  PickerEverViewController.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/03/27.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit
import SK4Toolkit

class PickerEverViewController: UIViewController {

	let check = SK4LeakCheck(name: "PickerEverViewController")

	@IBOutlet weak var stateLabel: UILabel!
	@IBOutlet weak var pickerView: UIPickerView!

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)

		tabBarController?.navigationItem.title = "Picker Ever"
	}

	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)
	}

	var pickerViewAdmin: SK4PickerViewAdmin!

    override func viewDidLoad() {
        super.viewDidLoad()

		let max = 1000000

		stateLabel.text = "Scroll to \(max)"
		pickerViewAdmin = SK4PickerViewAdmin(pickerView: pickerView, parent: self)

		pickerViewAdmin.addUnit(max) { no in String(no) }
		pickerViewAdmin.selectIndex = [0]
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// eof
