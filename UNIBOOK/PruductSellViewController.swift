//
//  PruductSellViewController.swift
//  UNIBOOK
//
//  Created by 仲山陽一朗 on 2016/03/15.
//  Copyright © 2016年 yoichiro nakayama. All rights reserved.
//

import UIKit
import AssetsLibrary

class PruductSellViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    @IBOutlet weak var sendmethod: UISegmentedControl!
    @IBOutlet weak var sendcost: UISegmentedControl!
    @IBOutlet weak var faculty: UISegmentedControl!
    @IBOutlet weak var productdetail: UITextView!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var proffesor: UITextField!
    @IBOutlet weak var textname: UITextField!
    @IBOutlet weak var imageFromCameraRoll: UIImageView!
    @IBOutlet weak var university: UITextField!
     //    シングルトン呼び出し
    let productCollection = ProductCollection.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        super.viewDidLoad()
        
        //画像のサイズ
        productdetail.layer.cornerRadius = 5
        productdetail.layer.borderWidth = 0.1
        imageFromCameraRoll.contentMode = .ScaleAspectFit
        let tapRecognizer = UITapGestureRecognizer(target: self, action: "tapGesture:")
         self.view.addGestureRecognizer(tapRecognizer)
        
        university.delegate = self
        textname.delegate = self
        proffesor.delegate = self
        price.delegate = self

        }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    タップしてキーボードを消す
    func tapGesture(sender: UITapGestureRecognizer) {
        university.resignFirstResponder()
        textname.resignFirstResponder()
        proffesor.resignFirstResponder()
        price.resignFirstResponder()
        productdetail.resignFirstResponder()
    }
    
    func pickImageFromLibrary() {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {    //追記
            
            //写真ライブラリ(カメラロール)表示用のViewControllerを宣言しているという理解
            let controller = UIImagePickerController()
            
            //おまじないという認識で今は良いと思う
            controller.delegate = self
            
            //新しく宣言したViewControllerでカメラとカメラロールのどちらを表示するかを指定
            //以下はカメラロールの例
            //.Cameraを指定した場合はカメラを呼び出し(シミュレーター不可)
            controller.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            
            //新たに追加したカメラロール表示ViewControllerをpresentViewControllerにする
            self.presentViewController(controller, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo: [String: AnyObject]) {
        
        //このif条件はおまじないという認識で今は良いと思う
        if didFinishPickingMediaWithInfo[UIImagePickerControllerOriginalImage] != nil {
            
            //didFinishPickingMediaWithInfo通して渡された情報(選択された画像情報が入っている？)をUIImageにCastする
            //そしてそれを宣言済みのimageViewへ放り込む
            imageFromCameraRoll.image = didFinishPickingMediaWithInfo[UIImagePickerControllerOriginalImage] as? UIImage
            
            
        }
        
        //写真選択後にカメラロール表示ViewControllerを引っ込める動作
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //ライブラリから写真を選択する
    @IBAction func pressCameraRoll(sender: AnyObject) {
         pickImageFromLibrary()
    }

    
   //出品するnavigationのボタンとアクション
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "出品する", style: UIBarButtonItemStyle.Plain, target: self, action: "save")

              }

    func save(){
        if university.text!.isEmpty ||  textname.text!.isEmpty || textname.text!.isEmpty || price.text!.isEmpty || proffesor.text!.isEmpty ||  productdetail.text!.isEmpty  {
            //アラートの処理
            let alertView = UIAlertController(title: "エラー", message: "空欄があります", preferredStyle: UIAlertControllerStyle.Alert)
            alertView.addAction(UIAlertAction(title: "はい", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertView, animated: true, completion: nil)
       

        } else {
        let product = Product()
        product.university = university.text!
        product.textname = textname.text!
        product.proffesor = proffesor.text!
        product.price = price.text!
        product.productdetail = productdetail.text
        product.imageFromCameraRoll = imageFromCameraRoll.image!
        product.method = String(send.college)
        product.cost = String(sendmoney.seller)
        product.belongs = String(unit.law)
        self.dismissViewControllerAnimated(true, completion: nil)
        self.productCollection.addTodoCollection(product)
     }
    }
    
    
    
      //returnをキーボードから閉じる
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        university.resignFirstResponder()
        textname.resignFirstResponder()
        proffesor.resignFirstResponder()
        price.resignFirstResponder()
        return true
    }
}