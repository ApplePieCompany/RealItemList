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
	
	func getChainCodeAccessModel(_url:String,_method:String,_func:String,_key:String,_val:String?){
		self.url = Utility.BlockChain_url + _url
		self.chainCode = Utility.ChainCode
		self.method = _method
		self.funcs = _func
		self.key = _key
		self.val = _val
		self.makeParams(_key: _key, _val: _val)
	}

	func makeParams(_key:String,_val:String?){
		var _args:[String] = []
		_args.append(_key)
		if(_val != nil){
			_args.append(_val!)
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
