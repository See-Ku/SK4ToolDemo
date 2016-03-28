//
//  PickerSizeViewController.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/03/27.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit
import SK4Toolkit

class PickerSizeViewController: UIViewController {

	let check = SK4LeakCheck(name: "PickerSizeViewController")

	@IBOutlet weak var pickerView: UIPickerView!
	@IBOutlet weak var selectLabel: UILabel!

	@IBAction func onPick(sender: AnyObject) {
		let ar = pickerViewAdmin.selectIndex.map() { no in String(no) }
		selectLabel.text = ar.joinWithSeparator(", ")
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)

		tabBarController?.navigationItem.title = "Picker Size"
	}

	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)
	}

	var pickerViewAdmin: SK4PickerViewAdmin!

    override func viewDidLoad() {
        super.viewDidLoad()

		selectLabel.text = ""
		pickerViewAdmin = SK4PickerViewAdmin(pickerView: pickerView, parent: self)

		let ar = (5...20).map() { no in String(no) }

		pickerViewAdmin.addUnit(ar)
		pickerViewAdmin.addUnit("x", width: 32)
		pickerViewAdmin.addUnit(ar)

		pickerViewAdmin.selectIndex = [5, 0, 5]
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// eof
