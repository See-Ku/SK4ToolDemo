//
//  SK4ConfigUInt64.swift
//  SK4ToolKit
//
//  Created by See.Ku on 2016/03/31.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import Foundation

/// UInt64型の設定を管理するためのクラス　※内部管理向け
public class SK4ConfigUInt64 : SK4ConfigGenerics<UInt64> {
	override public var string: String {
		get {
			return String(format: "%016llx", value)
		}

		set {
			let scan = NSScanner(string: newValue)
			scan.scanHexLongLong(&value)
		}
	}

	override public init(title: String, value: UInt64) {
		super.init(title: title, value: value)
	}
}

// eof
