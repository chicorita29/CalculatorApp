//
//  ViewController.swift
//  CalculatorApp
//
//  Created by 이지연 on 2022/05/15.
//

import UIKit
enum Operation {
    case Add
    case Subtract
    case Divide
    case Multiply
    case unknown
}

class ViewController: UIViewController {

    @IBOutlet weak var numberOutputLabel: UILabel!
    
    var displayNumber = ""
    //이전 계산 값 저장
    var firstOperand = ""
    var secondOperand = ""
    
    var result = ""
    var currentOperation: Operation = .unknown
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

   
    @IBAction func tabNumberButton(_ sender: UIButton) {
       
        //guard let numberValue = sender.title(for: .normal) else { return }
        guard let numberValue = sender.titleLabel?.text else { return }
        
        if self.displayNumber.count < 9 {
            self.displayNumber += numberValue
            self.numberOutputLabel.text = self.displayNumber
        }
        //print(sender.title)
    }
    
    
    @IBAction func tabClearButton(_ sender: UIButton) {
        self.displayNumber = ""
        self.firstOperand = ""
        self.secondOperand = ""
        self.result = ""
        self.currentOperation = .unknown
        self.numberOutputLabel.text = "0"
        
    }
    @IBAction func tabDotButton(_ sender: UIButton) {
        //소수점 포함 9자리
        
        if self.displayNumber.count < 8, !self.displayNumber.contains("."){
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
            self.numberOutputLabel.text = displayNumber
        }
    }
    
    @IBAction func tabDebvideButton(_ sender: UIButton) {
        self.operation(.Divide)
    }
    
    @IBAction func tabSubtractButton(_ sender: UIButton) {
        self.operation(.Subtract)
    }
    @IBAction func tabMultiplyButton(_ sender: UIButton) {
        self.operation(.Multiply)
    }
    @IBAction func tabAddButton(_ sender: UIButton) {
        self.operation(.Add)
    }
    @IBAction func tabEqualButton(_ sender: UIButton) {
        self.operation(self.currentOperation)
    }
    func operation(_ operation: Operation){
        print(self.currentOperation)
        print(self.displayNumber)
        if self.currentOperation != .unknown {
            if !self.displayNumber.isEmpty {
                self.secondOperand = self.displayNumber
                self.displayNumber = ""
                guard let firstOperand = Double(self.firstOperand) else { return }
                guard let secondOperand = Double(self.secondOperand) else { return }
                
                switch self.currentOperation{
                case .Add:
                    self.result = "\(firstOperand + secondOperand)"
                     
                case .Subtract:
                    self.result = "\(firstOperand - secondOperand)"
                    
                case .Divide:
                    self.result = "\(firstOperand / secondOperand)"
                    
                case .Multiply:
                    self.result = "\(firstOperand * secondOperand)"
                    
                default:
                    break
                }
                if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.result = "\(Int(result))"
                }
                self.firstOperand = self.result
                self.numberOutputLabel.text = self.result
        
            }
            self.currentOperation = operation
        } else {
            self.firstOperand = self.displayNumber
            self.currentOperation = operation
            self.displayNumber = ""
        }
    }
}

