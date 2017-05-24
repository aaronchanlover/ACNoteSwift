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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addAccountButtonDidClick(_ sender: Any) {
    }
    

}
