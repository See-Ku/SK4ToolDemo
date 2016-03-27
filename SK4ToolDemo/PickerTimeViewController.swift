//
//  PickerTimeViewController.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/03/27.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit

class PickerTimeViewController: UIViewController {

	let check = SK4LeakCheck(name: "PickerTimeViewController")

	@IBOutlet weak var pickerView: UIPickerView!
	@IBOutlet weak var selectLabel: UILabel!

	@IBAction func onPick(sender: AnyObject) {

		selectLabel.text = pickerViewAdmin.selectString.joinWithSeparator("")
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)

		tabBarController?.navigationItem.title = "Picker Time"
	}

	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)
	}

	var pickerViewAdmin: SK4PickerViewAdmin!

    override func viewDidLoad() {
        super.viewDidLoad()

		selectLabel.text = ""
		pickerViewAdmin = SK4PickerViewAdmin(pickerView: pickerView, parent: self)

		let hour = (0...23).map() { no in String(no) }
		let min = (0...59).map() { no in String(no) }

		pickerViewAdmin.addUnit(hour, infinite: true)
		pickerViewAdmin.addUnit(":", width: 32)
		pickerViewAdmin.addUnit(min, infinite: true)

		pickerViewAdmin.selectIndex = [12, 0, 0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// eof
