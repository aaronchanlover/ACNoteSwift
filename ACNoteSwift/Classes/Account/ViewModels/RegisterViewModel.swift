//
//  RegisterViewModel.swift
//  ACNoteSwift
//
//  Created by 陈军 on 2017/9/1.
//  Copyright © 2017年 aaron. All rights reserved.
//

import RxSwift


class RegisterViewModel {
    //input:
    var username = Variable<String>("")   //初始值为""
    
    // output:
    var usernameUsable: Observable<Result>?
    
    
    var pwd = Variable<String>("")
    var repeatPwd = Variable<String>("")
    
    var pwdUsable : Observable<Result>?
    var repeatPwdUsable : Observable<Result>?
    
    init() {
        let service = ValidateService.instance
        
        usernameUsable = username.asObservable().flatMapLatest{ username in
            return service.validateUsername(username)
                .observeOn(MainScheduler.instance)
                .catchErrorJustReturn(.failed(message: "username检测出错"))
        }.shareReplay(1)
        
        pwdUsable = pwd.asObservable().map({ pwd in
            service.validatePassword(pwd)
        })
        
        repeatPwdUsable =  Observable.combineLatest(pwd.asObservable(), repeatPwd.asObservable()) {
            return service.validateRepeatedPassword($0, repeatedPasswordword : $1)
        }.shareReplay(1)
        
    }
}

