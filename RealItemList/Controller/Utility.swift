//
//  Utility.swift
//  RealItemList
//
//  Created by TatsuoYagi on 2017/06/29.
//  Copyright © 2017年 TatsuoYagi. All rights reserved.
//

import Foundation

struct Utility{
	static var dateFormat: DateFormatter = {
		let f = DateFormatter()
		f.dateFormat = "yyyy/MM/dd"
		return f
	}()
	
	static var ChainCode : String = {
		return "8a15262b11be5966f5816ecd52f6a177f1dcf3392892ea950f691874af1a7d6657afc03e87edbfe76a8fd7a4082680b2bfc4e836a3127aa656ab72b7651788c5"
	}()
	
	static var BlockChain_url : String = {
		return "https://76c87932401b41fd959e90733cd0954d-vp0.us.blockchain.ibm.com:5004/"
	}()
	
	static var MyHash : String = {
		return "9w3Tn5KtBmFrJRAOyTk6m1R/bVdLt5mVuAlub1ZVSCmN591eZRjwU70tn/AWMEJ9Pm+152SHH8iFe016akT+tQ=="
	}()
}
