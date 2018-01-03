//
//  AccountDetailOfCurrentMonth.swift
//  ACNoteSwift
//
//  Created by 陈军 on 2017/10/17.
//  Copyright © 2017年 aaron. All rights reserved.
//

import UIKit

class AccountDetailOfCurrentMonth: UITableViewCell {
    static var cellID : String = "Cell"
    
    @IBOutlet weak var cellImageView: UIImageView!
    
    @IBOutlet weak var dateDescLabel: UILabel!
    @IBOutlet weak var dateRangeLabel: UILabel!
    @IBOutlet weak var payLabel: UILabel!
    @IBOutlet weak var incomeLabel: UILabel!
    
}
