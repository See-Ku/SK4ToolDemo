//
//  TableViewController.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/03/23.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!


	@IBAction func onEdit(sender: AnyObject) {
		let flag = !tableView.editing
		tableView.setEditing(flag, animated: true)
	}

	var tableViewAdmin: TableViewAdmin!

    override func viewDidLoad() {
        super.viewDidLoad()

		tableViewAdmin = TableViewAdmin(tableView: tableView, parent: self)
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
