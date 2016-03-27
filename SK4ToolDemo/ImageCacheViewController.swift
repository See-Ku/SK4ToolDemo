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
	}

	@IBAction func onDeleteCache(sender: AnyObject) {
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
	// MARK: -

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
