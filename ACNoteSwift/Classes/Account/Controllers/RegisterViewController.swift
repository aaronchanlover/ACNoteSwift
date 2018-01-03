//
//  RegisterViewController.swift
//  ACNoteSwift
//
//  Created by 陈军 on 2017/9/1.
//  Copyright © 2017年 aaron. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameTextFiled: UITextField!
    @IBOutlet weak var userNameTip: UILabel!
    @IBOutlet weak var pwdTextFiled: UITextField!
    @IBOutlet weak var pwdTip: UILabel!
    @IBOutlet weak var pwdAffirmTextFiled: UITextField!
    @IBOutlet weak var repeatPwdTip: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        let viewModel = RegisterViewModel()
        
        usernameTextFiled.rx.text.orEmpty.bind(to: viewModel.username)
            .disposed(by: disposeBag)
        viewModel.usernameUsable?.bind(to: userNameTip.rx.validationResult).disposed(by: disposeBag)
        viewModel.usernameUsable!.bind(to: pwdTextFiled.rx.inputEnabled).disposed(by: disposeBag)
        
        pwdTextFiled.rx.text.orEmpty.bind(to: viewModel.pwd).disposed(by: disposeBag)
        pwdTextFiled.rx.text.orEmpty.bind(to: viewModel.repeatPwd).disposed(by: disposeBag)
        
        viewModel.pwdUsable?.bind(to: pwdTip.rx.validationResult).disposed(by: disposeBag)
        viewModel.pwdUsable?.bind(to: pwdAffirmTextFiled.rx.inputEnabled).disposed(by: disposeBag)
        viewModel.repeatPwdUsable?
            .bind(to:repeatPwdTip.rx.validationResult)
            .disposed(by: disposeBag)
//        viewModel.usernameUsable
//            .bindTo(passwordTextField.rx.inputEnabled)
//            .disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
