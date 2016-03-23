//
//  TableViewController.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/03/23.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!

	var tableViewAdmin: TableViewAdmin!

    override func viewDidLoad() {
        super.viewDidLoad()

		tableViewAdmin = TableViewAdmin(tableView: tableView, parent: self)

		setupBar(false)
	}

	func setupBar(edit: Bool) {
		let type: UIBarButtonSystemItem = edit ? .Done : .Edit
		let btn = sk4BarButtonItem(system: type, target: self, action: #selector(onEdit))
		navigationItem.rightBarButtonItem = btn
	}

	func onEdit() {
		let flag = !tableView.editing
		tableView.setEditing(flag, animated: true)
		setupBar(flag)
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// eof
