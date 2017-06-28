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
	var upd:String!
	
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
	
	func setOwner(_para:JSON){
		var _dictionary : [String:String] = [:]
		for item in _para["result"]{
			_dictionary[item.0]=item.1.stringValue
		}
		
		if(_dictionary["status"] == "OK"){
			let _message = _dictionary["message"]
			let sp = _message?.components(separatedBy: ",")
			var _cdictionary : [String:String] = [:]
			for item in sp!{
				let csp = item.components(separatedBy: ":")
				_cdictionary[csp[0].replacingOccurrences(of: "\'",with: "")]=csp[1].replacingOccurrences(of: "\'",with: "")
			}
			
			self.serial = _cdictionary["ser"]
			self.upd = _cdictionary["upd"]
		}
	}
}
