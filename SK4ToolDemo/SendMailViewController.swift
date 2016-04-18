//
//  SendMailViewController.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/04/18.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit
import SK4Toolkit
import SK4SpareKit

class SendMailViewController: UIViewController {

	let check = SK4LeakCheck(name: "SendMailViewController")

	let mailAdmin = SK4MailComposeAdmin()

	@IBAction func onSendMail(sender: AnyObject) {
		mailAdmin.mailTo = "abc@example.com"
		mailAdmin.title = "title"
		mailAdmin.mailTo = "abc@example.com"
		mailAdmin.sendMail(self)
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
