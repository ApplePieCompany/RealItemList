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

		// CollectionView
		let _itemModel : ItemModel = ItemModel(_name: name as! String,_hashkey: hashKey as! String)
		_itemModel.imageView.frame = CGRect(x: 50, y: 50, width: self.view.bounds.width/2, height: self.view.bounds.height/2)
		_itemModel.imageView.contentMode = UIViewContentMode.scaleAspectFill
		self.view.addSubview(_itemModel.imageView)
		
		let chainCodeAccessModel = ChainCodeAccessModel()
		chainCodeAccessModel.url = self.chaincode_url
		chainCodeAccessModel.chainCode = self.chainCode
		chainCodeAccessModel.method = self.method_func["method"]
		chainCodeAccessModel.funcs = self.method_func["func"]
		chainCodeAccessModel.key = self.hashKey as! String
		chainCodeAccessModel.makeParams()
		
		//QUERY CHAIN CODE
		let alamoController = AlamoController()
		alamoController.getAlamofire(model:chainCodeAccessModel) { responseObject, error in
			let json = JSON(responseObject!)
			let param = json["result"]["message"]
			
			//			_itemModel.setOwner(_para: param as AnyObject)

			let _ser : String = "Serial : \(json["result"]["message"]["ser"])"
			self.view.addSubview(self.makeLabel(_x: 10,_y: self.view.bounds.height/2+10,_w: 100,_h: 20,_t: _ser))
			
		}
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
	func makeLabel(_x:CGFloat,_y:CGFloat,_w:CGFloat,_h:CGFloat,_t:String)->UILabel{
		let _return: UILabel = UILabel(frame: CGRect(x: _x, y: _y, width: _w, height: _h))
		_return.textColor = UIColor.black
		_return.text = _t
		_return.textAlignment = NSTextAlignment.right
		_return.adjustsFontSizeToFitWidth = true
		return _return
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
