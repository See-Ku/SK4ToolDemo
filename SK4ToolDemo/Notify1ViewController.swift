//
//  Notify1ViewController.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/03/26.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit
import SK4Toolkit

/// 通知を識別するenum
enum Notify: SK4Notify {
	case Blue
	case Black
	case Red
	case Green
}

class Notify1ViewController: UIViewController {

	let check = SK4LeakCheck(name: "Notify1ViewController")

	@IBOutlet weak var statusLabel: UILabel!
	@IBOutlet weak var textField: UITextField!

	@IBAction func onBlue(sender: AnyObject) {
		Notify.Blue.postNotify()
	}

	@IBAction func onBlack(sender: AnyObject) {
		Notify.Black.postNotify()
	}

	@IBAction func onRed(sender: AnyObject) {
		Notify.Red.postNotify()
	}

	@IBAction func onGreen(sender: AnyObject) {
		if let text = textField.text {
			Notify.Green.postNotify(text)
		}
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)

		tabBarController?.navigationItem.title = "Notify1"
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

		textField.text = "temp"
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// eof
