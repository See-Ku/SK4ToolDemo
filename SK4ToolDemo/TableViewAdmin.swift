//
//  TableViewAdmin.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/03/23.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit

class TableViewAdmin: SK4TableViewAdmin {

	let check = SK4LeakCheck(name: "TableViewAdmin")

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

	/// Cellのアクションを使って操作
	override func editActionsForRow(indexPath: NSIndexPath) -> [UITableViewRowAction]? {

		// 削除
		let deleteAction = UITableViewRowAction(style: .Destructive, title: "Delete") { action, indexPath in
			self.itemArray.removeAtIndex(indexPath.row)
			self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
		}

		// 表示
		let printAction = UITableViewRowAction(style: .Normal, title: "Print") { action, indexPath in
			let str = self.itemArray[indexPath.row]
			let ac = SK4AlertController(title: "Print", message: str)
			ac.addDefault("OK")
			ac.presentAlertController(self.parent)

			self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .None)
		}

		printAction.backgroundColor = UIColor.greenColor()

		return [deleteAction, printAction]
	}

	/// 旧来の流れ（？）で削除
	override func commitEditingDelete(indexPath: NSIndexPath) {
		itemArray.removeAtIndex(indexPath.row)
		tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
	}

	override func moveRow(src: NSIndexPath, dst: NSIndexPath) {
		let tmp = itemArray[src.row]
		itemArray.removeAtIndex(src.row)
		itemArray.insert(tmp, atIndex: dst.row)
	}

}
