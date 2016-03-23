//
//  SK4ToolKit.swift
//  SK4ToolKit
//
//  Created by See.Ku on 2016/03/23.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit


// /////////////////////////////////////////////////////////////
// MARK: - 各種定数

public let SK4ToolKitVersion = 3.0


// /////////////////////////////////////////////////////////////
// MARK: - UIBarButtonItem

/// 標準のUIBarButtonItemを作成
public func sk4BarButtonItem(title title: String, target: AnyObject? = nil, action: Selector = nil) -> UIBarButtonItem {
	return UIBarButtonItem(title: title, style: .Plain, target: target, action: action)
}

/// Image付きのUIBarButtonItemを作成
public func sk4BarButtonItem(image image: String, target: AnyObject? = nil, action: Selector = nil) -> UIBarButtonItem {
	let img = UIImage(named: image)
	return UIBarButtonItem(image: img, style: .Plain, target: target, action: action)
}

/// SystemItemを使ったUIBarButtonItemを作成
public func sk4BarButtonItem(system system: UIBarButtonSystemItem, target: AnyObject? = nil, action: Selector = nil) -> UIBarButtonItem {
	return UIBarButtonItem(barButtonSystemItem: system, target: target, action: action)
}


// eof
