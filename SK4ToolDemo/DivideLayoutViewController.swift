//
//  DivideLayoutViewController.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/04/05.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit
import SK4Toolkit

class DivideLayoutViewController: UIViewController, SK4DivideLayoutAdminDelegate {

	@IBOutlet weak var divideBaseView: UIView!

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var mainView: MainView!
	@IBOutlet weak var infoLabel: UILabel!

	@IBOutlet weak var buttonA: UIButton!
	@IBOutlet weak var buttonB: UIButton!
	@IBOutlet weak var buttonC: UIButton!
	@IBOutlet weak var buttonD: UIButton!
	@IBOutlet weak var buttonE: UIButton!

	@IBAction func onButton(sender: UIButton) {
		let str = sender.titleForState(UIControlState.Normal) ?? ""
		mainView.word = str
		mainView.setNeedsDisplay()

		if let tmp = infoLabel.text {
			infoLabel.text = tmp + " -> " + str
		} else {
			infoLabel.text = str
		}
	}

	@IBOutlet weak var clearButton: UIButton!

	@IBAction func onClear(sender: AnyObject) {
		infoLabel.text = ""
	}

	// /////////////////////////////////////////////////////////////
	// MARK: - 	SK4DivideLayoutAdminDelegate

	/// ユニットの情報からViewを作成
	func createDivideLayoutView(unit: SK4DivideLayoutUnit) -> UIView {

		// 対応するViewを返す
		switch unit.unitType {
		case "title":
			return titleLabel

		case "main":
			mainView.titleLabel = titleLabel
			return mainView

		case "info":
			return infoLabel

		case "clear":
			return clearButton

		case "unit":
			switch unit.serialNo {
			case 1:
				return buttonA

			case 2:
				return buttonB

			case 3:
				return buttonC

			case 4:
				return buttonD

			case 5:
				return buttonE

			default:
				return SK4DivideLayoutView(debugDraw: true)
			}

		default:
			return SK4DivideLayoutView(debugDraw: true)
		}
	}

	// /////////////////////////////////////////////////////////////

	var layoutAdmin: SK4DivideLayoutAdmin!

    override func viewDidLoad() {
        super.viewDidLoad()

		// レイアウトを読み込み
		layoutAdmin = SK4DivideLayoutAdmin(named: "default")
		layoutAdmin.delegate = self
		layoutAdmin.setBaseView(divideBaseView)
    }

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()

		// 画面のサイズ・向きの変更に対応
		layoutAdmin.updateLayoutAuto(self)
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}

// eof
