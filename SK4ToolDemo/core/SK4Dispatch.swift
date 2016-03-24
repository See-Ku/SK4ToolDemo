//
//  SK4Dispatch.swift
//  SK4ToolKit
//
//  Created by See.Ku on 2016/03/24.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

//import UIKit
import Foundation

// /////////////////////////////////////////////////////////////
// MARK: - 非同期処理

/// グローバルキューで非同期処理
public func sk4AsyncGlobal(exec: (()->Void)) {
	let global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
	dispatch_async(global, exec)
}

/// メインキューで非同期処理
public func sk4AsyncMain(exec: (()->Void)) {
	let main = dispatch_get_main_queue()
	dispatch_async(main, exec)
}

/// 指定した秒数後にメインキューで処理を実行
public func sk4AsyncMain(after: NSTimeInterval, exec: (()->Void)) {
	let delta = after * NSTimeInterval(NSEC_PER_SEC)
	let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delta))
	let main = dispatch_get_main_queue()
	dispatch_after(time, main, exec)
}

/// 現在のスレッドはメインスレッドか？
public func sk4IsMainQueue() -> Bool {
	return NSThread.isMainThread()
}

/// 指定された時間、待機する
public func sk4Sleep(time: NSTimeInterval) {
	NSThread.sleepForTimeInterval(time)
}

// eof
