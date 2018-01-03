//
//  NSDate.swift
//  ACNoteSwift
//
//  Created by 陈军 on 2017/8/21.
//  Copyright © 2017年 aaron. All rights reserved.
//

import UIKit

extension Date {
    
    
    /// 根据formatstring获取日期字符串
    ///
    /// - Parameter formatString: 格式
    /// - Returns: 格式化后的字符串
    public func getFormatDateString(formatString : String) -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = formatString
        return timeFormatter.string(from: self) as String
    }
    
    
    /// 获取月开始日期
    ///
    /// - Returns: 月开始日期
    static func startOfMonth(_ date : Date) -> Date {
        let calendar = Calendar.current
        let components =  calendar.dateComponents([.year,.month], from: date)
        let startOfMonth = calendar.date(from: components)!
        return startOfMonth
    }
    
    /// 获取月结束日期
    ///
    /// - Returns: 月结束日期
    static func endOfMonth(date:Date,returnEndTime:Bool = false) -> Date {
        let calendar = NSCalendar.current
        let components = NSDateComponents()
        components.month = 1
        //返回最后一天还是最后一秒
        if returnEndTime {
            components.second = -1
        } else {
            components.day = -1
        }
        let endOfMonth =  calendar.date(byAdding: components as DateComponents, to: startOfMonth(date))!
        
        return endOfMonth
    }
}


