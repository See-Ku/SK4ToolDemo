//
//  SK4OverlayIndicatorView.swift
//  SK4ToolKit
//
//  Created by See.Ku on 2016/03/24.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit

/// 全画面に覆い被さるIndicatorクラス　※キャンセル対応
public class SK4OverlayIndicatorView: UIView {

	let check = SK4LeakCheck(name: "SK4OverlayIndicatorView")

	// /////////////////////////////////////////////////////////////
	// MARK: - プロパティ＆初期化

	/// true: キャンセルされた
	public var canceled = false

	/// キャンセル時の処理
	var cancelExec: (()->Void)?

	/// 内部で使用するインジケーター
	var indicator: UIActivityIndicatorView!

/*
	override init(frame: CGRect) {
		super.init(frame: frame)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
*/
/*
	init() {
		super.init(frame: CGRect())

	}
*/
/*
	/// 初期化＆開始
	convenience public init() {
		self.init(frame: CGRect())

		setup()
		startIndicator(nil)
	}
*/
/*
	init() {
		super.init(frame: CGRect())

	}
*/

/*
	/// 初期化＆開始
	public init(cancel: (()->Void)? = nil) {
		super.init(frame: CGRect())

		setup()
		startIndicator(cancel)
	}
	
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
//		assertionFailure("You need override me!")
	}
*/

	/// 初期化＆開始
	convenience public init() {
		self.init(frame: CGRect())

		setup()
		startIndicator(nil)
	}

	/// 初期化＆開始
	convenience public init(cancel: (()->Void)? = nil) {
		self.init(frame: CGRect())

		setup()
		startIndicator(cancel)
	}


	/// 終了＆破棄
	deinit {
		stopIndicator()
	}

	/// Viewを初期化
	public func setup() {
		backgroundColor = UIColor(white: 0.0, alpha: 0.2)
	}

	// /////////////////////////////////////////////////////////////

	/// 全画面を覆うインジケーターを開始備　※必ず、stopIndicator()とペアで使用する
	func startIndicator(cancel: (()->Void)?) {
		if let parent = sk4GetWindow() {
			canceled = false
			cancelExec = cancel

			frame = parent.bounds
			autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
			parent.addSubview(self)

			indicator = makeIndicator()
			addSubview(indicator)

			indicator.startAnimating()
		} else {
			assertionFailure("Get window error.")
		}
	}

	/// インジケーターを停止
	func stopIndicator() {
		if let indicator = indicator {
			indicator.stopAnimating()
			removeFromSuperview()
			self.indicator = nil
		}
	}

	// /////////////////////////////////////////////////////////////
	// MARK: - 内部処理

	override public func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
		canceled = true
		cancelExec?()
	}

	public func makeIndicator() -> UIActivityIndicatorView {
		let iv = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
		iv.backgroundColor = UIColor(white: 0.0, alpha: 0.6)
		iv.autoresizingMask = [.FlexibleLeftMargin, .FlexibleRightMargin, .FlexibleTopMargin, .FlexibleBottomMargin]

		let width: CGFloat = 80.0
		let height: CGFloat = 80.0
		let radius: CGFloat = 10.0

		iv.frame.size.width = width
		iv.frame.size.height = height
		iv.frame.origin.x = self.bounds.midX - width/2.0
		iv.frame.origin.y = self.bounds.midY - height/2.0

		iv.layer.cornerRadius  = radius
		iv.layer.masksToBounds = true
		
		return iv
	}

}

// eof
