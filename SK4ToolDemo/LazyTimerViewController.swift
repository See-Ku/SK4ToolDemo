//
//  LazyTimerViewController.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/03/27.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit
import SK4Toolkit

class LazyTimerViewController: UIViewController {

	let check = SK4LeakCheck(name: "LazyTimerViewController")

	@IBOutlet weak var stateLabel: UILabel!

	let timer = SK4LazyTimer()

	@IBAction func onFire(sender: AnyObject) {
		timer.fire()
	}

    override func viewDidLoad() {
        super.viewDidLoad()

		timer.setup(hold: 1.0) { [weak self] in
			self?.stateLabel.text = "\(NSDate())"
		}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// eof
