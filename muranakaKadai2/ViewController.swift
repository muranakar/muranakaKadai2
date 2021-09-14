//
//  ViewController.swift
//  muranakaKadai2
//
//  Created by 村中令 on 2021/09/14.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet private weak var num1TextField: UITextField!
    @IBOutlet private weak var num2TextField: UITextField!
    @IBOutlet private weak var selectSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var calculationLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        num1TextField.delegate = self
        num2TextField.delegate = self
    }

    @IBAction private func calculation(_ sender: Any) {
        let num1 = Float(num1TextField.text ?? "") ?? 0
        let num2 = Float(num2TextField.text ?? "") ?? 0
        var calculation: Float?

        switch selectSegmentedControl.selectedSegmentIndex {
        case 0:
            calculation = num1 + num2

        case 1:
            calculation = num1 - num2

        case 2:
            calculation = num1 * num2

        case 3:
            if num2 == 0 {
                calculationLabel.text = "割る数には０以外を入力してください"
            } else {
                calculation = num1 / num2
            }

        default:
            break
        }

        let calculationRound = round((calculation ?? 0)*10)/10
        calculationLabel.text = String(calculationRound)
    }
}
