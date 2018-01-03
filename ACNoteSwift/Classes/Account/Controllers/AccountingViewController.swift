//
//  AccountingViewController.swift
//  ACNoteSwift
//
//  Created by 陈军 on 2017/3/10.
//  Copyright © 2017年 aaron. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class AccountingViewController: UIViewController {
    
    @IBOutlet weak var monthOfYearLabel: UILabel!
    
    @IBOutlet weak var incomeForTheMonth: UILabel!
    
    @IBOutlet weak var costForTheMonth: UILabel!
    
    @IBOutlet weak var dataTableView: UITableView!
    
    @IBOutlet weak var addRecordButton: UIButton!
    
   
    
    
    
    var viewModel : AccountViewModel?
    var disposeBag : DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = AccountViewModel()
        
        setControls()
        
        loadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

//MARK:- 扩展方法
extension AccountingViewController{
    
    //MARK:- 设置界面的UI
    fileprivate func loadData(){
        
        viewModel?.income?.asObservable().bind(to: self.incomeForTheMonth.rx.text).disposed(by: disposeBag)
        viewModel?.pay?.asObservable().bind(to: self.costForTheMonth.rx.text).disposed(by: disposeBag)
        viewModel?.currentMonth?.asObservable().bind(to: self.monthOfYearLabel.rx.text).disposed(by: disposeBag)
        
        (self.addRecordButton.rx.tap).asDriver().drive(onNext: {
                [weak self]  _ in
                guard let this = self else{
                    return
                }
                this.navigationController?.pushViewController("RegisterRxStoryBoard", storyBoardName: "Account", animated: true)
        }).disposed(by: disposeBag)
        
        
         self.dataTableView.register(UINib(nibName: "AccountDetailOfCurrentMonth", bundle: nil), forCellReuseIdentifier: AccountDetailOfCurrentMonth.cellID)
        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, AccountData>>(configureCell: {(ds, tv, index, item) -> AccountDetailOfCurrentMonth in
                        var cell = tv.dequeueReusableCell(withIdentifier: "Cell") as? AccountDetailOfCurrentMonth
                        if cell == nil{
                            cell=AccountDetailOfCurrentMonth(style: .default, reuseIdentifier: "Cell")
                        }
            
//                        let cell=c as! AccountDetailOfCurrentMonth
                        cell?.dateDescLabel?.text=item.dateDesc
//                        cell.dateRangeLabel.text=item.dateRange
//                        cell.incomeLabel.text="\(item.incomeAmount)"
//                        cell.payLabel.text="\(item.payAmount)"
            
            return cell!
                    })
        
        dataSource.titleForHeaderInSection={ ds, index in
            return ds.sectionModels[index].model
        }
        
        
        viewModel?.getAccountStatistic()
            .bind(to: self.dataTableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        
    }
    
    //MARK:- 初始化控件
    fileprivate func setControls(){
        dataTableView.rowHeight=UITableViewAutomaticDimension
        dataTableView.estimatedRowHeight=20
        dataTableView.RemoveLastSeprateLine()
    }
}


