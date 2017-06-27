//
//  RegistViewController.swift
//  RealItemList
//
//  Created by TatsuoYagi on 2017/06/22.
//  Copyright © 2017年 TatsuoYagi. All rights reserved.
//

import UIKit
import AVFoundation
import SwiftyJSON

class RegistViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate {
	
	var session: AVCaptureSession? = nil
	let nextView : UIViewController = OwnerChangeViewController(nibName: nil, bundle: nil)

	var custom_hash: AnyObject? {
		get {return UserDefaults.standard.object(forKey: "custom_hash") as AnyObject}
		set {
			UserDefaults.standard.set(newValue!, forKey: "custom_hash")
			UserDefaults.standard.synchronize()
		}
	}
	
	init() {
		super.init(nibName: nil, bundle: nil)
		
		//		self.view.backgroundColor = UIColor.green
		self.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.favorites, tag: 2)
		
		nextView.modalTransitionStyle = .crossDissolve
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
	}
	
	override func viewDidAppear(_ animated: Bool) {
		let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
		session = AVCaptureSession.init()
		guard session != nil else {
			print("error")
			return
		}
		
		// Input
		let input = try? AVCaptureDeviceInput.init(device: device)
		session?.addInput(input)
		
		// Output
		let output = AVCaptureMetadataOutput.init()
		session?.addOutput(output)
		output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
		output.metadataObjectTypes = [AVMetadataObjectTypeQRCode ]
		
		// Preview
		if let preview = AVCaptureVideoPreviewLayer.init(session: session) {
			preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
			preview.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height);
			self.view.layer.insertSublayer(preview, at: 0)
		}
		
		// Start
		self.session?.startRunning()
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

	func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
		for metadata in metadataObjects as! [AVMetadataMachineReadableCodeObject] {
			if metadata.type == AVMetadataObjectTypeQRCode {
				if metadata.stringValue != nil {
					DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
						self.goForward(_custom_hash: metadata.stringValue as AnyObject)
					}
				}
			}
		}
	}

	//Change Owner画面遷移
	func goForward(_custom_hash:AnyObject){
		getBlockChain(_custom_hash: _custom_hash)

		present(nextView, animated: true, completion: nil)
		
		/*
		let _OwnerChangeViewController: UIViewController = OwnerChangeViewController()
		_OwnerChangeViewController.modalTransitionStyle = UIModalTransitionStyle.partialCurl
		self.present(_OwnerChangeViewController, animated: true, completion: nil)
		*/
	}
	
	func getBlockChain(_custom_hash:AnyObject){
		let chainCode : String = "8a15262b11be5966f5816ecd52f6a177f1dcf3392892ea950f691874af1a7d6657afc03e87edbfe76a8fd7a4082680b2bfc4e836a3127aa656ab72b7651788c5"
		let chaincode_url : String = "https://76c87932401b41fd959e90733cd0954d-vp0.us.blockchain.ibm.com:5004/chaincode"
		var method_func = ["method":"query","func":"read"]
		let args = "A101"
		/* ほんとは引数の_custom_hashがKey */
		
		let chainCodeAccessModel = ChainCodeAccessModel()
		chainCodeAccessModel.url = chaincode_url
		chainCodeAccessModel.chainCode = chainCode
		chainCodeAccessModel.method = method_func["method"]
		chainCodeAccessModel.funcs = method_func["func"]
		chainCodeAccessModel.key = args
		chainCodeAccessModel.makeParams()
		
		let alamoController = AlamoController()
		alamoController.getAlamofire(model:chainCodeAccessModel) { responseObject, error in
			self.custom_hash = JSON(responseObject!) as AnyObject
			//			print(json["result"])
		}
	}
	
}
