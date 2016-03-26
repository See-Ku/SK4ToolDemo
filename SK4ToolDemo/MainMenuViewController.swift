//
//  MainMenuViewController.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/03/23.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit

class MainMenuTableAdmin: SK4TableViewAdmin {

	let itemArray = [
		"PickerView",

		"TableViewAdmin",
		"AlertController",
		"ActionSheet",
		"BorderButton",
		"Toolbar",
		"OverlayIndicator",
		"Notify",
		"CollectionView",


	]

	override func numberOfRows(section: Int) -> Int {
		return itemArray.count
	}

	override func cellForRow(cell: UITableViewCell, indexPath: NSIndexPath) {
		cell.textLabel?.text = itemArray[indexPath.row]
	}

	override func didSelectRow(indexPath: NSIndexPath) {
		let segue = itemArray[indexPath.row]
		parent.performSegueWithIdentifier(segue, sender: nil)
	}
}


class MainMenuViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!

	var tableAdmin: MainMenuTableAdmin!

    override func viewDidLoad() {
        super.viewDidLoad()

		tableAdmin = MainMenuTableAdmin(tableView: tableView, parent: self)

		navigationItem.backBarButtonItem = sk4BarButtonItem(title: "")
    }

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)

		tableAdmin.viewWillAppear()
	}

	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)

	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// eof
