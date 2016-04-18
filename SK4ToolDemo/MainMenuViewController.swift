//
//  MainMenuViewController.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/03/23.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit
import SK4Toolkit
import SK4SpareKit

class MainMenuTableAdmin: SK4TableViewAdmin {

	let itemArray = [
		"TableViewAdmin",
		"AlertController",
		"ActionSheet",
		"BorderButton",

		"Toolbar",
		"OverlayIndicator",
		"Notify",
		"CollectionView",

		"PickerView",
		"ImageCache",
		"LazyTimer",
		"TextAttributes",

		"ColorPicker",
		"KeyboardObserver",
		"DivideLayout",
		"InterpolationColor",

		"SendMail",
		"AudioPlayer",
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

	@IBAction func onSettings(sender: AnyObject) {

		// 設定画面を開く
		g_config.openConfigViewController(self) { cancel in

			// cancel: true キャンセルされた
			print("openConfigViewController - cancel: \(cancel)")

			if cancel {
				return
			}

			let admin = SK4AudioPlayerAdmin.defaultAdmin
			admin.setup(enable: g_config.soundeEffect.value)
		}
	}

	var tableAdmin: MainMenuTableAdmin!

    override func viewDidLoad() {
        super.viewDidLoad()

		let admin = SK4AudioPlayerAdmin.defaultAdmin
		admin.setup(enable: g_config.soundeEffect.value)

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
