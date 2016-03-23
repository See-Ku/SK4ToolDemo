//
//  Notify3ViewController.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/03/26.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit
import SK4Toolkit

class Notify3ViewController: UIViewController {

	let check = SK4LeakCheck(name: "Notify3ViewController")

	@IBOutlet weak var statusLabel: UILabel!

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)

		tabBarController?.navigationItem.title = "Notify3"
	}

	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

		Notify.Blue.recieveNotify(self) { [weak self] in
			self?.statusLabel.text = "Blue: \(NSDate())"
		}

		Notify.Black.recieveNotify(self) { [weak self] in
			self?.statusLabel.text = "Black: \(NSDate())"
		}

		Notify.Red.recieveNotify(self) { [weak self] in
			self?.statusLabel.text = "Red: \(NSDate())"
		}

		Notify.Green.recieveNotify(self) { [weak self] (str: String) in
			self?.statusLabel.text = "Green: \(str)"
		}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// eof
