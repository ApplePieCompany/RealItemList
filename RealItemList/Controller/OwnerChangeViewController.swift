//
//  OwnerChangeViewController.swift
//  RealItemList
//
//  Created by TatsuoYagi on 2017/06/27.
//  Copyright © 2017年 TatsuoYagi. All rights reserved.
//

import UIKit
import Eureka
import SwiftyJSON

class OwnerChangeViewController: FormViewController {

	var constMyHash = "Xtsy5hx/ShJWCvyVm1+NXC6Jm/vvK+3X224WBM8vk82flD8TcgoCdGlyQduW4V4HaOXXhWYDkqxjOfkjnIhrGA=="
	var serial = ""

	var custom_hash: AnyObject? {
		get {return UserDefaults.standard.object(forKey: "custom_hash") as AnyObject}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		
		self.view.backgroundColor = UIColor.green
		
		form
			+++ Section("正規商品登録")
			<<< TextRow(){
				$0.title = "MyHash"
				$0.value = self.constMyHash
				$0.disabled = true
			}

			<<< TextRow(){
				$0.title = "ItemHash"
				$0.value = self.custom_hash as? String
				$0.disabled = true
			}

			<<< TextRow(){
				$0.title = "Serial"
				$0.placeholder = "optional"
				$0.onChange{ [unowned self] row in
					self.serial = row.value ?? ""
				}
			}

			<<< ButtonRow(){
				$0.title = "Change Owner"
				$0.onCellSelection{ [unowned self] cell, row in
					self.changeOwner()
				}
		}
	}
	
	func changeOwner(){
		setBlockChain()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func setBlockChain(){
		let chainCode : String = "8a15262b11be5966f5816ecd52f6a177f1dcf3392892ea950f691874af1a7d6657afc03e87edbfe76a8fd7a4082680b2bfc4e836a3127aa656ab72b7651788c5"
		let chaincode_url : String = "https://76c87932401b41fd959e90733cd0954d-vp0.us.blockchain.ibm.com:5004/chaincode"
		var method_func = ["method":"invoke","func":"write"]
		
		let chainCodeAccessModel = ChainCodeAccessModel()
		chainCodeAccessModel.url = chaincode_url
		chainCodeAccessModel.chainCode = chainCode
		chainCodeAccessModel.method = method_func["method"]
		chainCodeAccessModel.funcs = method_func["func"]
		chainCodeAccessModel.key = self.custom_hash as! String
		chainCodeAccessModel.val = setArgs(_ser: self.serial,_myHash: self.constMyHash)
		chainCodeAccessModel.makeParams()
		
		let alamoController = AlamoController()
		alamoController.getAlamofire(model:chainCodeAccessModel) { responseObject, error in
			let json = JSON(responseObject!)
			
			print("Key is \(self.custom_hash as! String) , Res is \(json)")
			
			self.navigationController?.popToRootViewController(animated: true)
			//			self.navigationController?.dismiss(animated: true, completion:nil)
		}
		
	}

	func setArgs(_ser:String,_myHash:String)->String{
		var _return : String = ""
		
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy/MM/dd"
		let now = Date()
		
		_return = "'ser':'\(_ser)','owner':'\(_myHash)','upd':'\(formatter.string(from: now))'"
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
