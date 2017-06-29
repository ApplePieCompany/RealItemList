//
//  ListViewController.swift
//  RealItemList
//
//  Created by TatsuoYagi on 2017/06/22.
//  Copyright © 2017年 TatsuoYagi. All rights reserved.
//

import UIKit

class ListViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource{
	
	var scrollBeginingPoint: CGPoint!
	let listViewModel:ListViewModel = ListViewModel()
	
	init() {
		super.init(nibName: nil, bundle: nil)
		
		self.view.backgroundColor = UIColor.white
		self.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.mostViewed, tag: 1)
		self.navigationItem.title = listViewModel.constNavigationTitle
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

		// ListViewModelの編集
		listViewModel.itemModels = listViewModel.getItemModels()
		listViewModel.myCollectionView = listViewModel.getMyCollecionView(frame: self.view.frame)
		listViewModel.myCollectionView.delegate = self
		listViewModel.myCollectionView.dataSource = self
		self.view.addSubview(listViewModel.myCollectionView)
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


	/* 以下、Delegate */
	
	/*
	Cellの総数を返す
	*/
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return listViewModel.itemModels.count
	}
	
	/*
	Cellに値を設定する
	*/
	internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: listViewModel.constReuseIdentifier, for: indexPath)
		cell.backgroundColor = UIColor.lightGray
		cell.contentView.addSubview(listViewModel.itemModels[indexPath.row].imageView)
		return cell
	}
	
	/*
	Cellが選択された際に呼び出される
	*/
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		/* ItemViewControllerへ渡す変数の設定と画面遷移 */
		listViewModel.name = listViewModel.itemModels[indexPath.row].name as AnyObject
		listViewModel.hashKey = listViewModel.itemModels[indexPath.row].hashkey as AnyObject
		
		let item = ItemViewController()
		item.modalTransitionStyle = .crossDissolve
		self.navigationController?.pushViewController(item as UIViewController, animated: true)
	}

	//Scroll Begin
	func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
		scrollBeginingPoint = scrollView.contentOffset;
	}
	
	//Scroll Did
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		_ = scrollView.contentOffset;
		/*
		if(scrollBeginingPoint.y < currentPoint.y){
		//			println("下へスクロール")
		}
		else{
		//			println("上へスクロール")
		}
		*/
	}
}
