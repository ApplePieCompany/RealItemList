//
//  RegistViewController.swift
//  RealItemList
//
//  Created by TatsuoYagi on 2017/06/22.
//  Copyright © 2017年 TatsuoYagi. All rights reserved.
//

import UIKit
import AVFoundation

class RegistViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate {
	
	var session: AVCaptureSession? = nil

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

	func goForward(){
		let modal = OwnerChangeViewController(nibName: nil, bundle: nil)
		modal.modalTransitionStyle = .crossDissolve
		present(modal, animated: true, completion: nil)

		/*
		let _OwnerChangeViewController: UIViewController = OwnerChangeViewController()
		_OwnerChangeViewController.modalTransitionStyle = UIModalTransitionStyle.partialCurl
		self.present(_OwnerChangeViewController, animated: true, completion: nil)
		*/
	}

	func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
		
		for data in metadataObjects {
			if let code = data as? AVMetadataMachineReadableCodeObject {
				custom_hash = code.stringValue as AnyObject
				DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
					self.goForward()
				}
			}
		}
	}
	
}
