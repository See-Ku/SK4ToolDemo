//
//  GlobalConfig.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/03/31.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit
import SK4Toolkit
import SK4ConfigKit

class GlobalConfig: SK4ConfigUserDefaults {

	override func onSetup() {
		title = "Test Config"

		commonInfo()

		testInt()
		testCGFloat()
		testUInt64()
		testString()

		testBool()
		testIndex()
		testIndexSegmented()
		testColor()

		testDate()
		testMulti()
		testDirectory()
		testAction()
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
	// for SK4ConfigMulti

	let multi1 = SK4ConfigMulti(title: "Multi", separater: " ")
	let multi2 = SK4ConfigMulti(title: "Multi(ReadOnly)", separater: " ")

	func testMulti() {
		let sec = addUserSection("Test Multi")
		sec.addConfig(multi1)
		sec.addConfig(multi2)

		let ar1 = (5...20).map() { no in String(no) }
		let ar2 = (21...40).map() { no in String(no) }

		multi1.annotation = "width x height"
		multi1.addUnit(ar1, select: 5)
		multi1.addUnit("x", width: 24)
		multi1.addUnit(ar2, select: 5)

		multi2.annotation = "left x right"
		multi2.addUnit(ar1, select: 5)
		multi2.addUnit("x", width: 24)
		multi2.addUnit(ar2, select: 5)
		multi2.readOnly = true
	}

	// /////////////////////////////////////////////////////////////
	// for SK4ConfigAdmin (Directory)

	let dir1 = SK4ConfigAdmin(title: "Directory")
	let dirString3 = SK4ConfigString(title: "String", value: "Max 12", maxLength: 12)
	let dirBool4 = SK4ConfigBool(title: "Select", value: false)

	func testDirectory() {
		let sec = addUserSection("Test Directory")
		sec.addConfig(dir1)

		let sub = dir1.addUserSection("")
		sub.addConfig(dirString3)
		sub.addConfig(dirBool4)
	}

	// /////////////////////////////////////////////////////////////
	// for SK4ConfigAction

	let action1 = SK4ConfigAction(title: "Exec Handler")
	let action2 = SK4ConfigAction(title: "Alert Controller")
	let action3 = SK4ConfigAction(title: "Reset Settings")
	let action4 = SK4ConfigAction(title: "Random Settings")

	func testAction() {
		let sec = addUserSection("Test Action")
		sec.addConfig(action1)
		sec.addConfig(action2)
		sec.addConfig(action3)
		sec.addConfig(action4)

		// onActionで何か処理を行う
		// →　テストとして、無理矢理アラートを表示してみる
		action1.onAction = { vc in
			sk4AlertView(title: "action1", message: "message1", vc: vc)
		}

		// 普通にアラートを表示
		let normal = SK4AlertController(title: "action2", message: "message2")
		normal.addDefault("OK")
		action2.alertController = normal.getAlertController()

		// 設定をリセット
		let reset = SK4AlertController(title: "Reset Settings", message: "Reset OK?")
		reset.addCancel("Cancel")
		reset.addDefault("OK") { [weak self] alert in

			print("reset()")
			self?.reset()
			self?.action3.reloadTable()
		}
		action3.alertController = reset.getAlertController()

		// ランダム化
		let random = SK4AlertController(title: "Random Settings", message: "Randomize OK?")
		random.addCancel("Cancel")
		random.addDefault("OK") { [weak self] alert in

			print("random()")
			self?.random()
			self?.action4.reloadTable()
		}
		action4.alertController = random.getAlertController()
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
