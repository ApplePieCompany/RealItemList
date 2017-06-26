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
	
	override init() {
	}

	func getItemModel(str:String)->ItemModel {
		
		self.blockchainQuery()
		
		self.name = str
		self.imageView = UIImageView()
		self.imageView.frame = CGRect(x: 2, y: 2, width: 50, height: 50)
		self.imageView.image = UIImage(named:str)! as UIImage
		return self
	}
	
	func blockchainQuery(){
		let parameters: Parameters = [
			"jsonrpc": "2.0",
			"method": "query",
			"params": [
				"type": 1,
				"chaincodeID": [
					"name": "8a15262b11be5966f5816ecd52f6a177f1dcf3392892ea950f691874af1a7d6657afc03e87edbfe76a8fd7a4082680b2bfc4e836a3127aa656ab72b7651788c5"
				],
				"ctorMsg": [
					"function": "read",
					"args": ["A101"]
				],
				"secureContext": "user_type2_3"
			],
			"id": 0
		]

		/*
		Alamofire.request("https://76c87932401b41fd959e90733cd0954d-vp0.us.blockchain.ibm.com:5004/chaincode", parameters: parameters).responseJSON{ response in
			let json = JSON(response.result.value )
			json["result"].forEach{(_, data) in
				//				let type = data["type"].string!
				print(data) // foo or bar
			}
		}
		*/
		
		
		var request = URLRequest(url: URL(string: "https://76c87932401b41fd959e90733cd0954d-vp0.us.blockchain.ibm.com:5004/chaincode")!)
		request.httpMethod = "POST"
		request.setValue("application/json", forHTTPHeaderField: "Accept")
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		
		request.httpBody = try! JSONSerialization.data(withJSONObject: parameters)
		
		Alamofire.request(request)
			.responseJSON(completionHandler: { response in
				switch response.result{
					case .failure(let error):
						print(error)
						if let data = response.data, let responseString = String(data: data, encoding: .utf8) {
							print(responseString)
						}
					
					case .success(let responseObject):
						// Received desired output
						print(responseObject)
					}
				})
		
			/*
			.responseString(completionHandler: { response in
				switch response.result {
				case .failure(let error):
					print(error)
					if let data = response.data, let responseString = String(data: data, encoding: .utf8) {
						print(responseString)
					}
				case .success(let responseObject):
					// Received desired output
					print(responseObject)
				}
			})
		*/
		
	}
}
