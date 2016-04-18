//
//  InterpolationColorViewController.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/04/18.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit
import SK4Toolkit

class InterpolationColorAdmin: SK4TableViewAdmin {

	let count = 40
	let colorA = UIColor(red: 1.0, green: 0.8, blue: 0, alpha: 1.0)
	let colorB = UIColor(red: 0.4, green: 0.2, blue: 1.0, alpha: 1.0)

	override func numberOfRows(section: Int) -> Int {
		return count
	}

	override func cellForRow(cell: UITableViewCell, indexPath: NSIndexPath) {
		cell.textLabel?.text = "No. \(indexPath.row)"
	}

	func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
		let col = sk4Interpolation(y0: colorA, y1: colorB, x0: 0, x1: CGFloat(count), x: CGFloat(indexPath.row))
		cell.textLabel?.backgroundColor = col
	}

}

class InterpolationColorViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!

	var tableAdmin: InterpolationColorAdmin!

    override func viewDidLoad() {
        super.viewDidLoad()

		tableAdmin = InterpolationColorAdmin(tableView: tableView, parent: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// eof
