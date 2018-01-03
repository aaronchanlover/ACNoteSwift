//
//  UITableView.swift
//  ACNoteSwift
//
//  Created by 陈军 on 2017/11/4.
//  Copyright © 2017年 aaron. All rights reserved.
//

import UIKit

extension UITableView {
    
    
    /// 去掉底部多余的分割线
    ///
    /// - Returns: UITableView
    func RemoveLastSeprateLine() -> Self {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        self.tableFooterView = view
        return self
    }
}
