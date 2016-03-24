//
//  ActionSheetViewController.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/03/24.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit

class ActionSheetViewController: UIViewController {

	let check = SK4LeakCheck(name: "ActionSheetViewController")

	@IBOutlet weak var selectLabel: UILabel!

	@IBAction func onAdd(sender: AnyObject) {
		let ac = SK4ActionSheet(item: sender)

		ac.addDestructive("Destructive") { action in
			self.selectLabel.text = "Add: Destructive"
		}

		ac.addDefault("Default") { action in
			self.selectLabel.text = "Add: Default"
		}

		ac.addCancel("Cancel") { action in
			self.selectLabel.text = "Add: Cancel"
		}

		ac.presentAlertController(self)
	}

	@IBAction func onAction(sender: AnyObject) {
		dispActionSheet(sender, name: "Action")
	}

	@IBAction func onLeft(sender: AnyObject) {
		dispActionSheet(sender, name: "Left")
	}

	@IBAction func onCenter(sender: AnyObject) {
		dispActionSheet(sender, name: "Center")
	}

	@IBAction func onRight(sender: AnyObject) {
		dispActionSheet(sender, name: "Right")
	}

	@IBAction func onButton(sender: AnyObject) {
		guard let btn = sender as? UIButton else { return }
		guard let title = btn.currentTitle else { return }

		dispActionSheet(sender, name: title)
	}

	func dispActionSheet(sender: AnyObject, name: String) {
		let ac = SK4ActionSheet(item: sender)

		ac.addDestructive("Destructive") { action in
			self.selectLabel.text = "\(name) -> Destructive"
		}

		ac.addDefault("Default") { action in
			self.selectLabel.text = "\(name) -> Default"
		}

		ac.addCancel("Cancel") { action in
			self.selectLabel.text = "\(name) -> Cancel"
		}

		ac.presentAlertController(self)
	}
	
	// /////////////////////////////////////////////////////////////

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)

		navigationController?.toolbarHidden = false
	}

	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)

		navigationController?.toolbarHidden = true
	}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// eof
