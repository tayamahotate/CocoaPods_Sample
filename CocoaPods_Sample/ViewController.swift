//
//  ViewController.swift
//  mealMemory_ver4
//
//  Created by 田山由理 on 2015/10/08.
//  Copyright © 2015年 yuri. All rights reserved.
//


import UIKit



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    // Tableで使用する配列を設定する
    private let myItems: NSArray = ["TEST1", "TEST2", "TEST3","TEST1", "TEST2", "TEST3","TEST1", "TEST2", "TEST3","TEST1", "TEST2", "TEST3","TEST1", "TEST2", "TEST3"]
    private var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //背景を白に設定
        self.view.backgroundColor = UIColor.whiteColor()
        // Controllerのタイトルを設定する.
        self.title = "HOME"
        
        /*
        テーブルビューの設定///////////////////////////////////////////////////
        */
        // Status Barの高さを取得する.
        let barHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
        
        // Viewの高さと幅を取得する.
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height-80
        
        // TableViewの生成する(status barの高さ分ずらして表示).
        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        
        // Cell名の登録をおこなう.
        myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        
        // DataSourceの設定をする.
        myTableView.dataSource = self
        
        // Delegateを設定する.
        myTableView.delegate = self
        
        // Viewに追加する.
        self.view.addSubview(myTableView)
        
        /*
        ボタンの設定///////////////////////////////////////////////////////
        */
        //Newボタンを生成する.
        let myButton = UIButton(frame: CGRectMake(0,0,100,50))
        myButton.layer.masksToBounds = true
        myButton.setTitle("New", forState: .Normal)
        myButton.layer.cornerRadius = 20.0
        myButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        myButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:self.view.bounds.width/6*10)
        myButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        // ボタンをViewに追加する.
        self.view.addSubview(myButton);
        
        
        // プロンプトを設定する.
        //self.navigationItem.prompt = "Make your Album!"
        
    }
    
    
    
    /*
    Cellが選択された際に呼び出されるデリゲートメソッド.
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(myItems[indexPath.row])")
        // 遷移するViewを定義する.
        let shopViewController: UIViewController = ShopViewController()
        // Viewの移動する.
        //self.presentViewController(shopViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(shopViewController, animated: true)
        
    }
    
    /*
    Cellの総数を返すデータソースメソッド.
    (実装必須)
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myItems.count
    }
    
    /*
    Cellに値を設定するデータソースメソッド.
    (実装必須)
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // 再利用するCellを取得する.
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        
        // Cellに値を設定する.
        cell.textLabel!.text = "\(myItems[indexPath.row])"
        
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    Editableの状態にする.
    */
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        print("canEditRowAtIndexPath")
        
        return true
    }
    
    /*
    特定の行のボタン操作を有効にする.
    */
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        print("commitEdittingStyle:\(editingStyle)")
    }
    
    /*
    Buttonを拡張する.
    */
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        
        // Shareボタン.
        let myShareButton: UITableViewRowAction = UITableViewRowAction(style: .Normal, title: "Share") { (action, index) -> Void in
            
            tableView.editing = false
            print("share")
            
        }
        myShareButton.backgroundColor = UIColor.blueColor()
        
        // Archiveボタン.
        let myArchiveButton: UITableViewRowAction = UITableViewRowAction(style: .Normal, title: "Archive") { (action, index) -> Void in
            
            tableView.editing = false
            print("archive")
            
        }
        myArchiveButton.backgroundColor = UIColor.redColor()
        
        return [myShareButton, myArchiveButton]
    }
    
    /*
    ボタンイベント
    */
    //Newボタン押下時
    internal func onClickMyButton(sender: UIButton){
        print("onClickMyButton:")
        
        // 遷移するViewを定義する.
        let makeViewController: UIViewController = MakeViewController()
        // Viewの移動する.
        //self.presentViewController(makeViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(makeViewController, animated: true)
        
        
    }
    
}

