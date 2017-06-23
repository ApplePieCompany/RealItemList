//
//  ItemViewController.swift
//  RealItemList
//
//  Created by TatsuoYagi on 2017/06/23.
//  Copyright © 2017年 TatsuoYagi. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {

	var name: AnyObject? {
		get {
			return UserDefaults.standard.object(forKey: "name") as AnyObject
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.

		self.view.backgroundColor = UIColor.white
		
		// CollectionView
		self.view.addSubview(getImageView(_name: name as! String))
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

	
	func getImageView(_name:String)->UIImageView{
		let imageView = UIImageView()
		let img = UIImage(named:_name)! as UIImage
		imageView.frame = CGRect(x: 50, y: 50, width: self.view.bounds.width/2, height: self.view.bounds.height/2)
		imageView.contentMode = UIViewContentMode.scaleAspectFill
		imageView.image = img
		return imageView
	}
}
