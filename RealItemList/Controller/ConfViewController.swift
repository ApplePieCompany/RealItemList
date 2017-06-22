//
//  ConfViewController.swift
//  RealItemList
//
//  Created by TatsuoYagi on 2017/06/22.
//  Copyright © 2017年 TatsuoYagi. All rights reserved.
//

import UIKit
import Eureka

class ConfViewController: FormViewController {

	let constNavigationTitle = "設定画面"

	var nickname = ""
	var birthday = Date()

	static var dateFormat: DateFormatter = {
		let f = DateFormatter()
		f.dateFormat = "yyyy/MM/dd"
		
		return f
	}()
	
	
	init() {
		super.init(nibName: nil, bundle: nil)
		
		self.view.backgroundColor = UIColor.orange
		self.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.contacts, tag: 3)
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	required override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.

		form
			+++ Section("My Profile")
			<<< TextRow(){
				$0.title = "Nickname"
				$0.placeholder = "optional"
				$0.onChange{ [unowned self] row in
					self.nickname = row.value ?? ""
				}
			}
			<<< DateRow(){
				$0.title = "Birthday"
				$0.dateFormatter = type(of: self).dateFormat
				$0.minimumDate = type(of: self).dateFormat.date(from: "1900/01/01") ?? Date()
				$0.onChange{ [unowned self] row in
					self.birthday = row.value ?? Date()
				}
		}

			+++ Section("My HASH")
			<<< SwitchRow("switchRowTag"){
				$0.title = "Show HASH"
			}
			<<< LabelRow(){
				
				$0.hidden = Condition.function(["switchRowTag"], { form in
					return !((form.rowBy(tag: "switchRowTag") as? SwitchRow)?.value ?? false)
				})
				$0.title = "Xtsy5hx/ShJWCvyVm1+NXC6Jm/vvK+3X224WBM8vk82flD8TcgoCdGlyQduW4V4HaOXXhWYDkqxjOfkjnIhrGA=="
		}
		
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
