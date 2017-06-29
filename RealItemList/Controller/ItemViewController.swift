//
//  ItemViewController.swift
//  RealItemList
//
//  Created by TatsuoYagi on 2017/06/23.
//  Copyright © 2017年 TatsuoYagi. All rights reserved.
//

import UIKit
import SwiftyJSON
import CoreImage

class ItemViewController: UIViewController {

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
		
		//Chain Code
		let chainCodeAccessModel = ChainCodeAccessModel()
		chainCodeAccessModel.getChainCodeAccessModel(_url: "chaincode",_method: "query",_func: "read",_key: self.hashKey as! String,_val: nil)
		
		//QUERY CHAIN CODE
		let alamoController = AlamoController()
		alamoController.getAlamofire(model:chainCodeAccessModel) { responseObject, error in
			let json = JSON(responseObject!)

			_itemModel.setOwner(_para: json)

			let _x : CGFloat = 10
			var _y : CGFloat = self.view.bounds.height/2 + 50
			let _w : CGFloat = self.view.bounds.width
			let _h : CGFloat = 25
			
			let _ser : String = "商品シリアル番号: \(_itemModel.serial ?? "")"
			self.view.addSubview(self.makeLabel(_x: _x,_y: _y,_w: _w,_h: _h,_t: _ser))

			_y += 25
			let _upd : String = "オーナー登録日　: \(_itemModel.upd ?? "")"
			self.view.addSubview(self.makeLabel(_x: _x,_y: _y,_w: _w,_h: _h,_t: _upd))

			_y += 25
			self.view.addSubview(self.makeImageView(_x: _x, _y: _y, _w: 100, _h: 100, _hashkey: self.hashKey as! String))
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
		_return.adjustsFontSizeToFitWidth = true
		
		return _return
	}
	
	func makeImageView(_x:CGFloat,_y:CGFloat,_w:CGFloat,_h:CGFloat,_hashkey:String)->UIImageView{
		let _return : UIImageView = UIImageView()

		let data = _hashkey.data(using: String.Encoding.utf8)!
		let qr = CIFilter(name: "CIQRCodeGenerator", withInputParameters: ["inputMessage": data, "inputCorrectionLevel": "M"])!
		let sizeTransform = CGAffineTransform(scaleX: 10, y: 10)
		let qrImage = qr.outputImage!.applying(sizeTransform)
		
		_return.frame = CGRect(x: _x, y: _y, width: _w, height: _h)
		_return.image = UIImage(ciImage: qrImage)
		
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
