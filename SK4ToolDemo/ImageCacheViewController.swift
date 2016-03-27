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
	@IBOutlet weak var cacheList: UILabel!

	@IBAction func onSelect(sender: AnyObject) {
	}

	@IBAction func onDeleteCache(sender: AnyObject) {
	}

    override func viewDidLoad() {
        super.viewDidLoad()

		selectSegment.selectedSegmentIndex = UISegmentedControlNoSegment

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// eof
