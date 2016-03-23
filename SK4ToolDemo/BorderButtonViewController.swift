//
//  BorderButtonViewController.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/03/24.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit
import SK4Toolkit

class BorderButtonViewController: UIViewController {

	let check = SK4LeakCheck(name: "BorderButtonViewController")

	@IBAction func onNormalButton(sender: AnyObject) {
		sk4AlertView(title: "Button", message: "Normal Button", vc: self)
	}

	@IBAction func onBorderButton(sender: AnyObject) {
		sk4AlertView(title: "Button", message: "Border Button", vc: self)
	}

	@IBAction func onButton2(sender: AnyObject) {
		sk4AlertView(title: "Button", message: "Button2", vc: self)
	}

	@IBAction func onAlertController(sender: AnyObject) {
		let ac = SK4AlertController(title: "Alert", message: "AlertController")
		ac.addDefault("OK")
		ac.presentAlertController(self)
	}

	@IBAction func onActionSheet(sender: AnyObject) {
		let ac = SK4ActionSheet(item: sender, title: "Alert", message: "ActionSheet")
		ac.addDefault("OK")
		ac.presentAlertController(self)
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
