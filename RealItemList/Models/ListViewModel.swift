//
//  ListViewModel.swift
//  RealItemList
//
//  Created by TatsuoYagi on 2017/06/23.
//  Copyright © 2017年 TatsuoYagi. All rights reserved.
//

import UIKit

class ListViewModel: NSObject{

	let constNavigationTitle = "My正規商品リスト"
	let constReuseIdentifier = "MyCell"

	var myCollectionView : UICollectionView!
	var itemModels: [ItemModel]!
	
	var name: AnyObject? {
		get {return UserDefaults.standard.object(forKey: "name") as AnyObject}
		set {
			UserDefaults.standard.set(newValue!, forKey: "name")
			UserDefaults.standard.synchronize()
		}
	}
	
	override init() {
	}
	
	func getMyCollecionView(frame:CGRect)->UICollectionView{
		let layout = UICollectionViewFlowLayout()
		layout.itemSize = CGSize(width:54, height:54)
		layout.sectionInset = UIEdgeInsetsMake(8, 16, 8, 16)
		layout.headerReferenceSize = CGSize(width:100,height:8)

		let _return = UICollectionView(frame: frame, collectionViewLayout: layout)
		_return.backgroundColor = UIColor.white
		_return.register(UICollectionViewCell.self, forCellWithReuseIdentifier: self.constReuseIdentifier)
		
		return _return
	}
	
	func getItemModels()->[ItemModel]{
		var _return:[ItemModel] = []
		
		for _ in 0..<3 {
			_return.append(ItemModel().getItemModel(str: "ニコニコ笑う猫.jpg"))
			_return.append(ItemModel().getItemModel(str: "7plus_rosegold.png"))
			_return.append(ItemModel().getItemModel(str: "31u-w0RRlQL.jpg"))
			_return.append(ItemModel().getItemModel(str: "79b8f1be-s.jpg"))
			_return.append(ItemModel().getItemModel(str: "210_1.jpg"))
			_return.append(ItemModel().getItemModel(str: "0000000001772.jpg"))
			_return.append(ItemModel().getItemModel(str: "CELINE.jpg"))
			_return.append(ItemModel().getItemModel(str: "20150528_24580.jpg"))
			_return.append(ItemModel().getItemModel(str: "8006944501100_00.jpg"))
			_return.append(ItemModel().getItemModel(str: "20081022154237.JPG"))
			_return.append(ItemModel().getItemModel(str: "20170410095414.jpg"))
			_return.append(ItemModel().getItemModel(str: "cl-ce666s-001-m-01-dl.jpg"))
			_return.append(ItemModel().getItemModel(str: "crsm0000000000.jpg"))
			_return.append(ItemModel().getItemModel(str: "daison.jpg"))
			_return.append(ItemModel().getItemModel(str: "DSC05355-575x380.png"))
			_return.append(ItemModel().getItemModel(str: "1488956091010.jpg"))
			_return.append(ItemModel().getItemModel(str: "kelly_b.jpg"))
			_return.append(ItemModel().getItemModel(str: "org_3-291x300.jpg"))
			_return.append(ItemModel().getItemModel(str: "service_ka60_parts.jpg"))
			_return.append(ItemModel().getItemModel(str: "TFALICOS.jpg"))
			_return.append(ItemModel().getItemModel(str: "ダウンロード.jpeg"))
		}
		
		return _return
	}
}
