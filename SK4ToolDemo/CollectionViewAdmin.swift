//
//  CollectionViewAdmin.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/03/26.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit
import SK4Toolkit

class CollectionViewAdmin: SK4CollectionViewAdmin {

	override func numberOfItems(section: Int) -> Int {
		return 26
	}

	override func cellForItem(cell: UICollectionViewCell, indexPath: NSIndexPath) {
		if let cell = cell as? CollectionViewCell {
			cell.setup(indexPath)
		}
	}

	override func sizeForItem(indexPath: NSIndexPath) -> CGSize {
		var si = collectionLayout.itemSize
		si.width += CGFloat(indexPath.row) * 2
		si.height += CGFloat(indexPath.row) * 2
		return si
	}

}

// eof
