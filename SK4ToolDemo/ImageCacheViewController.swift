//
//  ImageCacheViewController.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/03/27.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit

class ImageCacheViewController: UIViewController {

	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var selectSegment: UISegmentedControl!
	@IBOutlet weak var cacheList: UILabel!

	@IBAction func onDeleteCache(sender: AnyObject) {
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
