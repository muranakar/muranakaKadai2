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

    @IBAction func calculation(_ sender: Any) {
        let num1 = Float(num1TextField.text ?? "") ?? 0
        let num2 = Float(num2TextField.text ?? "") ?? 0

        switch selectSegmentedControl.selectedSegmentIndex {

        case 0:
            let addition = num1 + num2
            let additionRound = round(addition*10)/10
            calculationLabel.text = String(additionRound)

        case 1:
            let subtraction = num1 - num2
            let subtractionRound = round(subtraction*10)/10
            calculationLabel.text = String(subtractionRound)

        case 2:
            let multiplication = num1 * num2
            let multiplicationRound = round(multiplication*10)/10
            calculationLabel.text = String(multiplicationRound)

        case 3:
            if num2 == 0 {
                calculationLabel.text = "割る数には０以外を入力してください"
            } else {
                let division = num1 / num2
                let divisionRound = round(division*10)/10
                calculationLabel.text = String(divisionRound)
            }

        default:
            break

        }
    }
}
