//
//  KeyboardObserverViewController.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/03/30.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit
import SK4Toolkit

class KeyboardObserverViewController: UIViewController, SK4KeyboardObserver {

	let check = SK4LeakCheck(name: "KeyboardObserverViewController")

	@IBOutlet weak var textField: UITextField!
	@IBOutlet weak var statusLabel: UILabel!

	@IBAction func onDone(sender: AnyObject) {
		textField.resignFirstResponder()
	}

	func onKeyboardWillShow(notify: NSNotification) {
		if let re = keyboardFrameEnd(notify) {
			statusLabel.text = "show: \(re)"
		} else {
			statusLabel.text = "show: ---"
		}
	}

	func onKeyboardWillHide(notify: NSNotification) {
		statusLabel.text = "hide"
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)

		startKeyboardObserver()
	}

	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)

		stopKeyboardObserver()
	}

    override func viewDidLoad() {
        super.viewDidLoad()

		statusLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// eof
