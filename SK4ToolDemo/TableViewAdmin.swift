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

	/// Cellのアクションを使って削除
	override func editActionsForRow(indexPath: NSIndexPath) -> [UITableViewRowAction]? {

		// 削除
		let deleteAction = UITableViewRowAction(style: .Destructive, title: "Delete") { [weak self] action, indexPath in
			self?.itemArray.removeAtIndex(indexPath.row)
			self?.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
		}

//		del.backgroundColor = UIColor.redColor()

		let printAction = UITableViewRowAction(style: .Normal, title: "Print") { [weak self] action, indexPath in
//			self?.itemArray.removeAtIndex(indexPath.row)
//			self?.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)

			if let ws = self {
				print(ws.itemArray[indexPath.row])
			}
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
