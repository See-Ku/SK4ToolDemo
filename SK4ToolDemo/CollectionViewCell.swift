//
//  CollectionViewCell.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/03/27.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

	@IBOutlet weak var charLabel: UILabel!

	func setup(indexPath: NSIndexPath) {
		let ch_src = UnicodeScalar("A")
		let ch_dst = UnicodeScalar(ch_src.value + UInt32(indexPath.row))
		charLabel.text = String(ch_dst)
	}

}

// eof
