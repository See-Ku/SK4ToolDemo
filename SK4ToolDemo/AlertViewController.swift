//
//  AlertViewController.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/03/24.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

	let check = SK4LeakCheck(name: "AlertViewController")

	@IBOutlet weak var selectLabel: UILabel!

	@IBAction func onDefault(sender: AnyObject) {
		let ac = SK4AlertController(title: "AlertController", message: "Default")
		ac.addDefault("OK")
		ac.presentAlertController(self)
	}

	@IBAction func onCancel(sender: AnyObject) {
		let ac = SK4AlertController(title: "AlertController", message: "Cancel")
		ac.addCancel("Cancel")
		ac.presentAlertController(self)
	}

	@IBAction func onDestructive(sender: AnyObject) {
		let ac = SK4AlertController(title: "AlertController", message: "Destructive")
		ac.addDestructive("Destructive")
		ac.presentAlertController(self)
	}

	@IBAction func onCancelOK(sender: AnyObject) {
		let ac = SK4AlertController(title: "AlertController", message: "Cancel or OK")
		ac.addCancel("Cancel") { action in
			self.selectLabel.text = "-> Cancel"
		}
		ac.addDefault("OK") { action in
			self.selectLabel.text = "-> OK"
		}
		ac.presentAlertController(self)
	}

	@IBAction func onCancelDestructive(sender: AnyObject) {
		let ac = SK4AlertController(title: "AlertController", message: "Cancel or Destructive")
		ac.addCancel("Cancel") { action in
			self.selectLabel.text = "-> Cancel"
		}
		ac.addDestructive("Destructive") { action in
			self.selectLabel.text = "-> Destructive"
		}
		ac.presentAlertController(self)
	}

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
