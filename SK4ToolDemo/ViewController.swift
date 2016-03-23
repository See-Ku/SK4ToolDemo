//
//  ViewController.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/03/23.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit

class TableAdmin: SK4TableViewAdmin {

	let itemArray = ["TableViewAdmin Demo"]

	override func numberOfRows(section: Int) -> Int {
		return itemArray.count
	}

	override func cellForRow(cell: UITableViewCell, indexPath: NSIndexPath) {
		cell.textLabel?.text = itemArray[indexPath.row]
	}
}


class ViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!

	var tableAdmin: TableAdmin!

	override func viewDidLoad() {
		super.viewDidLoad()

		tableAdmin = TableAdmin(tableView: tableView, parent: self)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

