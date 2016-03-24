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

/*
/// UINavigationBar/UIToolbarから、UIBarButtonItemに対応するUIControlを取得
public func sk4BarButtonToControl(item: AnyObject, toolbar: UIView?) -> UIControl? {

	guard let toolbar = toolbar else { return nil }

	for child in toolbar.subviews {

		// UIControlならターゲットをチェック
		if let ctrl = child as? UIControl {
			for target in ctrl.allTargets() {
				if target === item {
					return ctrl
				}
			}
		}

		// 念のため、孫Viewまでチェック
		if let ctrl = sk4BarButtonToControl(item, toolbar: child) {
			return ctrl
		}
	}

	return nil
}
*/




// eof
