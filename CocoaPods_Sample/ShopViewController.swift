//
//  ShopViewController.swift
//  mealMemory_ver4
//
//  Created by 田山由理 on 2015/10/09.
//  Copyright © 2015年 yuri. All rights reserved.
//

import UIKit
import LTMorphingLabel

class ShopViewController: UIViewController, LTMorphingLabelDelegate {
    
    let _myLabel = LTMorphingLabel()
    private var Button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Controllerのタイトルを設定する.
        self.title = "Shop View"
        
        // Viewの背景色を定義する.
        self.view.backgroundColor = UIColor.blackColor()
        
        // delegateを指定
        self._myLabel.delegate = self
        // ラベルの位置
        _myLabel.frame = CGRectMake(20,100,320,200)
        // ラベルをセンターに
        _myLabel.textAlignment = NSTextAlignment.Center
        // ラベル内の文字数が多すぎて表示しきれない時に文字サイズを小さくするかどうか
        _myLabel.adjustsFontSizeToFitWidth = true
        // 文字サイズ
        _myLabel.font = UIFont(name: "TimesNewRomanPSMT", size: 30)
        // テキストに文字
        self._myLabel.text = "Project Start"
        // 最下層のviewを黒に
        self.view.backgroundColor = UIColor.blackColor()
        // テキストカラーを白に
        _myLabel.textColor = UIColor.whiteColor()
        // viewにラベルを
        self.view.addSubview(_myLabel)
        
        // Buttonを生成する.
        Button1 = UIButton()
        // サイズを設定する.
        Button1.frame = CGRectMake(0,0,200,40)
        // タイトルを設定する(通常時).
        Button1.setTitle("ボタン", forState: UIControlState.Normal)
        // ボタンの位置を指定する.
        Button1.layer.position = CGPoint(x: self.view.frame.width/2, y:400)
        // イベントを追加する.
        Button1.addTarget(self, action: "onClickMyButton", forControlEvents: .TouchUpInside)
        // ボタンをViewに追加する.
        self.view.addSubview(Button1)
    }
    
    // LTEMorphingLabelのソースを参考にコードを書いていく
    var i = 0
    var textArray = ["Hello", "This is", "my first time",
        "to use framework", "into my own Project", "almost",
        "3days", "spent for this framework", "name is ...",
        "LTMorphingLabel", "if you like this", "visit github!", "enjoy", "swifting!"]
    
    // 配列に入れた文字を一つず抜き出す
    var text:String {
        get {
            let count = textArray.count
            // countElements = 文字数を取得
            if i >= count {
                i = 0
            }
            return textArray[i++]
        }
    }
    
    func onClickMyButton(){
        // エフェクト
        _myLabel.morphingEffect = .Scale
        // textArrayから順番に抜き出した文字をエフェクトをかけて表示
        _myLabel.text = text
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
