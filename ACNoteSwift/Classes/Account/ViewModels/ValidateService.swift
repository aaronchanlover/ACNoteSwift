//
//  ValidateService.swift
//  ACNoteSwift
//
//  Created by 陈军 on 2017/9/1.
//  Copyright © 2017年 aaron. All rights reserved.
//

import UIKit
import RxSwift

class ValidateService {
    static let instance = ValidateService()
    private init(){}
    
    let minCharactersCount = 6
    
    func validateUsername(_ username : String) -> Observable<Result> {
        if username.characters.count == 0{
            return .just(.empty)
        }
        
        if username.characters.count < minCharactersCount{
            return .just(Result.failed(message:"账号至少6个字符"))
        }
        
        if usernameValid(username) {//检测本地数据库中是否已经存在这个名字
            return .just(.failed(message: "账户已存在"))
        }
        
        return .just(.ok(message: "用户名可用"))
    }
    
    // 从本地数据库中检测用户名是否已经存在
    func usernameValid(_ username: String) -> Bool {
//        let filePath = NSHomeDirectory() + "/Documents/users.plist"
//        let userDic = NSDictionary(contentsOfFile: filePath)
//        let usernameArray = userDic!.allKeys as NSArray
        let usernameArray = ["chenjun","administrator","zhangqy"]
        if usernameArray.contains(username) {
            return true
        } else {
            return false
        }
    }
    
    func validatePassword(_ pwd : String) -> Result {
        if(pwd.characters.count==0){
            return .empty
        }
        
        if pwd.characters.count < minCharactersCount {
            return .failed(message: "密码长度至少6个字符")
        }
        
        return .ok(message: "密码可用")
    }
    
    func validateRepeatedPassword(_ password: String, repeatedPasswordword: String) -> Result {
        if repeatedPasswordword.characters.count == 0 {
            return .empty
        }
        
        if repeatedPasswordword == password {
            return .ok(message: "密码可用")
        }
        
        return .failed(message: "两次密码不一样")
    }
    
    
}
