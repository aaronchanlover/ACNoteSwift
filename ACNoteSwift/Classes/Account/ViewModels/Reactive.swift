//
//  Reactive.swift
//  ACNoteSwift
//
//  Created by 陈军 on 2017/9/4.
//  Copyright © 2017年 aaron. All rights reserved.
//
import UIKit
import RxCocoa
import RxSwift

extension Reactive where Base: UILabel {
    var validationResult: UIBindingObserver<Base, Result> {
        return UIBindingObserver(UIElement: base) { label, result in
            label.textColor = result.textColor
            label.text = result.description
        }
    }
}

extension Reactive where Base: UITextField {
    var inputEnabled: UIBindingObserver<Base, Result> {
        return UIBindingObserver(UIElement: base) { textFiled, result in
            textFiled.isEnabled = result.isValid
        }
    }
}
