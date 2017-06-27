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
			_return.append(ItemModel().getItemModel(_str: "ニコニコ笑う猫.jpg",_hash: "rSKEj5RmDGGlkjXjxXYXUcZM76eNvJR9owlkjMIcE2l/Bjef/I5J39jQofuzcYcltGdipYyCKSpP6MoUdV8m9w=="))
			_return.append(ItemModel().getItemModel(_str: "7plus_rosegold.png",_hash: "2r/glmpXbEeFrwNxkcHc3eusk1ZtpSKuml0yEKkRXu1Vgp/yWWvWPLPOK7gaChGBDG+cJW+j/xYCNtGUh5Accw=="))
			_return.append(ItemModel().getItemModel(_str: "31u-w0RRlQL.jpg",_hash: "BDWdgjVG3BvfIMq2zib9U/pdj4+9bWu6NhPKrxddWzKEkiSjibrB3yg9Z+639GyQkY+cSpM6YtwpwP8cEejxug=="))
			_return.append(ItemModel().getItemModel(_str: "79b8f1be-s.jpg",_hash: "nXO8d1aqGgOUTEnCOd6FGbcV6e5yEpk3naxPN1mFe41DnPECNmvtC7Co+u1hIfO5R6Jq2m+WGaVg2/XMSNnE9A=="))

			_return.append(ItemModel().getItemModel(_str: "210_1.jpg",_hash: "rSKEj5RmDGGlkjXjxXYXUcZM76eNvJR9owlkjMIcE2l/Bjef/I5J39jQofuzcYcltGdipYyCKSpP6MoUdV8m9w=="))
			_return.append(ItemModel().getItemModel(_str: "0000000001772.jpg",_hash: "2r/glmpXbEeFrwNxkcHc3eusk1ZtpSKuml0yEKkRXu1Vgp/yWWvWPLPOK7gaChGBDG+cJW+j/xYCNtGUh5Accw=="))
			_return.append(ItemModel().getItemModel(_str: "CELINE.jpg",_hash: "BDWdgjVG3BvfIMq2zib9U/pdj4+9bWu6NhPKrxddWzKEkiSjibrB3yg9Z+639GyQkY+cSpM6YtwpwP8cEejxug=="))
			_return.append(ItemModel().getItemModel(_str: "20150528_24580.jpg",_hash: "nXO8d1aqGgOUTEnCOd6FGbcV6e5yEpk3naxPN1mFe41DnPECNmvtC7Co+u1hIfO5R6Jq2m+WGaVg2/XMSNnE9A=="))
			
			_return.append(ItemModel().getItemModel(_str: "8006944501100_00.jpg",_hash: "rSKEj5RmDGGlkjXjxXYXUcZM76eNvJR9owlkjMIcE2l/Bjef/I5J39jQofuzcYcltGdipYyCKSpP6MoUdV8m9w=="))
			_return.append(ItemModel().getItemModel(_str: "20081022154237.JPG",_hash: "2r/glmpXbEeFrwNxkcHc3eusk1ZtpSKuml0yEKkRXu1Vgp/yWWvWPLPOK7gaChGBDG+cJW+j/xYCNtGUh5Accw=="))
			_return.append(ItemModel().getItemModel(_str: "20170410095414.jpg",_hash: "BDWdgjVG3BvfIMq2zib9U/pdj4+9bWu6NhPKrxddWzKEkiSjibrB3yg9Z+639GyQkY+cSpM6YtwpwP8cEejxug=="))
			_return.append(ItemModel().getItemModel(_str: "cl-ce666s-001-m-01-dl.jpg",_hash: "nXO8d1aqGgOUTEnCOd6FGbcV6e5yEpk3naxPN1mFe41DnPECNmvtC7Co+u1hIfO5R6Jq2m+WGaVg2/XMSNnE9A=="))
			
			_return.append(ItemModel().getItemModel(_str: "crsm0000000000.jpg",_hash: "rSKEj5RmDGGlkjXjxXYXUcZM76eNvJR9owlkjMIcE2l/Bjef/I5J39jQofuzcYcltGdipYyCKSpP6MoUdV8m9w=="))
			_return.append(ItemModel().getItemModel(_str: "daison.jpg",_hash: "2r/glmpXbEeFrwNxkcHc3eusk1ZtpSKuml0yEKkRXu1Vgp/yWWvWPLPOK7gaChGBDG+cJW+j/xYCNtGUh5Accw=="))
			_return.append(ItemModel().getItemModel(_str: "DSC05355-575x380.png",_hash: "BDWdgjVG3BvfIMq2zib9U/pdj4+9bWu6NhPKrxddWzKEkiSjibrB3yg9Z+639GyQkY+cSpM6YtwpwP8cEejxug=="))
			_return.append(ItemModel().getItemModel(_str: "1488956091010.jpg",_hash: "nXO8d1aqGgOUTEnCOd6FGbcV6e5yEpk3naxPN1mFe41DnPECNmvtC7Co+u1hIfO5R6Jq2m+WGaVg2/XMSNnE9A=="))
			
			_return.append(ItemModel().getItemModel(_str: "kelly_b.jpg",_hash: "rSKEj5RmDGGlkjXjxXYXUcZM76eNvJR9owlkjMIcE2l/Bjef/I5J39jQofuzcYcltGdipYyCKSpP6MoUdV8m9w=="))
			_return.append(ItemModel().getItemModel(_str: "org_3-291x300.jpg",_hash: "2r/glmpXbEeFrwNxkcHc3eusk1ZtpSKuml0yEKkRXu1Vgp/yWWvWPLPOK7gaChGBDG+cJW+j/xYCNtGUh5Accw=="))
			_return.append(ItemModel().getItemModel(_str: "service_ka60_parts.jpg",_hash: "BDWdgjVG3BvfIMq2zib9U/pdj4+9bWu6NhPKrxddWzKEkiSjibrB3yg9Z+639GyQkY+cSpM6YtwpwP8cEejxug=="))
			_return.append(ItemModel().getItemModel(_str: "TFALICOS.jpg",_hash: "nXO8d1aqGgOUTEnCOd6FGbcV6e5yEpk3naxPN1mFe41DnPECNmvtC7Co+u1hIfO5R6Jq2m+WGaVg2/XMSNnE9A=="))
			
			_return.append(ItemModel().getItemModel(_str: "ダウンロード.jpeg",_hash: "rSKEj5RmDGGlkjXjxXYXUcZM76eNvJR9owlkjMIcE2l/Bjef/I5J39jQofuzcYcltGdipYyCKSpP6MoUdV8m9w=="))
		}
		
		return _return
	}
}
