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

	var constMyHash : String!
	var serial = ""

	var custom_hash: AnyObject? {
		get {return UserDefaults.standard.object(forKey: "custom_hash") as AnyObject}
	}

	static var dateFormat = Utility.dateFormat
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		
		self.view.backgroundColor = UIColor.green
		
		self.constMyHash = Utility.MyHash
		
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

		//Chain Code
		let chainCodeAccessModel = ChainCodeAccessModel()
		let val = setArgs(_ser: self.serial,_myHash: self.constMyHash)
		chainCodeAccessModel.getChainCodeAccessModel(_url: "chaincode",_method: "invoke",_func: "write",_key: self.custom_hash as! String,_val:val )
		
		//QUERY CHAIN CODE
		let alamoController = AlamoController()
		alamoController.getAlamofire(model:chainCodeAccessModel) { responseObject, error in
			let json = JSON(responseObject!)
			
			print("Key is \(self.custom_hash as! String) , Res is \(json)")
			
			self.navigationController?.popToRootViewController(animated: true)
			//			self.navigationController?.dismiss(animated: true, completion:nil)
		}
		
	}

	func setArgs(_ser:String,_myHash:String)->String{
		return "'ser':'\(_ser)','owner':'\(_myHash)','upd':'\(type(of: self).dateFormat.string(from: Date()))'"
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
