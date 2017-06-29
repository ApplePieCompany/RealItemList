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
	var MyHash : String!

	var myCollectionView : UICollectionView!
	var itemModels: [ItemModel]!
	
	var name: AnyObject? {
		get {return UserDefaults.standard.object(forKey: "name") as AnyObject}
		set {
			UserDefaults.standard.set(newValue!, forKey: "name")
			UserDefaults.standard.synchronize()
		}
	}

	var hashKey: AnyObject? {
		get {return UserDefaults.standard.object(forKey: "hashKey") as AnyObject}
		set {
			UserDefaults.standard.set(newValue, forKey: "hashKey")
			UserDefaults.standard.synchronize()
		}
	}
	
	override init() {
		self.MyHash = Utility.MyHash
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
			_return.append(ItemModel(_name: "ニコニコ笑う猫.jpg",_hashkey: "rSKEj5RmDGGlkjXjxXYXUcZM76eNvJR9owlkjMIcE2l/Bjef/I5J39jQofuzcYcltGdipYyCKSpP6MoUdV8m9w=="))
			_return.append(ItemModel(_name: "7plus_rosegold.png",_hashkey: "2r/glmpXbEeFrwNxkcHc3eusk1ZtpSKuml0yEKkRXu1Vgp/yWWvWPLPOK7gaChGBDG+cJW+j/xYCNtGUh5Accw=="))
			_return.append(ItemModel(_name: "31u-w0RRlQL.jpg",_hashkey: "BDWdgjVG3BvfIMq2zib9U/pdj4+9bWu6NhPKrxddWzKEkiSjibrB3yg9Z+639GyQkY+cSpM6YtwpwP8cEejxug=="))
			_return.append(ItemModel(_name: "79b8f1be-s.jpg",_hashkey: "nXO8d1aqGgOUTEnCOd6FGbcV6e5yEpk3naxPN1mFe41DnPECNmvtC7Co+u1hIfO5R6Jq2m+WGaVg2/XMSNnE9A=="))
			
			_return.append(ItemModel(_name: "210_1.jpg",_hashkey: "rSKEj5RmDGGlkjXjxXYXUcZM76eNvJR9owlkjMIcE2l/Bjef/I5J39jQofuzcYcltGdipYyCKSpP6MoUdV8m9w=="))
			_return.append(ItemModel(_name: "0000000001772.jpg",_hashkey: "2r/glmpXbEeFrwNxkcHc3eusk1ZtpSKuml0yEKkRXu1Vgp/yWWvWPLPOK7gaChGBDG+cJW+j/xYCNtGUh5Accw=="))
			_return.append(ItemModel(_name: "CELINE.jpg",_hashkey: "BDWdgjVG3BvfIMq2zib9U/pdj4+9bWu6NhPKrxddWzKEkiSjibrB3yg9Z+639GyQkY+cSpM6YtwpwP8cEejxug=="))
			_return.append(ItemModel(_name: "20150528_24580.jpg",_hashkey: "nXO8d1aqGgOUTEnCOd6FGbcV6e5yEpk3naxPN1mFe41DnPECNmvtC7Co+u1hIfO5R6Jq2m+WGaVg2/XMSNnE9A=="))
			
			_return.append(ItemModel(_name: "8006944501100_00.jpg",_hashkey: "rSKEj5RmDGGlkjXjxXYXUcZM76eNvJR9owlkjMIcE2l/Bjef/I5J39jQofuzcYcltGdipYyCKSpP6MoUdV8m9w=="))
			_return.append(ItemModel(_name: "20081022154237.JPG",_hashkey: "2r/glmpXbEeFrwNxkcHc3eusk1ZtpSKuml0yEKkRXu1Vgp/yWWvWPLPOK7gaChGBDG+cJW+j/xYCNtGUh5Accw=="))
			_return.append(ItemModel(_name: "20170410095414.jpg",_hashkey: "BDWdgjVG3BvfIMq2zib9U/pdj4+9bWu6NhPKrxddWzKEkiSjibrB3yg9Z+639GyQkY+cSpM6YtwpwP8cEejxug=="))
			_return.append(ItemModel(_name: "cl-ce666s-001-m-01-dl.jpg",_hashkey: "nXO8d1aqGgOUTEnCOd6FGbcV6e5yEpk3naxPN1mFe41DnPECNmvtC7Co+u1hIfO5R6Jq2m+WGaVg2/XMSNnE9A=="))
			
			_return.append(ItemModel(_name: "crsm0000000000.jpg",_hashkey: "rSKEj5RmDGGlkjXjxXYXUcZM76eNvJR9owlkjMIcE2l/Bjef/I5J39jQofuzcYcltGdipYyCKSpP6MoUdV8m9w=="))
			_return.append(ItemModel(_name: "daison.jpg",_hashkey: "2r/glmpXbEeFrwNxkcHc3eusk1ZtpSKuml0yEKkRXu1Vgp/yWWvWPLPOK7gaChGBDG+cJW+j/xYCNtGUh5Accw=="))
			_return.append(ItemModel(_name: "DSC05355-575x380.png",_hashkey: "BDWdgjVG3BvfIMq2zib9U/pdj4+9bWu6NhPKrxddWzKEkiSjibrB3yg9Z+639GyQkY+cSpM6YtwpwP8cEejxug=="))
			_return.append(ItemModel(_name: "1488956091010.jpg",_hashkey: "nXO8d1aqGgOUTEnCOd6FGbcV6e5yEpk3naxPN1mFe41DnPECNmvtC7Co+u1hIfO5R6Jq2m+WGaVg2/XMSNnE9A=="))
			
			_return.append(ItemModel(_name: "kelly_b.jpg",_hashkey: "rSKEj5RmDGGlkjXjxXYXUcZM76eNvJR9owlkjMIcE2l/Bjef/I5J39jQofuzcYcltGdipYyCKSpP6MoUdV8m9w=="))
			_return.append(ItemModel(_name: "org_3-291x300.jpg",_hashkey: "2r/glmpXbEeFrwNxkcHc3eusk1ZtpSKuml0yEKkRXu1Vgp/yWWvWPLPOK7gaChGBDG+cJW+j/xYCNtGUh5Accw=="))
			_return.append(ItemModel(_name: "service_ka60_parts.jpg",_hashkey: "BDWdgjVG3BvfIMq2zib9U/pdj4+9bWu6NhPKrxddWzKEkiSjibrB3yg9Z+639GyQkY+cSpM6YtwpwP8cEejxug=="))
			_return.append(ItemModel(_name: "TFALICOS.jpg",_hashkey: "nXO8d1aqGgOUTEnCOd6FGbcV6e5yEpk3naxPN1mFe41DnPECNmvtC7Co+u1hIfO5R6Jq2m+WGaVg2/XMSNnE9A=="))
			
			_return.append(ItemModel(_name: "ダウンロード.jpeg",_hashkey: "rSKEj5RmDGGlkjXjxXYXUcZM76eNvJR9owlkjMIcE2l/Bjef/I5J39jQofuzcYcltGdipYyCKSpP6MoUdV8m9w=="))
		}
		
		return _return
	}
}
