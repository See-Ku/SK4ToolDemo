//
//  SK4StringExtention.swift
//  SK4ToolKit
//
//  Created by See.Ku on 2016/03/27.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import Foundation

extension String {

	// /////////////////////////////////////////////////////////////
	// MARK: - トリミング

	/// 文字列の前後から空白文字を削除
	public func sk4TrimSpace() -> String {
		let cs = NSCharacterSet.whitespaceCharacterSet()
		return sk4Trim(cs)
	}

	/// 文字列の前後から空白文字と改行を削除
	public func sk4TrimSpaceNL() -> String {
		let cs = NSCharacterSet.whitespaceAndNewlineCharacterSet()
		return sk4Trim(cs)
	}

	/// 文字列の前後から指定した文字を削除
	public func sk4Trim(str: String) -> String {
		let cs = NSCharacterSet(charactersInString: str)
		return sk4Trim(cs)
	}

	/// 文字列の前後から指定した文字セットを削除
	public func sk4Trim(charSet: NSCharacterSet) -> String {
		return stringByTrimmingCharactersInSet(charSet)
	}
















	// /////////////////////////////////////////////////////////////
	// MARK: - フレームワーク内部で使用

	/// NSStringを取得
	var nsString: NSString {
		return (self as NSString)
	}

}

// eof
