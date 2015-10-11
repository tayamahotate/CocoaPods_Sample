//
//  NameViewController.swift
//  mealMemory_ver4
//
//  Created by 田山由理 on 2015/10/09.
//  Copyright © 2015年 yuri. All rights reserved.
//


import UIKit

class NameViewController: UIViewController, UITextFieldDelegate {
    
    private var myTextField: UITextField!
    private var saveButton: UIButton!
    private var savedShopName: String!
    var nameArray:[String] = []
    //var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    //appDelegate.newShopName = myLabel.text
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Viewの背景色を定義する.
        self.view.backgroundColor = UIColor.whiteColor()
        
        /*
        テキストフィールド
        */
        // UITextFieldを作成する.
        myTextField = UITextField(frame: CGRectMake(0,0,200,30))
        
        // 表示する文字を代入する.
        if nameArray.isEmpty{
            myTextField.text = "write down here!"
        }else{
            myTextField.text = nameArray[0]
        }
        
        // Delegateを設定する.
        myTextField.delegate = self
        
        // 枠を表示する.
        myTextField.borderStyle = UITextBorderStyle.RoundedRect
        
        // UITextFieldの表示する位置を設定する.
        myTextField.layer.position = CGPoint(x:self.view.bounds.width/2,y:150);
        
        // Viewに追加する.
        self.view.addSubview(myTextField)
        
        /*
        saveボタン
        */
        // Buttonを生成する.
        saveButton = UIButton()
        
        // サイズを設定する.
        saveButton.frame = CGRectMake(0,0,100,30)
        
        // 背景色を設定する.
        saveButton.backgroundColor = UIColor.cyanColor()
        
        // 枠を丸くする.
        saveButton.layer.masksToBounds = true
        
        // タイトルを設定する(通常時).
        saveButton.setTitle("save", forState: UIControlState.Normal)
        saveButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        
        // ボタンの位置を指定する.
        saveButton.layer.position = CGPoint(x: self.view.frame.width/2, y:200)
        
        // タグを設定する.
        saveButton.tag = 1
        
        // イベントを追加する.
        saveButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        // ボタンをViewに追加する.
        self.view.addSubview(saveButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    UITextFieldが編集された直後に呼ばれるデリゲートメソッド.
    */
    func textFieldDidBeginEditing(textField: UITextField){
        print("textFieldDidBeginEditing:" + textField.text!)
        myTextField.text = ""
    }
    
    /*
    UITextFieldが編集終了する直前に呼ばれるデリゲートメソッド.
    */
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing:" + textField.text!)
        return true
    }
    
    /*
    改行ボタンが押された際に呼ばれるデリゲートメソッド.
    */
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    /*
    ボタンのアクション時に設定したメソッド.
    */
    func onClickMyButton(sender: UIButton){
        savedShopName = myTextField.text
        nameArray.append(savedShopName)
        print(nameArray[0])
        print(savedShopName)
        //appDelegate.newShopName = "savedShopName"
        // 遷移するViewを定義する.
        let makeViewController: UIViewController = MakeViewController()
        // Viewの移動する.
        self.presentViewController(makeViewController, animated: true, completion: nil)
        
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
