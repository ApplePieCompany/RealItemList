//
//  ListViewModel.swift
//  RealItemList
//
//  Created by TatsuoYagi on 2017/06/23.
//  Copyright © 2017年 TatsuoYagi. All rights reserved.
//

import UIKit

class ListViewModel: NSObject {

	override init() {
	}
	
	func getList()->[String]{
		var _return :[String] = []
		
		for _ in 0..<3 {
			_return.append("ニコニコ笑う猫.jpg")
			_return.append("7plus_rosegold.png")
			_return.append("31u-w0RRlQL.jpg")
			_return.append("79b8f1be-s.jpg")
			_return.append("210_1.jpg")
			_return.append("0000000001772.jpg")
			_return.append("CELINE.jpg")
			_return.append("20150528_24580.jpg")
			_return.append("8006944501100_00.jpg")
			_return.append("20081022154237.JPG")
			_return.append("20170410095414.jpg")
			_return.append("cl-ce666s-001-m-01-dl.jpg")
			_return.append("crsm0000000000.jpg")
			_return.append("daison.jpg")
			_return.append("DSC05355-575x380.png")
			_return.append("1488956091010.jpg")
			_return.append("kelly_b.jpg")
			_return.append("org_3-291x300.jpg")
			_return.append("service_ka60_parts.jpg")
			_return.append("TFALICOS.jpg")
			_return.append("ダウンロード.jpeg")
		}
		
		return _return
	}
}
