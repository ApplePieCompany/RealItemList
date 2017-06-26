//
//  ChainCodeAccessModel.swift
//  RealItemList
//
//  Created by TatsuoYagi on 2017/06/26.
//  Copyright © 2017年 TatsuoYagi. All rights reserved.
//

import UIKit
import Alamofire

class ChainCodeAccessModel: NSObject {

	var url:String!
	var chainCode:String!
	var method:String!
	var funcs:String!
	var key:String!
	var val:String? = nil
	
	var parameters: Parameters!
	
	override init() {
	}
	
	func makeParams(){
		var _args:[String] = []
		_args.append(self.key)
		if(self.val != nil){
			_args.append(self.val!)
		}

		self.parameters = [
			"jsonrpc": "2.0",
			"method": self.method,
			"params": [
				"type": 1,
				"chaincodeID": ["name": self.chainCode],
				"ctorMsg": [
					"function": self.funcs,
					"args": _args
				],
				"secureContext": "user_type2_3"
			],
			"id": 0
		]
	}
}
