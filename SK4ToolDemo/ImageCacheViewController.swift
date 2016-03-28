//
//  ImageCacheViewController.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/03/27.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit
import SK4Toolkit

class ImageCacheViewController: UIViewController {

	let check = SK4LeakCheck(name: "ImageCacheViewController")

	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var selectSegment: UISegmentedControl!
	@IBOutlet weak var cacheFileList: UITextView!

	@IBAction func onSelect(sender: AnyObject) {
		let no = sender.selectedSegmentIndex
		let name = "name\(no)"

		// キャッシュがあれば使用。無ければ生成する
		imageView.image = cache.manageCacheFile(name) {
			let image = self.makeImage(no)

			// 生成した場合、メインスレッドで自力でセット
			sk4AsyncMain() {
				self.imageView.image = image
				self.listUpdate.fire()
			}

			return image
		}
	}

	@IBAction func onDeleteCache(sender: AnyObject) {
		cache.removeCacheAll()
		cache.deleteCacheFileAll()
		imageView.image = nil
		selectSegment.selectedSegmentIndex = UISegmentedControlNoSegment
		updateCacheList()
	}

	let cache = SK4ImageCache()
	let listUpdate = SK4LazyTimer()

    override func viewDidLoad() {
        super.viewDidLoad()

		selectSegment.selectedSegmentIndex = UISegmentedControlNoSegment

		listUpdate.setup(hold: 0.5) { [weak self] in
			self?.updateCacheList()
		}

		listUpdate.fire()
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	// /////////////////////////////////////////////////////////////
	// MARK: - イメージを生成

	struct Const {
		static let size: CGFloat = 200
	}

	func makeImage(no: Int) -> UIImage {
		let ic = SK4ImageContext(width: Const.size, height: Const.size, opaque: false)

		switch no {
		case 0:
			makeImage0(ic)

		case 1:
			makeImage1(ic)

		case 2:
			makeImage2(ic)

		default:
			makeImage0(ic)
		}

		return ic.makeImage()
	}

	func makeImage0(ic: SK4ImageContext) {
		let si = Const.size
		var re = CGRect(x: 8, y: 8, width: si-16, height: si-16)

		// 花の画像をアスペクト比を保ったまま転送
		if let img = UIImage(named: "flower") {
			ic.drawImageAspectFit(img, toRect: re)
		}

		// 角丸の四角
		let color = UIColor.redColor()
		ic.setLineWidthColor(4, stroke: color, fill: .whiteColor())
		ic.drawRoundRect(re, radius: 10)

		// 上に大きく『A』
		let dif: CGFloat = 40
		re.size.height -= dif
		drawString("A", color: color, rect: re)

		// 下に小さくランダムな数字
		re.origin.y += re.size.height
		re.size.height = dif

		let no = sk4Random(100)
		let str = String(no)
		drawString(str, color: color, rect: re)
	}

	func makeImage1(ic: SK4ImageContext) {

		// 角丸の四角
		let si = Const.size
		var re = CGRect(x: 8, y: 8, width: si-16, height: si-16)
		let color = UIColor.greenColor()
		ic.setLineWidthColor(4, stroke: color, fill: .whiteColor())
		ic.drawRoundRect(re, radius: 10)

		let dif: CGFloat = 40
		re.size.height -= dif

		// 左半分に『B』
		ic.saveState()
		ic.addRect(CGRect(x: 0, y: 0, width: si/2, height: si))
		ic.clip()
		drawString("B", color: .blueColor(), rect: re)
		ic.restoreState()

		// 右左半分に『B』
		ic.saveState()
		ic.addRect(CGRect(x: si/2, y: 0, width: si/2, height: si))
		ic.clip()
		drawString("C", color: .cyanColor(), rect: re)
		ic.restoreState()

		// 下に小さくランダムな数字
		re.origin.y += re.size.height
		re.size.height = dif

		let no = sk4Random(100)
		let str = String(no)
		drawString(str, color: color, rect: re)
	}

	func makeImage2(ic: SK4ImageContext) {

		// グラデーションで塗りつぶし
		let loc: [CGFloat] = [0.0, 0.5, 1.0]
		let com: [CGFloat] = [
			1.0, 0.5, 0.5, 1.0,	//	red
			0.5, 1.0, 0.5, 1.0,	//	green
			0.5 ,0.5 ,1.0, 1.0,	//	blue
		]

		let gra = ic.createGradient(com, locations: loc)
		let p0 = CGPoint(x: -20, y: 0)
		let p1 = CGPoint(x: Const.size+20, y: Const.size)
		ic.drawLinearGradient(gra, start: p0, end: p1)

		// 左上に角丸で『D』
		let color = UIColor.blueColor()
		ic.setLineWidthColor(4, stroke: color, fill: .whiteColor())

		let si = Const.size / 2
		let re = CGRect(x: 8, y: 8, width: si-16, height: si-16)
		ic.drawRoundRect(re, radius: 10)
		drawString("D", color: color, rect: re)

		// 下に小さくランダムな数字
		let dif: CGFloat = 40
		let py = Const.size - 8 - dif
		let re2 = CGRect(x: 0, y: py, width: Const.size, height: dif)

		let no = sk4Random(100)
		let str = String(no)
		drawString(str, color: color, rect: re2)
	}

	func drawString(str: String, color: UIColor, rect: CGRect) {
		let atr = SK4TextAttributes()
		atr.textColor = color
		atr.font = UIFont(name: "ArialRoundedMTBold", size: rect.height)
		atr.alignment = .Center
		str.sk4DrawInRect(rect, withAttributes: atr.attributes, vertical: .Center)
	}

	// /////////////////////////////////////////////////////////////
	// MARK: - その他

	/// キャッシュファイルの一覧を更新
	func updateCacheList() {
		var str = "Cache File:\n"
		let ar = sk4FileListAtPath(cache.dir)
		for fn in ar {
			if fn.hasPrefix(cache.prefix) && fn.hasSuffix(cache.suffix) {
				str += "\(fn)\n"
			}
		}
		cacheFileList.text = str
	}

}

// eof
