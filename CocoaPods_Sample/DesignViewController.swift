//
//  DesignViewController.swift
//  mealMemory_ver4
//
//  Created by 田山由理 on 2015/10/09.
//  Copyright © 2015年 yuri. All rights reserved.
//


import UIKit

class DesignViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIActionSheetDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    private var myTableView: UITableView!
    
    // テーブル用定数
    //let titleOfSections = ["Image Section"]
    let numberOfRows = [3]
    let textOfRowsInControl = ["テンプレート", "写真を撮る", "アルバム"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Controllerのタイトルを設定する.
        self.title = "Design View"
        // Viewの背景色を定義する.
        self.view.backgroundColor = UIColor.whiteColor()
        
        // テーブルビュー設定
        // Status Barの高さを取得する.
        let barHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
        // Viewの高さと幅を取得する.
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        // TableViewの生成する(status barの高さ分ずらして表示).
        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight-450))
        // Cell名の登録をおこなう.
        myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        // DataSourceの設定をする.
        myTableView.dataSource = self
        // Delegateを設定する.
        myTableView.delegate = self
        self.view.addSubview(myTableView)
    }
    
    
    override func viewDidAppear(animated: Bool) {
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // テーブルビューセルの高さ取得
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            let widthOfScreen = UIScreen.mainScreen().bounds.width
            return widthOfScreen / 8
        } else {
            return -1
        }
    }
    
    
    
    // アクセサリビューボタンタップ時に呼び出される
    func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        print("Line \(indexPath.row) tapped")
    }
    
    
    
    // テーブルビューセルの設定
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "testCell")
        switch indexPath.section {
        case 0 :
            cell.textLabel?.text = textOfRowsInControl[indexPath.row]
            switch indexPath.row {
            case 0 :
                cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
                
            case 1 :
                cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
                
            case 2 :
                cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
                
            default :
                break
            }
        default :
            break
        }
        return cell
    }
    
    func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "testCell")
        switch indexPath.section {
        case 0 :
            cell.textLabel?.text = textOfRowsInControl[indexPath.row]
            switch indexPath.row {
            case 0 :
                let makeViewController = MakeViewController()
                self.navigationController?.pushViewController(makeViewController, animated: true)
                
            case 1 :
                //UIImageControllerを使うための変数
                let pickerController = UIImagePickerController()
                //UIImageControllerのデリゲートメソッドを使用する設定
                pickerController.delegate = self
                //ソースタイプをカメラに設定
                pickerController.sourceType = UIImagePickerControllerSourceType.Camera
                //UIImagwePickerControllerを表示
                self.presentViewController(pickerController, animated: true, completion: nil)
            case 2 :
                //UIImageControllerを使うための変数
                let pickerController = UIImagePickerController()
                //UIImageControllerのデリゲートメソッドを使用する設定
                pickerController.delegate = self
                //ソースタイプをカメラに設定
                pickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
                //UIImagwePickerControllerを表示
                self.presentViewController(pickerController, animated: true, completion: nil)
                break
                
            default :
                break
            }
        default :
            break
        }
        
    }
    
    
    // セクション内の行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows[section]
    }
    
    internal func onClickMyButton(sender: UIButton){
        print("onClickMyButton:")
        let makeViewController = MakeViewController()
        self.navigationController?.pushViewController(makeViewController, animated: true)
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
