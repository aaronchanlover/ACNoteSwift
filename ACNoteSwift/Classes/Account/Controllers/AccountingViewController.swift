//
//  AccountingViewController.swift
//  ACNoteSwift
//
//  Created by 陈军 on 2017/3/10.
//  Copyright © 2017年 aaron. All rights reserved.
//

import UIKit

class AccountingViewController: UIViewController {

    @IBOutlet weak var monthOfYearLabel: UILabel!
    
    @IBOutlet weak var incomeForTheMonth: UILabel!
    
    @IBOutlet weak var costForTheMonth: UILabel!
    
    @IBOutlet weak var dataTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
        setControls()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addAccountButtonDidClick(_ sender: Any) {
//        navigationController.push
    }
    

}

//MARK:- 扩展方法
extension AccountingViewController{
    
    //MARK:- 设置界面的UI
    fileprivate func setUI(){
        
        let date = Date()
        let dateFmt = DateFormatter()
        dateFmt.dateFormat="MM/yy"
        let monthOfYear = dateFmt.string(from:  date)
        
        monthOfYearLabel.text = monthOfYear
        
    }
    
    //MARK:- 初始化控件
    fileprivate func setControls(){
        
        dataTableView.delegate=self
        dataTableView.dataSource=self
    
    }
}

//MARK:- UITableView的代理
extension AccountingViewController:UITableViewDelegate,UITableViewDataSource{
    @available(iOS 2.0, *)
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}
