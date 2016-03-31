//
//  SK4ConfigChoiceViewController.swift
//  SK4ToolKit
//
//  Created by See.Ku on 2016/03/31.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit
import SK4Toolkit

// /////////////////////////////////////////////////////////////
// MARK: - SK4ConfigChoiceViewController

/// 複数の選択肢から1つを選ぶViewController
public class SK4ConfigChoiceViewController: SK4TableViewController {

	public var configValue: SK4ConfigValue!

	public override func viewDidLoad() {
		super.viewDidLoad()

		assert(configValue is SK4ConfigIndex, "Wrong config type.")

		let tv = makeDefaultTableView()
		let admin = SK4ConfigChoiceViewControllerAdmin(tableView: tv, parent: self)

		let cv = configValue as! SK4ConfigIndex
		admin.setupConfigIndex(cv)
		setup(tableAdmin: admin)

		navigationItem.title = configValue.title
	}
}


// /////////////////////////////////////////////////////////////
// MARK: - SK4ConfigChoiceViewControllerAdmin

/// SK4ConfigChoiceViewController専用の管理クラス
class SK4ConfigChoiceViewControllerAdmin: SK4TableViewAdmin {

	var configIndex: SK4ConfigIndex!
	var cellStyle = UITableViewCellStyle.Default

	func setupConfigIndex(configIndex: SK4ConfigIndex) {
		self.configIndex = configIndex

		if let cc = configIndex.cell as? SK4ConfigCellChoice {
			if cc.cellStyle == .Default && configIndex.details != nil {
				cellStyle = .Subtitle
			} else {
				cellStyle = cc.cellStyle
			}
		} else {
			cellStyle = .Default
		}

		cellId = "Cell\(cellStyle.rawValue)"
	}

	// /////////////////////////////////////////////////////////////
	// MARK: - for override

	override func viewWillAppear() {
		if configIndex.value >= 0 {
			let index = NSIndexPath(forRow: configIndex.value, inSection: 0)
			tableView.scrollToRowAtIndexPath(index, atScrollPosition: .Middle, animated: false)
		}
	}

	override func numberOfRows(section: Int) -> Int {
		return configIndex.choices.count
	}

	override func cellForRow(cell: UITableViewCell, indexPath: NSIndexPath) {
		cell.textLabel?.text = configIndex.choices[indexPath.row]

		if let details = configIndex.details {
			cell.detailTextLabel?.text = sk4SafeGet(details, index: indexPath.row)
		} else {
			cell.detailTextLabel?.text = nil
		}

		if configIndex.value == indexPath.row {
			cell.accessoryType = .Checkmark
		} else {
			cell.accessoryType = .None
		}
	}

	override func didSelectRow(indexPath: NSIndexPath) {
		if configIndex.selectString != nil {
			let index = NSIndexPath(forRow: configIndex.value, inSection: 0)
			if let old = tableView.cellForRowAtIndexPath(index) {
				old.accessoryType = .None
			}
		}

		if let now = tableView.cellForRowAtIndexPath(indexPath) {
			now.accessoryType = .Checkmark
		}

		tableView.deselectRowAtIndexPath(indexPath, animated: true)
		configIndex.value = indexPath.row

		parent.navigationController?.popViewControllerAnimated(true)
	}

	// /////////////////////////////////////////////////////////////
	// MARK: - UITableViewDataSource

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell: UITableViewCell
		if let tmp = tableView.dequeueReusableCellWithIdentifier(cellId) {
			cell = tmp
		} else {
			cell = UITableViewCell(style: cellStyle, reuseIdentifier: cellId)
		}

		cellForRow(cell, indexPath: indexPath)
		return cell
	}
}

// eof