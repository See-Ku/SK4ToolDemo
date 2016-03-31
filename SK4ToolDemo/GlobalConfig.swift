//
//  GlobalConfig.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/03/31.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit

class GlobalConfig: SK4ConfigUserDefaults {

	override func onSetup() {
		title = "Test Config"

		testDate()


		testInt()
		testCGFloat()
		testUInt64()
		testString()

		testBool()
		testIndex()
		testIndexSegmented()
		testColor()




		commonInfo()
	}

	// /////////////////////////////////////////////////////////////
	// for SK4ConfigInt

	let int1 = SK4ConfigInt(title: "Label", value: 1000)
	let int2 = SK4ConfigInt(title: "TextField", value: 3000)

	func testInt() {
		let sec = addUserSection("Test Int")
		sec.addConfig(int1)
		sec.addConfig(int2)
		int2.cell = SK4ConfigCellTextField(maxLength: 8)
	}

	// /////////////////////////////////////////////////////////////
	// for SK4ConfigCGFloat

	let cgfloat1 = SK4ConfigCGFloat(title: "Label", value: 100.0)
	let cgfloat2 = SK4ConfigCGFloat(title: "TextField", value: 100.0)

	func testCGFloat() {
		let sec = addUserSection("Test CGFloat")
		sec.addConfig(cgfloat1)
		sec.addConfig(cgfloat2)
		cgfloat2.cell = SK4ConfigCellTextField(maxLength: 8)
	}

	// /////////////////////////////////////////////////////////////
	// for SK4ConfigUInt64

	let ui64_1 = SK4ConfigUInt64(title: "Label", value: 12345678)
	let ui64_2 = SK4ConfigUInt64(title: "TextField", value: 87654321)

	func testUInt64() {
		let sec = addUserSection("Test UInt64")
		sec.addConfig(ui64_1)
		sec.addConfig(ui64_2)
		ui64_2.cell = SK4ConfigCellTextField(maxLength: 24)
	}

	// /////////////////////////////////////////////////////////////
	// for SK4ConfigString

	let string1 = SK4ConfigString(title: "Label", value: "Info")
	let string3 = SK4ConfigString(title: "TextView (No limit)", value: "Input", maxLength: 0)
	let string4 = SK4ConfigString(title: "TextField (Max 10)", value: "Max 10", maxLength: 10)
	let string5 = SK4ConfigString(title: "ReadOnly", value: "Max 10", maxLength: 10)

	func testString() {
		let sec = addUserSection("Test String")
		sec.addConfig(string1)
		sec.addConfig(string3)
		sec.addConfig(string4)
		sec.addConfig(string5)
		string5.readOnly = true
	}

	// /////////////////////////////////////////////////////////////
	// for SK4ConfigBool

	let bool1 = SK4ConfigBool(title: "ReadOnly (true)", value: true)
	let bool2 = SK4ConfigBool(title: "ReadOnly (false)", value: false)
	let bool4 = SK4ConfigBool(title: "TextField", value: false)
	let bool5 = SK4ConfigBool(title: "Switch", value: true)

	func testBool() {
		let sec = addUserSection("Test Bool")
		sec.addConfig(bool1)
		sec.addConfig(bool2)
		sec.addConfig(bool4)
		sec.addConfig(bool5)

		bool1.readOnly = true
		bool2.readOnly = true
		bool4.cell = SK4ConfigCellTextField(maxLength: 4)
	}

	// /////////////////////////////////////////////////////////////
	// for SK4ConfigIndex

	let stringDetail1 = SK4ConfigIndex(title: "Index", value: 0)
	let stringDetail2 = SK4ConfigIndex(title: "Index + Detail", value: 0)
	let stringDetail3 = SK4ConfigIndex(title: "Index / Read Only", value: 0)
	let stringDetail4 = SK4ConfigIndex(title: "Index + Detail / Read Only", value: 0)

	func testIndex() {
		let sec = addUserSection("Test Index")
		sec.addConfig(stringDetail1)
		sec.addConfig(stringDetail2)
		sec.addConfig(stringDetail3)
		sec.addConfig(stringDetail4)

		let select = [
			"Black1", "Blue1", "Red1", "Green1", "Yellow1", "White1",
			"Black2", "Blue2", "Red2", "Green2", "Yellow2", "White3",
			"Black3", "Blue3", "Red3", "Green3", "Yellow3", "White4",
			]

		let detail = [
			"黒1", "青1", "赤1", "緑1", "黄1", "白1",
			"黒2", "青2", "赤2", "緑2", "黄2", "白2",
			"黒3", "青3", "赤3", "緑3", "黄3", "白3",
			]

		stringDetail1.choices = select

		stringDetail2.choices = select
		stringDetail2.details = detail

		stringDetail3.choices = select
		stringDetail3.readOnly = true

		stringDetail4.choices = select
		stringDetail4.details = detail
		stringDetail4.readOnly = true
	}

	// /////////////////////////////////////////////////////////////
	// for SK4ConfigIndex + Segmented

	let stringSegmented1 = SK4ConfigIndex(title: "Seg 2", value: 0)
	let stringSegmented2 = SK4ConfigIndex(title: "Seg 3", value: 0)
	let stringSegmented3 = SK4ConfigIndex(title: "ReadOnly", value: 0)

	func testIndexSegmented() {
		let sec = addUserSection("Test Index + Segmented")
		sec.addConfig(stringSegmented1)
		sec.addConfig(stringSegmented2)
		sec.addConfig(stringSegmented3)

		stringSegmented1.cell = SK4ConfigCellSegmented()
		stringSegmented2.cell = SK4ConfigCellSegmented()
		stringSegmented3.cell = SK4ConfigCellSegmented()

		stringSegmented1.choices = ["White", "Black"]
		stringSegmented2.choices = ["Red", "Blue", "Green"]
		stringSegmented3.choices = ["Red", "Blue", "Green"]
		stringSegmented3.readOnly = true
	}

	// /////////////////////////////////////////////////////////////
	// for SK4ConfigUIColor

	let color1 = SK4ConfigUIColor(title: "Color 1", value: UIColor.orangeColor())
	let color2 = SK4ConfigUIColor(title: "ReadOnly", value: UIColor.greenColor())

	func testColor() {
		let sec = addUserSection("Test Color")
		sec.addConfig(color1)
		sec.addConfig(color2)

		color2.readOnly = true
	}

	// /////////////////////////////////////////////////////////////
	// for SK4ConfigNSDate

	let date1 = SK4ConfigNSDate(title: "Date", value: NSDate(), pickerMode: .Date)
	let date2 = SK4ConfigNSDate(title: "Time", value: NSDate(), pickerMode: .Time)
	let date3 = SK4ConfigNSDate(title: "Date&Time", value: NSDate(), pickerMode: .DateAndTime)
	let date4 = SK4ConfigNSDate(title: "Date(ReadOnly)", value: NSDate(), pickerMode: .Date)

	func testDate() {
		let sec = addUserSection("Test Date")
		sec.addConfig(date1)
		sec.addConfig(date2)
		sec.addConfig(date3)
		sec.addConfig(date4)

		date1.annotation = "Set Date"
		date4.readOnly = true
	}




	// /////////////////////////////////////////////////////////////
	// for common info

	let soundeEffect = SK4ConfigBool(title: "Sound Effect", value: true)
	let version = SK4ConfigString(title: "Version", value: "")

	func commonInfo() {

		// 設定
		let config = addUserSection("Config")
		config.addConfig(soundeEffect)

		// 情報表示セクション
		let info = addUserSection("Information")
		info.addConfig(version)
		version.value = sk4VersionString()
	}


}

// eof
