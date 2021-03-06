//
//  CollectionViewController.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/03/26.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit
import SK4Toolkit

class CollectionViewController: UIViewController {

	let check = SK4LeakCheck(name: "CollectionViewController")

	@IBOutlet weak var collectionView: UICollectionView!

	var collectionViewAdmin: CollectionViewAdmin!

    override func viewDidLoad() {
        super.viewDidLoad()

		collectionViewAdmin = CollectionViewAdmin(collectionView: collectionView, parent: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// eof
