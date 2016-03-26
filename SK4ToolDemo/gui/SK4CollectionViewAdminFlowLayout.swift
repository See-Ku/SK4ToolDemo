//
//  SK4CollectionViewAdminFlowLayout.swift
//  SK4ToolKit
//
//  Created by See.Ku on 2016/03/26.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit

/// FlowLayoutのUICollectionViewをそれなりに簡単に使うための管理クラス
public class SK4CollectionViewAdminFlowLayout: SK4CollectionViewAdmin, UICollectionViewDelegateFlowLayout {

	override public var collectionLayout: UICollectionViewFlowLayout! {
		return collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
	}

	/// アイテムのサイズを返す
	public func sizeForItem(indexPath: NSIndexPath) -> CGSize {
		return collectionLayout.itemSize
	}

	public func minimumLineSpacing(section: Int) -> CGFloat {
		return collectionLayout.minimumLineSpacing
	}

	public func minimumInteritemSpacing(section: Int) -> CGFloat {
		return collectionLayout.minimumInteritemSpacing
	}

	// /////////////////////////////////////////////////////////////
	// MARK: - UICollectionViewDelegateFlowLayout

	public func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
		return sizeForItem(indexPath)
	}

	public func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, section: Int) -> CGFloat {
		return minimumLineSpacing(section)
	}

	public func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
		return minimumInteritemSpacing(section)
	}
	
}

// eof
