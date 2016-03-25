//
//  SK4OverlayIndicatorView.swift
//  SK4ToolKit
//
//  Created by See.Ku on 2016/03/24.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit

/// 全画面に覆い被さるIndicatorクラス　※キャンセル対応
public class SK4OverlayIndicatorView {

	// /////////////////////////////////////////////////////////////
	// MARK: -

	/// Indicatorを表示
	class func show(message: String? = nil, cancelLabel: String? = nil, cancelExec: (()->Void)? = nil) {

		self.canceled = false
		self.cancelExec = cancelExec

		let iv = SK4OverlayIndicatorInnerView()
		iv.setup(message, cancelLabel: cancelLabel, cancelExec: cancelExec)
		iv.startIndicator()
		innerView = iv



	}

	/// Indicatorを隠す
	class func hide() {

	}

	/// true: キャンセルされた
	public static var canceled = false


	/// キャンセル時の処理
	static var cancelExec: (()->Void)?

	static var innerView: SK4OverlayIndicatorInnerView?

	// /////////////////////////////////////////////////////////////
	// MARK: - プロパティ＆初期化


}

class SK4OverlayIndicatorInnerView: UIView {

//	var allView: UIView!
	var baseView: UIView!
	var indicatorView: UIActivityIndicatorView!
	var messagelabel: UILabel?

	var cancelButton: UIButton?

	func startIndicator() {
		if let parent = sk4GetWindow() {
			frame = parent.bounds
			autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
			parent.addSubview(self)

//			indicator = makeIndicator()
//			addSubview(indicator)

			indicatorView.startAnimating()
		} else {
			assertionFailure("Get window error.")
		}
	}

	var useMessage = false

	func setup(message: String?, cancelLabel: String?, cancelExec: (()->Void)?) {

		self.useMessage = (message != nil)

		backgroundColor = UIColor(white: 0.0, alpha: 0.2)

		makeBaseView()
		makeIndicatorView()
		makeMessagelabel(message)
		makeCancelButton(cancelLabel)

		// 画面の中央に固定
		frame = baseView.bounds
//		baseView.clipsToBounds
		baseView.autoresizingMask = [.FlexibleLeftMargin, .FlexibleRightMargin, .FlexibleTopMargin, .FlexibleBottomMargin]
	}

	struct Const {

		/// メッセージが無いときのbaseViewのサイズ
		static let simpleBaseSize = CGSize(width: 80, height: 80)

		/// メッセージがあるときのbaseViewのサイズ
		static let messageBaseSize = CGSize(width: 120, height: 100)
	}

	func makeCancelButton(title: String?) {
		guard let title = title else { return }

		let btn = UIButton(type: UIButtonType.System)
		btn.setTitle(title, forState: UIControlState.Normal)
		btn.setTitle(title, forState: UIControlState.Highlighted)

		let si = Const.messageBaseSize
//		let si = baseView.bounds.size
		btn.frame = CGRect(x: 0, y: si.height + 8, width: si.width, height: 30)
//		btn.frame = CGRect(x: 0, y: 0, width: si.width, height: 30)
//		btn.backgroundColor = UIColor.redColor()
		btn.addTarget(self, action: #selector(SK4OverlayIndicatorInnerView.onCancel), forControlEvents: .TouchUpInside)

		baseView.addSubview(btn)
//		baseView.clipsToBounds = false
//		baseView.userInteractionEnabled = true
		cancelButton = btn
	}

	func onCancel() {
		print(#function)

	}




	func makeMessagelabel(message: String?) {
		guard let message = message else { return }

		let si = Const.messageBaseSize
		let re = CGRect(x: 0, y: si.height - 28, width: si.width, height: 20)
		let label = UILabel(frame: re)
		label.textAlignment = .Center
		label.adjustsFontSizeToFitWidth = true
		label.minimumScaleFactor = 0.5
		label.font = UIFont(name: "AvenirNext-Medium", size: 16)
		label.textColor = UIColor.whiteColor()
		label.text = message
		baseView.addSubview(label)
	}

	func makeIndicatorView() {
		indicatorView = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
		baseView.addSubview(indicatorView)

		let si = CGSize(width: 40, height: 40)
		let pos = CGPoint(x: (baseView.bounds.width - si.width) / 2, y: 20)
		indicatorView.frame = CGRect(origin: pos, size: si)
	}

	func makeBaseView() {

		let wx: CGFloat = 120
		let wy: CGFloat = 140

		baseView = UIView(frame: CGRect(x: 0, y: 0, width: wx, height: wy))

//		baseView = UIView(frame: CGRect(origin: CGPoint.zero, size: si))
//		baseView.backgroundColor = UIColor(white: 0.0, alpha: 0.6)
//		baseView.layer.cornerRadius  = 10.0
//		baseView.layer.masksToBounds = true
//		baseView.layer.addSublayer(<#T##layer: CALayer##CALayer#>)

		let si = useMessage ? Const.messageBaseSize : Const.simpleBaseSize

		let layer = CALayer()
		layer.frame.origin = CGPoint(x: (wx - si.width) / 2, y: 0)
		layer.frame.size = si
		layer.backgroundColor = UIColor(white: 0.0, alpha: 0.6).CGColor
		layer.cornerRadius  = 10.0
		layer.masksToBounds = true
		baseView.layer.addSublayer(layer)

		addSubview(baseView)
	}



/*
	func makeIndicator() -> UIActivityIndicatorView {
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
*/

}


/*
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
	convenience public init(cancel: (()->Void)?) {
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
*/


// eof
