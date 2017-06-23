//
//  ItemModel.swift
//  RealItemList
//
//  Created by TatsuoYagi on 2017/06/23.
//  Copyright © 2017年 TatsuoYagi. All rights reserved.
//

import UIKit

class ItemModel: NSObject {

	var name:String = ""
	var imageView:UIImageView!
	
	override init() {
	}

	func getItemModel(str:String)->ItemModel {
		self.name = str
		self.imageView = UIImageView()
		self.imageView.frame = CGRect(x: 2, y: 2, width: 50, height: 50)
		self.imageView.image = UIImage(named:str)! as UIImage
		return self
	}
	
}
