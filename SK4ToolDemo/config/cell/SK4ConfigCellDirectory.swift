//
//  SK4ConfigCellDirectory.swift
//  SK4ToolKit
//
//  Created by See.Ku on 2016/03/30.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit

/// 設定の階層構造を表示　※SK4ConfigAdmin専用
class SK4ConfigCellDirectory: SK4ConfigCell {

	override init() {
		super.init()
	}

	override func configToCell(cell: UITableViewCell) {
		cell.textLabel?.text = configValue.title
		cell.detailTextLabel?.text = configValue.string
		cell.accessoryType = .DisclosureIndicator
	}

	override func nextViewController() -> UIViewController? {
		configTable.dirViewController.subDir = true
		configTable.dirViewController.configAdmin = configValue as? SK4ConfigAdmin
		return configTable.dirViewController
	}
}

// eof
