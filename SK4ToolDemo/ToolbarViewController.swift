//
//  ToolbarViewController.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/03/24.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit
import SK4Toolkit

class ToolbarViewController: UIViewController {

	let check = SK4LeakCheck(name: "ToolbarViewController")

	var starFlag = false

	func updateToolbar() {
		let starImage = starFlag ? "star-fill" : "star-outline"

		let star = sk4BarButtonItem(image: starImage, target: self, action: #selector(ToolbarViewController.onFlipStar(_:)))
		let alert = sk4BarButtonItem(title: "Alert", target: self, action: #selector(ToolbarViewController.onAlert(_:)))
		let system = sk4BarButtonItem(system: .Bookmarks, target: self, action: #selector(ToolbarViewController.onBookmarks(_:)))
		let flex = sk4BarButtonItem(system: .FlexibleSpace)

		toolbarItems = [alert, flex, star, flex, system]
	}

	func onFlipStar(sender: AnyObject) {
		starFlag = !starFlag
		updateToolbar()
	}

	func onAlert(sender: AnyObject) {
		sk4AlertView(title: "Alert Title", message: "Alert Message", vc: self)
	}

	func onBookmarks(sender: AnyObject) {
		sk4AlertView(title: "Bookmarks Title", message: "Bookmarks Message", vc: self)
	}

	// /////////////////////////////////////////////////////////////

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)

		navigationController?.toolbarHidden = false
	}

	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)

		navigationController?.toolbarHidden = true
	}

    override func viewDidLoad() {
        super.viewDidLoad()

		updateToolbar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// eof
