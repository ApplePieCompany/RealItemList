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

		let msg = "Xtsy5hx/ShJWCvyVm1+NXC6Jm/vvK+3X224WBM8vk82flD8TcgoCdGlyQduW4V4HaOXXhWYDkqxjOfkjnIhrGA=="
		
		form
			+++ Section("My Profile")
			<<< TextRow(){
				$0.title = "Nickname"
				$0.placeholder = "optional"
				$0.onChange{ [unowned self] row in
					self.nickname = row.value ?? ""
				}
			}
			<<< SegmentedRow<String>("sex"){
				$0.options = ["男性", "女性"]
				$0.title = "性別"
				$0.value = "女性"
				}.onChange{ row in
					let userDefault = UserDefaults.standard
					userDefault.setValue(row.value, forKey: "Sex")
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
			<<< TextRow(){
				$0.hidden = Condition.function(["switchRowTag"], { form in
					return !((form.rowBy(tag: "switchRowTag") as? SwitchRow)?.value ?? false)
				})
				$0.title = msg
				$0.disabled=true
				$0.onCellSelection({ cell, row in
					self.copy2ClipBoard(msg: msg)
					self.showAlert(msg: msg)
				})
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

	func copy2ClipBoard(msg:String){
		UIPasteboard.general.string = msg
	}
	
	func showAlert(msg:String) {
		let alertController = UIAlertController(title: "クリップボードにコピーしました", message: msg, preferredStyle: .alert)
		let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
		alertController.addAction(defaultAction)
		present(alertController, animated: true)
		
	}
}
