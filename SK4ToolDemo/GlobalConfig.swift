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

		testInt()


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
