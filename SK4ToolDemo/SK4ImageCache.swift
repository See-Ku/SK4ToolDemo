//
//  SK4ImageCache.swift
//  SK4ToolKit
//
//  Created by See.Ku on 2016/03/27.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit

/// シンプルなイメージキャッシュクラス
public class SK4ImageCache {

	let cache = NSCache()

	/// イメージをキャッシュする最大数
	public var cacheLimit: Int {
		get {
			return cache.countLimit
		}

		set {
			cache.countLimit = newValue
		}
	}

	/// キャッシュファイルの接頭辞
	public var cachePrefix = "###"

	/// キャッシュファイルの接尾辞
	public var cacheSuffix = ".png"

	/// キャッシュファイルを保存するディレクトリ
	public var cacheDir = sk4GetCachesDirectory()

	/// 初期化
	public init() {
		cache.evictsObjectsWithDiscardedContent = true
		cacheLimit = 100
	}

	/// 最大数を指定して初期化
	public convenience init(cacheLimit: Int) {
		self.init()
		self.cacheLimit = cacheLimit
	}

	// /////////////////////////////////////////////////////////////
	// MARK: - イメージを生成＆キャッシュ使用

	var makingList = Set<String>()

	/// キャッシュファイルから読み込み。存在しない場合はイメージを作成
	public func manageCacheFile(name: String, imageMaker: (()->UIImage?)) -> UIImage? {

		// キャッシュファイルに保存されているか？
		if let image = loadCacheFile(name) {
			return image
		}

		// すでにイメージを作成中か？
		if makingList.contains(name) {
			return nil
		}

		// 新しくイメージを作成
		makingList.insert(name)

		sk4AsyncGlobal() {
			let image = imageMaker()

			sk4AsyncMain() { [weak self] in
				self?.saveCacheFile(name, image: image)
				self?.makingList.remove(name)
			}
		}

		return nil
	}

	/// イメージをキャッシュファイルから読み込み
	public func loadCacheFile(name: String) -> UIImage? {
		let path = makeCachePath(name)
		return loadImage(path)
	}

	/// イメージをキャッシュファイルに保存
	public func saveCacheFile(name: String, image: UIImage?) {
		let path = makeCachePath(name)
		setImage(path, image: image)

		if let image = image {

			// イメージをキャッシュファイルに保存
			if let data = UIImagePNGRepresentation(image) {
				data.writeToFile(path, atomically: true)
			} else {
				sk4DebugLog("UIImagePNGRepresentation error: \(name)")
			}

		} else {

			// キャッシュされたファイルを削除
			sk4DeleteFile(path)
		}
	}

	// /////////////////////////////////////////////////////////////
	// MARK: - イメージをファイルから読み込み＆キャッシュ

	/// パスを指定してイメージを読み込み
	public func loadImage(path: String, mode: UIImageRenderingMode = .Automatic) -> UIImage? {

		// キャッシュされているか？
		if let image = getImage(path) {
			return image
		}

		// 必要ならイメージを読み込み＆レンダリングモードに対応
		var image = UIImage(contentsOfFile: path)
		if mode != .Automatic {
			image = image?.imageWithRenderingMode(mode)
		}

		// 展開後のイメージをキャッシュ
		setImage(path, image: image)
		return image
	}

	/// バンドルされたイメージを読み込み
	public func loadBundleImage(name: String, ofType: String = "png", mode: UIImageRenderingMode = .Automatic) -> UIImage? {
		let bundle = NSBundle.mainBundle()
		if let path = bundle.pathForResource(name, ofType: ofType) {
			return loadImage(path, mode: mode)
		}
		return nil
	}

	// /////////////////////////////////////////////////////////////
	// MARK: - イメージを直接登録／取得

	/// イメージをキャッシュに登録
	public func setImage(name: String, image: UIImage?) {
		if let image = image {
			cache.setObject(image, forKey: name)
		} else {
			cache.removeObjectForKey(name)
		}
	}

	/// イメージをキャッシュから取得
	public func getImage(name: String) -> UIImage? {
		return cache.objectForKey(name) as? UIImage
	}

	// /////////////////////////////////////////////////////////////
	// MARK: - その他

	/// キャッシュされたイメージをすべて削除
	public func removeAll() {
		cache.removeAllObjects()
	}

	/// イメージのキャッシュファイルをすべて削除
	public func deleteCacheFileAll() {
		let dir = sk4GetCachesDirectory()
		let ar = sk4FileListAtPath(dir)

		for fn in ar {
			if fn.hasPrefix(cachePrefix) && fn.hasSuffix(cacheSuffix) {
				sk4DeleteFile(dir + fn)
			}
		}
	}

	/// キャッシュファイルのパスを生成
	public func makeCachePath(name: String) -> String {
		return sk4GetCachesDirectory() + cachePrefix + name + cacheSuffix
	}
	
}

// eof
