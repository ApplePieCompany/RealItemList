//
//  MainTabBarController.swift
//  RealItemList
//
//  Created by TatsuoYagi on 2017/06/28.
//  Copyright © 2017年 TatsuoYagi. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.

		let listController = ListViewController()
		let registViewController = RegistViewController()
		let confViewController = ConfViewController()
		
		listController.tabBarItem = UITabBarItem(title: "List", image: UIImage(named:"list.png"), tag: 1)
		registViewController.tabBarItem = UITabBarItem(title: "Regist", image: UIImage(named:"regist.png"), tag: 2)
		confViewController.tabBarItem = UITabBarItem(title: "Config", image: UIImage(named:"regist.png"), tag: 3)
		
		let navigationController1 = UINavigationController(rootViewController: listController)
		let navigationController2 = UINavigationController(rootViewController: registViewController)
		let navigationController3 = UINavigationController(rootViewController: confViewController)
		
		self.viewControllers = [navigationController1, navigationController2, navigationController3]
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
