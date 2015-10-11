//
//  MakeViewController.swift
//  mealMemory_2
//
//  Created by 田山由理 on 2015/09/23.
//  Copyright (c) 2015年 yuri. All rights reserved.
//

import UIKit

class MakeViewController: UIViewController, UIWebViewDelegate {
    
    private var myImageView: UIImageView!
    private var lineImageView: UIImageView!
    private var lineImageView2: UIImageView!
    private var myButton: UIButton!
    private var changeDesignButton: UIButton!
    private var changePictureButton: UIButton!
    var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Controllerのタイトルを設定する.
        self.title = "Make View"
        
        // Viewの背景色を定義する.
        self.view.backgroundColor = UIColor.whiteColor()
        
        
        /*
        お店のアイコン画像を設定
        */
        // UIImageViewを作成する.
        myImageView = UIImageView(frame: CGRectMake(0,0,150,100))
        // 表示する画像を設定する.
        let myImage = UIImage(named: "cafe.jpeg")
        // 画像をUIImageViewに設定する.
        myImageView.image = myImage
        // 画像の表示する座標を指定する.
        myImageView.layer.position = CGPoint(x: self.view.bounds.width*0.05+75, y: 130.0)
        // UIImageViewをViewに追加する.
        self.view.addSubview(myImageView)
        
        
        /*
        灰色線を設定
        */
        // UIImageViewを作成する.
        lineImageView = UIImageView(frame: CGRectMake(0,0,340,1))
        lineImageView2 = UIImageView(frame: CGRectMake(0,0,340,1))
        // 表示する画像を設定する.
        let lineImage = UIImage(named: "gray.jpeg")
        // 画像をUIImageViewに設定する.
        lineImageView.image = lineImage
        lineImageView2.image = lineImage
        // 画像の表示する座標を指定する.
        lineImageView.layer.position = CGPoint(x: self.view.bounds.width-190, y: 200.0)
        lineImageView2.layer.position = CGPoint(x: self.view.bounds.width-190, y: 300.0)
        // UIImageViewをViewに追加する.
        self.view.addSubview(lineImageView)
        self.view.addSubview(lineImageView2)
        
        
        /*
        店名を設置
        */
        // Labelを作成.
        let myLabel: UILabel = UILabel(frame: CGRectMake(0,0,200,50))
        //let nameViewController = NameViewController()
        
        // Labelに文字を代入.
        //        if appDelegate.shopNameArray.isEmpty {
        //            var name = appDelegate.newShopName
        //            myLabel.text = name
        //        } else{
        //            println(appDelegate.shopNameArray[0])
        myLabel.text = "RestaurantName"
        //        }
        //フォントをイタリック
        myLabel.font = UIFont.italicSystemFontOfSize(UIFont.labelFontSize())
        // 文字の色を白にする.
        myLabel.textColor = UIColor.blackColor()
        // 文字の影の色をグレーにする.
        myLabel.shadowColor = UIColor.grayColor()
        // Textを中央寄せにする.
        myLabel.textAlignment = NSTextAlignment.Left
        // 配置する座標を設定する.
        myLabel.layer.position = CGPoint(x: self.view.bounds.width*0.6+75,y: 110)
        // ViewにLabelを追加.
        self.view.addSubview(myLabel)
        
        
        /*
        店名を変えるボタンを設置
        */
        // Buttonを生成する.
        myButton = UIButton()
        // サイズを設定する.
        myButton.frame = CGRectMake(0,0,160,35)
        // 背景色を設定する.
        myButton.backgroundColor = UIColor.purpleColor()
        // 枠を丸くする.
        myButton.layer.masksToBounds = true
        // タイトルを設定する(通常時).
        myButton.setTitle("changeName", forState: UIControlState.Normal)
        // コーナーの半径を設定する.
        myButton.layer.cornerRadius = 20.0
        // ボタンの位置を指定する.
        myButton.layer.position = CGPoint(x: self.view.frame.width*0.6+45, y:150)
        //ボタンテキストのスタイルとサイズを指定する.
        myButton.titleLabel!.font = UIFont(name: "Helvetica-Bold",size: CGFloat(14))
        // タグを設定する.
        myButton.tag = 1
        // イベントを追加する.
        myButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        // ボタンをViewに追加する.
        self.view.addSubview(myButton)
        
        
        /*
        ChangeDesignButton
        */
        // Buttonを生成する.
        changeDesignButton = UIButton()
        // サイズを設定する.
        let displayWidth: CGFloat = self.view.frame.width
        changeDesignButton.frame = CGRectMake(0,0,displayWidth,100)
        // タイトルを設定する(通常時).
        changeDesignButton.setTitle("Change BackgroundDesign              >", forState: UIControlState.Normal)
        changeDesignButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        // ボタンの位置を指定する.
        changeDesignButton.layer.position = CGPoint(x: self.view.frame.width/2, y:250)
        // タグを設定する.
        changeDesignButton.tag = 2
        // イベントを追加する.
        changeDesignButton.addTarget(self, action: "onClickChangeDesignButton:", forControlEvents: .TouchUpInside)
        // ボタンをViewに追加する.
        self.view.addSubview(changeDesignButton)
        
        /*
        画像の上に透明のボタンを設置
        */
        // Buttonを生成する.
        changePictureButton = UIButton()
        // サイズを設定する.
        changePictureButton.frame = CGRectMake(0,0,150,100)
        // ボタンの位置を指定する.
        changePictureButton.layer.position = CGPoint(x: self.view.bounds.width*0.05+75, y: 130.0)
        // タグを設定する.
        changePictureButton.tag = 3
        // イベントを追加する.
        changePictureButton.addTarget(self, action: "onClickChangeDesignButton:", forControlEvents: .TouchUpInside)
        // ボタンをViewに追加する.
        self.view.addSubview(changePictureButton)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    ボタンのアクション時に設定したメソッド.
    */
    internal func onClickMyButton(sender: UIButton){
        // 遷移するViewを定義する.
        let nameViewController: UIViewController = NameViewController()
        // Viewの移動する.
        //self.presentViewController(nameViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(nameViewController, animated: true)
        
    }
    
    internal func onClickChangeDesignButton(sender: UIButton){
        // 遷移するViewを定義する.
        let designViewController: UIViewController = DesignViewController()
        // Viewの移動する.
        //self.presentViewController(designViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(designViewController, animated: true)
        
        
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
