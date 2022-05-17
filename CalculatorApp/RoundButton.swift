//
//  RoundButton.swift
//  CalculatorApp
//
//  Created by 이지연 on 2022/05/17.
//

import UIKit
@IBDesignable
class RoundButton: UIButton {

    @IBInspectable var isRound: Bool = false {
        didSet {
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }
}
