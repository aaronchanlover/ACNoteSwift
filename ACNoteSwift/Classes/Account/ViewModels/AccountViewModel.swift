//
//  AccountDBViewModel.swift
//  ACNoteSwift
//
//  Created by 陈军 on 2017/8/18.
//  Copyright © 2017年 aaron. All rights reserved.
//

import Foundation
import SQLite
import RxSwift
import RxCocoa
import RxDataSources




struct AccountData {
    let imageName : String
    let dateDesc : String
    let dateRange : String
    let payAmount : CGFloat
    let incomeAmount : CGFloat
    
    init(imageName: String,dateDesc : String,dateRange : String,payAmount : CGFloat,incomeAmount : CGFloat) {
        self.imageName = imageName
        self.dateDesc = dateDesc
        self.dateRange = dateRange
        self.payAmount = payAmount
        self.incomeAmount = incomeAmount
    }
    
}

class AccountViewModel: NSObject {
    
    var currentFee : Driver<CurrentMonthFeeModel>?
    var pay : Observable<String>?
    var income : Observable<String>?
    var currentMonth : Observable<String>?
    
    override init() {
        let date = Date()
        currentMonth=Observable.just(date.getFormatDateString(formatString: "yyyy-MM"))
    }
    
    public func refreshMonthFee() -> Observable<CurrentMonthFeeModel> {
        return getCureentMonthFee().share(replay: 1)
    }
    
    
    /// 获取当月的费用（支出，收入）
    ///
    /// - Returns: 费用Model
    func getCureentMonthFee() -> Observable<CurrentMonthFeeModel> {
        let fee=CurrentMonthFeeModel()
        
        let records = Table("records")
        let recorddatetime = Expression<Date>("recorddatetime")
        let propertyid = Expression<Int>("integer")
        let amount = Expression<Double>("amount")
        let date = Date()
        let startDateOfCurrentMonth = Date.startOfMonth(date)
        let endDateOfCurrentMonth = Date.endOfMonth(date: date,returnEndTime: true)
        
        
        guard let db = Database.databaseInstance?.db else{
            fee.income=0
            fee.pay=0
            return .just(fee)
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
        fee.income=income
        fee.pay=pay
        return .just(fee)
    }
    
    func getAccountStatistic() -> Observable<[SectionModel<String,AccountData>]> {
        
        
        
        let section = [SectionModel(model:"First", items: [AccountData(imageName: "aaa", dateDesc: "111", dateRange: "2017-11-03~2017-11-04", payAmount: 1, incomeAmount: 2),AccountData(imageName: "bbb", dateDesc: "2222", dateRange: "2017-11-03~2017-11-05", payAmount: 2, incomeAmount: 1)]),SectionModel(model:"Second", items: [AccountData(imageName: "aaa", dateDesc: "111", dateRange: "2017-11-03~2017-11-04", payAmount: 1, incomeAmount: 2),AccountData(imageName: "bbb", dateDesc: "2222", dateRange: "2017-11-03~2017-11-05", payAmount: 2, incomeAmount: 1)])]
        return .just(section)
    }
}
