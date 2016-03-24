//
//  BorderButtonViewController.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/03/24.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit

class BorderButtonViewController: UIViewController {


	@IBAction func onNormalButton(sender: AnyObject) {
		print(#function)

	}

	@IBAction func onBorderButton(sender: AnyObject) {
		print(#function)
	}

	@IBAction func onButton2(sender: AnyObject) {
		print(#function)
	}

	@IBAction func onAlertController(sender: AnyObject) {
		print(#function)
	}

	@IBAction func onActionSheet(sender: AnyObject) {
		print(#function)
	}



    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
