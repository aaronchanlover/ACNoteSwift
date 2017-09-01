//
//  AccountDBViewModel.swift
//  ACNoteSwift
//
//  Created by 陈军 on 2017/8/18.
//  Copyright © 2017年 aaron. All rights reserved.
//

import UIKit
import SQLite

class AccountDBViewModel: NSObject {
    public class func cuurentMonth() {
        let records = Table("records")
        let recorddatetime = Expression<Date>("recorddatetime")
        let propertyid = Expression<Int>("integer")
        let amount = Expression<Double>("amount")
        let date = Date()
        let startDateOfCurrentMonth = Date.startOfMonth(date)
        let endDateOfCurrentMonth = Date.endOfMonth(date: date,returnEndTime: true)
        
        
        guard let db = Database.databaseInstance?.db else{
            return
        }
        
        var income : Double = 0
        var pay : Double = 0
        
        for record in  (try! db.prepare(records.select(propertyid,amount).filter(recorddatetime>startDateOfCurrentMonth&&recorddatetime<=endDateOfCurrentMonth))){
            let fee = record[amount]
            
            if(record[propertyid]==0){
                income=income+fee
            }
            else{
                pay=pay+fee
            }
        }
        
    }
}
