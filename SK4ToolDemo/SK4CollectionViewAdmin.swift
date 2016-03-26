//
//  SK4CollectionViewAdmin.swift
//  SK4ToolKit
//
//  Created by See.Ku on 2016/03/26.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit

/// UICollectionViewを簡単に使うための管理クラス
public class SK4CollectionViewAdmin: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {

	// /////////////////////////////////////////////////////////////
	// MARK: - プロパティ＆初期化

	/// 管理対象のCollectionView
	public weak var collectionView: UICollectionView!

	/// 親ViewController
	public weak var parent: UIViewController!

	/// 標準で使うCellのID
	public var cellId = "Cell"

	/// レイアウトを取得
	public var collectionLayout: UICollectionViewLayout! {
		return collectionView?.collectionViewLayout
	}

	/// 初期化
	public convenience init(collectionView: UICollectionView, parent: UIViewController) {
		self.init()

		 setup(collectionView: collectionView, parent: parent)
	}

	/// 初期化
	public func setup(collectionView collectionView: UICollectionView, parent: UIViewController) {
		self.collectionView = collectionView
		self.parent = parent

		collectionView.delegate = self
		collectionView.dataSource = self
	}

	// /////////////////////////////////////////////////////////////
	// MARK: - for override

	/// ViewControllerが表示になる
	public func viewWillAppear() {
	}

	/// ViewControllerが非表示になる
	public func viewWillDisappear() {
	}

	// /////////////////////////////////////////////////////////////

	/// アイテムの数を返す
	public func numberOfItems(section: Int) -> Int {
		assertionFailure("You need override me!")
		return 0
	}

	/// Cellの内容をセット
	public func cellForItem(cell: UICollectionViewCell, indexPath: NSIndexPath) {
	}

	/// Cellが選択された
	public func didSelectItem(indexPath: NSIndexPath) {
	}

	// /////////////////////////////////////////////////////////////
	// MARK: - UICollectionViewDataSource

	public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return numberOfItems(section)
	}

	public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath)
		cellForItem(cell, indexPath: indexPath)
		return cell
	}

	// /////////////////////////////////////////////////////////////
	// MARK: - UICollectionViewDelegate

	public func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
		return didSelectItem(indexPath)
	}
	
}

// eof
