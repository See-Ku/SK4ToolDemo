//
//  ImageCacheViewController.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/03/27.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit

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

		return UIImage()

/*
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
*/
	}

/*
	func makeImage0(ic: SK4ImageContext) {
		let si = Const.size
		let color = UIColor.redColor()

		ic.setFillColor(UIColor.whiteColor())
		ic.setStrokeColor(color)
		ic.setLineWidth(4)

		let re = CGRect(x: 8, y: 8, width: si-16, height: si-16)
		ic.drawRoundRect(re, radius: 10)

		drawString("A", color: color, size: si)
	}

	func makeImage1(ic: SK4ImageContext) {
		let si = Const.size
		let color = UIColor.greenColor()

		ic.setFillColor(UIColor.whiteColor())
		ic.setStrokeColor(color)
		ic.setLineWidth(4)

		let re = CGRect(x: 8, y: 8, width: si-16, height: si-16)
		ic.drawRoundRect(re, radius: 10)

		ic.saveState()
		let re2 = CGRect(x: 0, y: 0, width: si/2, height: si)
		ic.addRect(re2)
		ic.clip()
		drawString("B", color: UIColor.blueColor(), size: si)
		ic.restoreState()

		ic.saveState()
		let re3 = CGRect(x: si/2, y: 0, width: si/2, height: si)
		ic.addRect(re3)
		ic.clip()
		drawString("D", color: UIColor.cyanColor(), size: si)
		ic.restoreState()
	}

	func makeImage2(ic: SK4ImageContext) {
		let si = Const.size / 2
		let color = UIColor.blueColor()

		let loc: [CGFloat] = [0,0.5,1]
		let com: [CGFloat] = [
			1,0,0,1,	//	red
			0,1,0,1,	//	green
			0,0,1,1,	//	blue
		]

		let gra = ic.gradientCreateWithColorComponents(com, locations: loc)

		let p0 = CGPoint(x: -20, y: 0)
		let p1 = CGPoint(x: Const.size+20, y: Const.size)
		ic.drawLinearGradient(gra, start: p0, end: p1)

		ic.setFillColor(UIColor.whiteColor())
		ic.setStrokeColor(color)
		ic.setLineWidth(4)

		let re = CGRect(x: 8, y: 8, width: si-16, height: si-16)
		ic.drawRoundRect(re, radius: 10)

		drawString("C", color: color, size: si)
	}

	func drawString(str: String, color: UIColor, size: CGFloat) {
		let atr = SK4TextAttributes()
		atr.textColor = color
		atr.font = UIFont(name: "ArialRoundedMTBold", size: size - 10)
		atr.alignment = .Center

		let re = CGRect(x: 0, y: 0, width: size, height: size)
		str.sk4DrawInRect(re, withAttributes: atr.attributes, vertical: .Center)
	}

*/


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
