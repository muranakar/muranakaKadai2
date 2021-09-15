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

        let resultText: String

        switch selectSegmentedControl.selectedSegmentIndex {
        case 0:
            resultText = format(value: num1 + num2)
        case 1:
            resultText = format(value: num1 - num2)
        case 2:
            resultText = format(value: num1 * num2)
        case 3:
            if num2 == 0 {
                resultText = "割る数には０以外を入力してください"
            } else {
                resultText = format(value: num1 / num2)
            }

        default:
            return
        }

        calculationLabel.text = resultText
    }

    private func format(value: Float) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1

        return formatter.string(from: NSNumber(value: value)) ?? ""
    }
}
