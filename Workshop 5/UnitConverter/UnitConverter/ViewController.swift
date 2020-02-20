//
//  ViewController.swift
//  UnitConverter
//
//  Created by Martin Mikusovic on 20/02/2020.
//  Copyright © 2020 Martin Mikusovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    @IBOutlet var picker: UIPickerView!
    
    private let lastRowKey = "lastRowKey"
    private let values = (-100...100).map { $0 }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let row = getLastRow()
        picker.selectRow(row, inComponent: 0, animated: true)
        pickerView(picker, didSelectRow: row, inComponent: 0)
    }
    
    private func getLastRow() -> Int {
        let defaults = UserDefaults.standard
        let row = defaults.object(forKey: lastRowKey) as? Int
        if let row = row {
            return row
        } else {
            return values.count / 2
        }
    }

    private func displayTemperature(row: Int) {
        let value = values[row]
        let fahrenheit = toFahrenheit(celsius: value)
        label.text = "\(fahrenheit) ºF"
    }
    
    private func toFahrenheit(celsius: Int) -> Int {
        return Int((1.8 * Double(celsius) + 32.0).rounded())
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(values[row]) ºC"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        displayTemperature(row: row)
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: lastRowKey)
    }
}
