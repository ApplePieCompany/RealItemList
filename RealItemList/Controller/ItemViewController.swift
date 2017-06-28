//
//  ItemViewController.swift
//  RealItemList
//
//  Created by TatsuoYagi on 2017/06/23.
//  Copyright © 2017年 TatsuoYagi. All rights reserved.
//

import UIKit
import SwiftyJSON

class ItemViewController: UIViewController {

	var chainCode : String = "8a15262b11be5966f5816ecd52f6a177f1dcf3392892ea950f691874af1a7d6657afc03e87edbfe76a8fd7a4082680b2bfc4e836a3127aa656ab72b7651788c5"
	var chaincode_url : String = "https://76c87932401b41fd959e90733cd0954d-vp0.us.blockchain.ibm.com:5004/chaincode"
	var method_func = ["method":"query","func":"read"]
	var args = "A101"
	
	var name: AnyObject? {
		get {return UserDefaults.standard.object(forKey: "name") as AnyObject}
	}

	var hashKey: AnyObject? {
		get {return UserDefaults.standard.object(forKey: "hashKey") as AnyObject}
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.

		self.view.backgroundColor = UIColor.white

		let chainCodeAccessModel = ChainCodeAccessModel()
		chainCodeAccessModel.url = self.chaincode_url
		chainCodeAccessModel.chainCode = self.chainCode
		chainCodeAccessModel.method = self.method_func["method"]
		chainCodeAccessModel.funcs = self.method_func["func"]
		chainCodeAccessModel.key = self.args
		chainCodeAccessModel.makeParams()
		
		//QUERY CHAIN CODE
		let alamoController = AlamoController()
		alamoController.getAlamofire(model:chainCodeAccessModel) { responseObject, error in
			let json = JSON(responseObject!)
			print(json["result"])
		}
		
		// CollectionView
		let _itemModel : ItemModel = ItemModel(_name: name as! String,_hashkey: hashKey as! String)
		_itemModel.imageView.frame = CGRect(x: 50, y: 50, width: self.view.bounds.width/2, height: self.view.bounds.height/2)
		_itemModel.imageView.contentMode = UIViewContentMode.scaleAspectFill
		self.view.addSubview(_itemModel.imageView)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
	/*
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	// Get the new view controller using segue.destinationViewController.
	// Pass the selected object to the new view controller.
	}
	*/

}
