//
//  OverlayIndicatorViewController.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/03/24.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit
import SK4Toolkit

class OverlayIndicatorViewController: UIViewController {

	let check = SK4LeakCheck(name: "OverlayIndicatorViewController")

	@IBOutlet weak var statusLabel: UILabel!

	@IBAction func onStartIndicator(sender: AnyObject) {

		// インジケーターを開始
		SK4OverlayIndicator.show("Please wait...", cancelLabel: "Cancel")

		let sw = SK4StopWatch()

		sk4AsyncGlobal() {

			// 時間のかかる処理
			for i in 0..<100 {
				sk4Sleep(0.1)

				// 画面の更新
				sk4AsyncMain() {
					self.statusLabel.text = "indicator: \(sw.totalSecond()) sec"
					SK4OverlayIndicator.updateMessage("count \(i)")
				}

				// キャンセルに対応
				if SK4OverlayIndicator.canceled {
					break
				}
			}

			// 終了後の処理
			sk4AsyncMain() {
				SK4OverlayIndicator.hide()
				if SK4OverlayIndicator.canceled {
					self.statusLabel.text = "Canceled"
				} else {
					self.statusLabel.text = "Finish"
				}
			}
		}
	}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// eof
