//
//  OwnerChangeViewController.swift
//  RealItemList
//
//  Created by TatsuoYagi on 2017/06/27.
//  Copyright © 2017年 TatsuoYagi. All rights reserved.
//

import UIKit

class OwnerChangeViewController: UIViewController {

	var custom_hash: AnyObject? {
		get {return UserDefaults.standard.object(forKey: "custom_hash") as AnyObject}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		
		self.view.backgroundColor = UIColor.green
		
		let _custom_hash = custom_hash as! String
		print("=== CUSTOM_HASH IS " + _custom_hash)
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
