//
//  ViewController.swift
//  MyCameraApp3
//
//  Created by 三木健生 on 2017/04/19.
//  Copyright © 2017年 mikitakeo. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet var imageView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cameraStart(sender : AnyObject) {
        
        let sourceType:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.camera
        // カメラが利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
            
        }
        else{
            showAlert(title: "", message: "Error of the camera function.")
        }
    }
    
    //　撮影が完了時した時に呼ばれる
      private func imagePickerController(imagePicker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imageView.image = pickedImage
        }
        
        //閉じる処理
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    // 写真を保存
    @IBAction func savePic(sender : AnyObject) {
        let image:UIImage! = imageView.image
        
        if image != nil {
            UIImageWriteToSavedPhotosAlbum(image, self, Selector(("image:didFinishSavingWithError:contextInfo:")), nil)
        }
        else{
            showAlert(title: "", message: "image Failed !")
        }
    }
    
    // 撮影がキャンセルされた時に呼ばれる
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    // 書き込み完了結果の受け取り
    func image(image: UIImage, didFinishSavingWithError error: NSError!, contextInfo: UnsafeMutableRawPointer) {
        if error != nil {
            showAlert(title: "", message: "Failed to save the picture.")
        } else {
            showAlert(title: "", message: "The picture was saved.")
        }
    }
    
    // アラートを表示する
    
    
    func showAlert(title: String, message: String) {
        
        let alertView = UIAlertView()
        
        alertView.title = title
        alertView.message = message
        alertView.addButton(withTitle: "OK")
        alertView.show()
 
    
    /*
    var alertController = UIAlertController(title: "UIAlertControllerStyle.Alert", message: "i0S8",preferredStyle: .Alert)
    
    let
    */
        
 }
    
    

}

