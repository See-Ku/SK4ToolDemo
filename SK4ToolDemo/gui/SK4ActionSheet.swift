//
//  SK4ActionSheet.swift
//  SK4ToolKit
//
//  Created by See.Ku on 2016/03/24.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit

/// ActionSheetを表示するためのクラス
public class SK4ActionSheet: SK4AlertController {

	// /////////////////////////////////////////////////////////////
	// MARK: - プロパティ＆初期化

	/// popover表示で使うsourceView
	public var sourceView: UIView?

	/// popover表示で使うsourceRect
	public var sourceRect = CGRect()

	/// popover表示で使うbarButtonItem
	public var barButtonItem: UIBarButtonItem?

	/// 初期化
	override public init() {
		super.init()

		style = .ActionSheet
	}

	// /////////////////////////////////////////////////////////////
	// MARK: - 表示する位置を指定

	/// ActionSheetを表示する位置を指定
	public func setSourceView(item: AnyObject, parent: UIViewController) {

		// UIBarButtonItemか？
		if let bar = item as? UIBarButtonItem {
			barButtonItem = bar
			return
		}

		// UIViewか？
		if let view = item as? UIView {
			setSourceView(view)
			return
		}

		// 最悪、全画面を対象に表示
		setSourceView(parent.view)
	}

	/// ActionSheetを表示する位置を指定
	public func setSourceView(view: UIView, under: Bool = true) {
		sourceView = view
		sourceRect.size = CGSize()
		sourceRect.origin.x = view.frame.width / 2
		sourceRect.origin.y = under ? view.frame.height : 0
	}

	// /////////////////////////////////////////////////////////////
	// MARK: - その他

	/// UIAlertControllerを生成
	override public func getAlertController() -> UIAlertController {
		let alert = super.getAlertController()
		alert.popoverPresentationController?.sourceView = sourceView
		alert.popoverPresentationController?.sourceRect = sourceRect
		alert.popoverPresentationController?.barButtonItem = barButtonItem
		return alert
	}

}

// eof
