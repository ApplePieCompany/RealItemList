//
//  AppDelegate.swift
//  RealItemList
//
//  Created by TatsuoYagi on 2017/06/22.
//  Copyright © 2017年 TatsuoYagi. All rights reserved.
//

import UIKit
import Eureka

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	internal var window: UIWindow?
	private var myTabBarController: UITabBarController!
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		
		self.window = UIWindow(frame: UIScreen.main.bounds)
		
		// タブバーで遷移する画面を用意
		//		let _: UIViewController = ListViewController()
		let tab2: UIViewController = RegistViewController()
		let tab3: FormViewController = ConfViewController()
		
		// ナビゲーション
		let listnavigationController = UINavigationController(rootViewController: ListViewController())
		
		// タブバーアイテムを用意
		listnavigationController.tabBarItem = UITabBarItem(title: "List", image: UIImage(named:"list.png"), tag: 1)
		tab2.tabBarItem = UITabBarItem(title: "Regist", image: UIImage(named:"regist.png"), tag: 2)
		tab3.tabBarItem = UITabBarItem(title: "Config", image: UIImage(named:"conf"), tag: 3)
		
		// タブバーにviewを渡す
		let tabBarController = UITabBarController()
		tabBarController.setViewControllers(
			[
				listnavigationController,
				tab2,
				tab3
			], animated: true)
		
		self.window?.rootViewController = tabBarController
		self.window?.makeKeyAndVisible()
		return true
	}
	
	func applicationWillResignActive(_ application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
	}
	
	func applicationDidEnterBackground(_ application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}
	
	func applicationWillEnterForeground(_ application: UIApplication) {
		// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
	}
	
	func applicationDidBecomeActive(_ application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}
	
	func applicationWillTerminate(_ application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}
	
	
}

