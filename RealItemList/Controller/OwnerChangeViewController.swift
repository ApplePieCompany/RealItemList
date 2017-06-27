//
//  OwnerChangeViewController.swift
//  RealItemList
//
//  Created by TatsuoYagi on 2017/06/27.
//  Copyright © 2017年 TatsuoYagi. All rights reserved.
//

import UIKit
import Eureka

class OwnerChangeViewController: FormViewController {

	var constMyHash = "Xtsy5hx/ShJWCvyVm1+NXC6Jm/vvK+3X224WBM8vk82flD8TcgoCdGlyQduW4V4HaOXXhWYDkqxjOfkjnIhrGA=="
	var customHash = ""
	var serial = ""

	var custom_hash: AnyObject? {
		get {return UserDefaults.standard.object(forKey: "custom_hash") as AnyObject}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		
		self.view.backgroundColor = UIColor.green
		
		self.customHash = custom_hash as! String

		
		form
			+++ Section("正規商品登録")
			<<< TextRow(){
				$0.title = "MyHash"
				$0.value = self.constMyHash
			}

			<<< TextRow(){
				$0.title = "ItemHash"
				$0.value = self.customHash
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
		print("==== CHANGE OWNER ====")
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
