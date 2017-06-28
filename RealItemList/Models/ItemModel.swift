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
	var hashkey:String = ""
	var imageView:UIImageView!

	var serial:String!
	var upd:Date!
	
	convenience override init(){
		self.init()
	}

	init(_name:String,_hashkey:String) {
		self.name = _name
		self.hashkey = _hashkey
		self.imageView = UIImageView()
		self.imageView.frame = CGRect(x: 2, y: 2, width: 50, height: 50)
		self.imageView.image = UIImage(named:_name)! as UIImage
	}
	
	func setOwner(_para:AnyObject){
		var dic : [String:String] = [:]
		let sp = _para.components(separatedBy: ",")
		for ele in sp{
			let csp = ele.components(separatedBy: ":")
			dic[csp[0]]=csp[1]
		}
		
		self.serial = dic["ser"]
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy/MM/dd"
		self.upd = formatter.date(from: dic["upd"]!)!
	}
}
