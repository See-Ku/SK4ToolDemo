//
//  SK4ConfigCellLabel.swift
//  SK4ToolKit
//
//  Created by See.Ku on 2016/03/30.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit

/// 設定を表示
public class SK4ConfigCellLabel: SK4ConfigCell {
	override public init() {
		super.init()

		readOnly = true
	}

	override public func configToCell(cell: UITableViewCell) {
		cell.textLabel?.text = configValue.title
		cell.detailTextLabel?.text = configValue.string

		//		if accessoryType == .DisclosureIndicator && readOnly {
		//			cell.accessoryType = .None
		//		} else {
		//			cell.accessoryType = accessoryType
		//		}
	}
}

// eof
