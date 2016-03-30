//
//  ConfigValueTests.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/03/31.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import XCTest
import SK4ToolDemo

class ConfigValueTests: XCTestCase {

	/// SK4ConfigValueの基本的な要素をテスト
	func testValue() {

		// SK4ConfigIntを使用
		let int1 = SK4ConfigInt(title: "Int1", value: 100)

		// 初期化で使用したtitleが両方に使われる
		XCTAssert(int1.title == "Int1")
		XCTAssert(int1.identifier == "Int1")

		// そのままだとReadOnly
		XCTAssert(int1.readOnly == true)

		// 値 == 初期値
		XCTAssert(int1.value == 100)
		XCTAssert(int1.defaultValue == "100")

		// 値を直接変更
		int1.value += 100
		XCTAssert(int1.value == 200)
		XCTAssert(int1.string == "200")

		// もちろん初期値は変わらない
		XCTAssert(int1.defaultValue == "100")

		// 値をstring経由で変更
		int1.string = "300"
		XCTAssert(int1.value == 300)
		XCTAssert(int1.string == "300")

		// push/pop/reset
		int1.push()
		int1.string = "400"
		XCTAssert(int1.value == 400)

		int1.pop()
		XCTAssert(int1.value == 300)

		int1.reset()
		XCTAssert(int1.value == 100)
	}
}

// eof
