//
//  SK4ConfigInt.swift
//  SK4ToolKit
//
//  Created by See.Ku on 2016/03/31.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import Foundation

/// Int型の設定を管理するためのクラス
public class SK4ConfigInt : SK4ConfigGenerics<Int> {
	override public var string: String {
		get {
			return String(value)
		}

		set {
			value = newValue.nsString.integerValue
		}
	}

	override public init(title: String, value: Int) {
		super.init(title: title, value: value)
	}
}

// eof
