//
//  SK4ImageContext.swift
//  SK4ToolKit
//
//  Created by See.Ku on 2016/03/27.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit

/// CGContext経由での描画を行うためのクラス
public class SK4ImageContext {

	// /////////////////////////////////////////////////////////////
	// MARK: - プロパティ＆初期化（内部用）

	/// 描画範囲
	public let rect: CGRect

	/// 描画で使用するCGContext
	public let context: CGContext

	/// true: deinitでEndImageする
	let release: Bool

	/// 初期化
	init(context: CGContext, rect: CGRect, release: Bool) {
		self.rect = rect
		self.context = context
		self.release = release
	}

	/// 破棄
	deinit {
		if release {
			UIGraphicsEndImageContext()
		}
	}

	// /////////////////////////////////////////////////////////////
	// MARK: - 初期化

	/// サイズを指定してCGContextを生成
	public convenience init(width: CGFloat, height: CGFloat, opaque: Bool = true, scale: CGFloat = 0) {
		let rect = CGRect(x: 0.0, y: 0.0, width: width, height: height)

		UIGraphicsBeginImageContextWithOptions(rect.size, opaque, scale)
		let context = UIGraphicsGetCurrentContext()
		self.init(context: context!, rect: rect, release: true)
	}

	/// サイズを指定してCGContextを生成
	public convenience init(size: CGSize, opaque: Bool = true) {
		self.init(width: size.width, height: size.height, opaque: opaque)
	}

	/// 現在のCGContextからSK4ImageContextを生成
	public class func currentContext() -> SK4ImageContext? {
		if let context = UIGraphicsGetCurrentContext() {
			return SK4ImageContext(context: context, rect: CGRect(), release: false)
		} else {
			return nil
		}
	}

	// /////////////////////////////////////////////////////////////
	// MARK: - その他

	/// CGContextからUIImageを取得
	public func makeImage() -> UIImage {
		return UIGraphicsGetImageFromCurrentImageContext()
	}

	// /////////////////////////////////////////////////////////////
	// MARK: - 描画設定

	public func setFillColor(color: UIColor) {
		CGContextSetFillColorWithColor(context, color.CGColor)
	}

	public func setStrokeColor(color: UIColor) {
		CGContextSetStrokeColorWithColor(context, color.CGColor)
	}

	public func setLineWidth(width: CGFloat) {
		CGContextSetLineWidth(context, width)
	}


	// /////////////////////////////////////////////////////////////
	// MARK: - path & clip

	public func beginPath() {
		CGContextBeginPath(context)
	}

	public func closePath() {
		CGContextClosePath(context)
	}

	public func clip() {
		CGContextClip(context)
	}

	public func evenOddClip() {
		CGContextEOClip(context)
	}

	// /////////////////////////////////////////////////////////////

	public func drawPath(mode: CGPathDrawingMode = .FillStroke) {
		CGContextDrawPath(context, mode)
	}

	public func drawStroke() {
		CGContextDrawPath(context, .Stroke)
	}

	public func drawFill() {
		CGContextDrawPath(context, .Fill)
	}
	


	// /////////////////////////////////////////////////////////////
	// MARK: - 門を丸めた四角

	public func addRoundRect(rect: CGRect, radius: CGFloat) {
		CGContextMoveToPoint(context, rect.minX, rect.midY)
		CGContextAddArcToPoint(context, rect.minX, rect.minY, rect.midX, rect.minY, radius)
		CGContextAddArcToPoint(context, rect.maxX, rect.minY, rect.maxX, rect.midY, radius)
		CGContextAddArcToPoint(context, rect.maxX, rect.maxY, rect.midX, rect.maxY, radius)
		CGContextAddArcToPoint(context, rect.minX, rect.maxY, rect.minX, rect.midY, radius)
		closePath()
	}

	public func drawRoundRect(rect: CGRect, radius: CGFloat, mode: CGPathDrawingMode = .FillStroke) {
		addRoundRect(rect, radius: radius)
		drawPath(mode)
	}



/*

	// /////////////////////////////////////////////////////////////
	// MARK: - 描画関係


	public func setColor(color: UIColor) {
		CGContextSetFillColorWithColor(context, color.CGColor)
		CGContextSetStrokeColorWithColor(context, color.CGColor)
	}


	// /////////////////////////////////////////////////////////////

	public func fillRect() {
		CGContextFillRect(context, rect)
	}

	public func fillRect(rect: CGRect) {
		CGContextFillRect(context, rect)
	}

	public func fillRect(rect: CGRect, color: UIColor) {
		CGContextSetFillColorWithColor(context, color.CGColor)
		CGContextFillRect(context, rect)
	}

	public func fillEllipseInRect(rect: CGRect) {
		CGContextFillEllipseInRect(context, rect)
	}

	public func strokeRect() {
		CGContextStrokeRect(context, rect)
	}

	public func strokeRect(rect: CGRect) {
		CGContextStrokeRect(context, rect)
	}

	public func strokeRect(rect: CGRect, color: UIColor) {
		CGContextSetStrokeColorWithColor(context, color.CGColor)
		CGContextStrokeRect(context, rect)
	}

	public func strokeEllipseInRect(rect: CGRect) {
		CGContextStrokeEllipseInRect(context, rect)
	}

	// /////////////////////////////////////////////////////////////

	public func addRect(rect: CGRect) {
		CGContextAddRect(context, rect)
	}

	public func moveToPoint(x: CGFloat, _ y: CGFloat) {
		CGContextMoveToPoint(context, x, y)
	}

	public func addLineToPoint(x: CGFloat, _ y: CGFloat) {
		CGContextAddLineToPoint(context, x, y)
	}

	// /////////////////////////////////////////////////////////////



	// /////////////////////////////////////////////////////////////
	// MARK: - 状態の保存／復元

	public func saveState() {
		CGContextSaveGState(context)
	}

	public func restoreState() {
		CGContextRestoreGState(context)
	}

	// /////////////////////////////////////////////////////////////
	// MARK: - UIImage転送

	/// イメージ全体を指定された位置に描画
	public func drawImage(image: UIImage, _ toPos: CGPoint) {
		let rect = CGRect(origin: toPos, size: image.size)
		if let img = image.CGImage {
			drawFlipImage(img, rect)
		}
	}

	/// イメージの指定された範囲を指定された位置に描画
	public func drawImage(image: UIImage, _ toPos: CGPoint, _ fromRect: CGRect) {
		let toRect = CGRect(origin: toPos, size: image.size)
		drawImage(image, toRect, fromRect)
	}

	/// イメージの指定された範囲を指定された範囲に描画
	public func drawImage(image: UIImage, var _ toRect: CGRect, var _ fromRect: CGRect) {

		// 転送先のサイズが指定されてない　→　全体に転送
		if toRect.isEmpty {
			toRect.size = rect.size
		}

		// 転送元のサイズが指定されてない　→　全体を転送
		if fromRect.isEmpty {
			fromRect.size = image.size
		}

		// scaleの指定に対応
		if image.scale != 1.0 {
			fromRect.origin.x *= image.scale
			fromRect.origin.y *= image.scale
			fromRect.size.width *= image.scale
			fromRect.size.height *= image.scale
		}

		// 実際の描画処理
		if let src_ref = CGImageCreateWithImageInRect(image.CGImage, fromRect) {
			drawFlipImage(src_ref, toRect)
		}
	}

	/// アスペクト比を維持したままで画像を描画
	public func drawImageAspectFit(image: UIImage, var _ toRect: CGRect, _ fromRect: CGRect) {
		if fromRect.width == 0 || fromRect.height == 0 {
			return
		}

		let ax = toRect.width / fromRect.width
		let ay = toRect.height / fromRect.height
		let rate = min(ax, ay)

		let wx = fromRect.width * rate
		let wy = fromRect.height * rate

		toRect.origin.x += (toRect.width - wx) / 2
		toRect.origin.y += (toRect.height - wy) / 2
		toRect.size.width = wx
		toRect.size.height = wy

		drawImage(image, toRect, fromRect)
	}

	/// 普通に転送すると上下反転してしまうのを修正して転送
	func drawFlipImage(image: CGImage, _ toRect: CGRect) {

		// TODO: Save/Restoreを省略出来ないか？

		var affine = CGAffineTransformIdentity
		affine.d = -1
		affine.ty = toRect.origin.y * 2 + toRect.size.height

		CGContextSaveGState(context)
		CGContextConcatCTM(context, affine)
		CGContextDrawImage(context, toRect, image)
		CGContextRestoreGState(context)
	}

	// /////////////////////////////////////////////////////////////
	// MARK: - グラデーション

	/// CGGradientを生成
	public func gradientCreateWithColorComponents(components: [CGFloat], locations: [CGFloat]) -> CGGradient! {

		assert(components.count % 4 == 0, "components count error.")

		var count = locations.count
		if components.count < count*4 {
			count = components.count/4
		}

		let space = CGColorSpaceCreateDeviceRGB()
		return CGGradientCreateWithColorComponents(space, components, locations, count)
	}

	/// グラデーションを描画
	public func drawLinearGradient(gradient: CGGradient, start: CGPoint, end: CGPoint, options: CGGradientDrawingOptions = []) {
		CGContextDrawLinearGradient(context, gradient, start, end, options)
	}
*/

/*
	/// 他で用意したCGContextを利用
	public convenience init(context: CGContext, rect: CGRect = CGRect()) {
		self.init(context: context, rect: rect, release: false)
	}
*/


}

// eof
