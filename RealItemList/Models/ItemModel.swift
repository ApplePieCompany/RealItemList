//
//  ItemModel.swift
//  RealItemList
//
//  Created by TatsuoYagi on 2017/06/23.
//  Copyright © 2017年 TatsuoYagi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ItemModel: NSObject {

	var name:String = ""
	var imageView:UIImageView!
	var hashkey:String = ""
	
	override init() {
	}

	func getItemModel(_str:String, _hash:String)->ItemModel {
		self.name = _str
		self.hashkey = _hash
		self.imageView = UIImageView()
		self.imageView.frame = CGRect(x: 2, y: 2, width: 50, height: 50)
		self.imageView.image = UIImage(named:_str)! as UIImage
		return self
	}	
}
