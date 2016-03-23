//
//  TableViewAdmin.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/03/23.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit

class TableViewAdmin: SK4TableViewAdmin {

	var itemArray: [String] = [
		"black",
		"white",
		"gray",
		"red",
		"green",
		"blue",
		"cyan",
		"yellow"
	]

	override func setup(tableView tableView: UITableView, parent: UIViewController) {
		super.setup(tableView: tableView, parent: parent)

		clearSeparator()
	}

	override func numberOfRows(section: Int) -> Int {
		return itemArray.count
	}

	override func cellForRow(cell: UITableViewCell, indexPath: NSIndexPath) {
		cell.textLabel?.text = itemArray[indexPath.row]
	}

	override func canEditRow(indexPath: NSIndexPath) -> Bool {
		return true
	}

	override func canMoveRow(indexPath: NSIndexPath) -> Bool {
		return true
	}

}
