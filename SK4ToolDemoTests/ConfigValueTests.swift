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
		let cv1 = SK4ConfigInt(title: "Int1", value: 100)

		// 初期化で使用したtitleが両方に使われる
		XCTAssert(cv1.title == "Int1")
		XCTAssert(cv1.identifier == "Int1")

		// そのままだとReadOnly
		XCTAssert(cv1.readOnly == true)

		// 値 == 初期値
		XCTAssert(cv1.value == 100)
		XCTAssert(cv1.defaultValue == "100")

		// 値を直接変更
		cv1.value += 100
		XCTAssert(cv1.value == 200)
		XCTAssert(cv1.string == "200")

		// もちろん初期値は変わらない
		XCTAssert(cv1.defaultValue == "100")

		// 値をstring経由で変更
		cv1.string = "300"
		XCTAssert(cv1.value == 300)
		XCTAssert(cv1.string == "300")

		// push/pop/reset
		cv1.push()
		cv1.string = "400"
		XCTAssert(cv1.value == 400)

		cv1.pop()
		XCTAssert(cv1.value == 300)

		cv1.reset()
		XCTAssert(cv1.value == 100)
	}

	func testCGFloat() {

		let cv1 = SK4ConfigCGFloat(title: "CGFloat1", value: 123.4)
		XCTAssert(cv1.value == 123.4)
		XCTAssert(cv1.defaultValue == "123.40")

		cv1.value -= 200
		XCTAssert(cv1.value == -76.6)
		XCTAssert(cv1.string == "-76.60")

		// 文字列表現と内部の値で誤差が出るのは仕様
		cv1.string = "345.67"
		XCTAssertEqualWithAccuracy(cv1.value, 345.67, accuracy: 0.01)
		XCTAssert(cv1.string == "345.67")
	}
	
	func testUInt64() {

		let cv1 = SK4ConfigUInt64(title: "CGFloat1", value: 0x1234)
		XCTAssert(cv1.value == 4660)
		XCTAssert(cv1.defaultValue == "0000000000001234")

		cv1.value -= 200
		XCTAssert(cv1.value == 4460)
		XCTAssert(cv1.string == "000000000000116c")

		cv1.string = "00123456789abcde"
		XCTAssert(cv1.value == 5124095576030430)
	}

	func testString() {

		let cv1 = SK4ConfigString(title: "String1", value: "testString")
		XCTAssert(cv1.value == "testString")
		XCTAssert(cv1.defaultValue == "testString")

		cv1.value += "200"
		XCTAssert(cv1.value == "testString200")
		XCTAssert(cv1.string == "testString200")

		cv1.string = "00123456789abcde"
		XCTAssert(cv1.value == "00123456789abcde")
	}
	
	func testIndex() {

		let cv1 = SK4ConfigIndex(title: "Index1", value: 3)
		cv1.choices = ["Red", "Green", "Blue", "White", "Black"]

		XCTAssert(cv1.value == 3)
		XCTAssert(cv1.defaultValue == "3")
		XCTAssert(cv1.selectString == "White")

		cv1.value -= 2
		XCTAssert(cv1.value == 1)
		XCTAssert(cv1.selectString == "Green")

		cv1.selectString = "Black"
		XCTAssert(cv1.value == 4)

		cv1.selectString = "Gray"
		XCTAssert(cv1.value == -1)
		XCTAssert(cv1.selectString == nil)
	}
	
	func testUIColor() {

		let cv1 = SK4ConfigUIColor(title: "UIColor1", value: UIColor.redColor())
		XCTAssert(cv1.value == UIColor.redColor())
		XCTAssert(cv1.string == "R:1.000 G:0.000 B:0.000 A:1.000")
		XCTAssert(cv1.defaultValue == "R:1.000 G:0.000 B:0.000 A:1.000")

		cv1.value = UIColor.blueColor()
		XCTAssert(cv1.string == "R:0.000 G:0.000 B:1.000 A:1.000")

		cv1.string = "R:0.000 G:1.000 B:0.000 A:1.000"
		XCTAssert(cv1.value == UIColor.greenColor())
	}
	



}

// eof
