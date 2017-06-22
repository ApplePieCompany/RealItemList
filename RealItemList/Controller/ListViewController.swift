//
//  ListViewController.swift
//  RealItemList
//
//  Created by TatsuoYagi on 2017/06/22.
//  Copyright © 2017年 TatsuoYagi. All rights reserved.
//

import UIKit

class ListViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource  {

	var myCollectionView : UICollectionView!
	var scrollBeginingPoint: CGPoint!

	let constNavigationTitle = "My正規商品リスト"
	let constReuseIdentifier = "MyCell"

	init() {
		super.init(nibName: nil, bundle: nil)
		
		self.view.backgroundColor = UIColor.white
		self.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.mostViewed, tag: 1)
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

		//Navigation Bar
		self.navigationItem.title = constNavigationTitle
		
		// CollectionView
		self.view.addSubview(makeCollectionView())
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

	// CollectionViewを作成
	func makeCollectionView()->UICollectionView{
		let layout = UICollectionViewFlowLayout()
		layout.itemSize = CGSize(width:50, height:50)
		layout.sectionInset = UIEdgeInsetsMake(8, 16, 8, 16)
		layout.headerReferenceSize = CGSize(width:100,height:8)
		
		myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
		myCollectionView.backgroundColor = UIColor.white
		myCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: constReuseIdentifier)
		myCollectionView.delegate = self
		myCollectionView.dataSource = self
		return myCollectionView
	}
	
	/*
	Cellが選択された際に呼び出される
	*/
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		/*
		println("Num: \(indexPath.row)")
		println("Value:\(collectionView)")
		*/
	}
	
	/*
	Cellの総数を返す
	*/
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 50
	}
	
	/*
	Cellに値を設定する
	*/
	internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell : UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: constReuseIdentifier,for: indexPath as IndexPath)
		cell.backgroundColor = UIColor.lightGray
		return cell
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
