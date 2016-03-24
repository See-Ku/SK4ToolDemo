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

		let ac = SK4ActionSheet()
		ac.setSourceView(sender, parent: self)

//		ac.barButtonItem = sender as? UIBarButtonItem

		ac.addDestructive("Destructive") { action in
			self.selectLabel.text = "Add: Destructive"
		}

		ac.addCancel("Cancel") { action in
			self.selectLabel.text = "Add: Cancel"
		}

		ac.addDefault("Default") { action in
			self.selectLabel.text = "Add: Default"
		}

		ac.presentAlertController(self)
	}

	@IBAction func onAction(sender: AnyObject) {
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
