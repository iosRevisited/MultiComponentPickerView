//
//  ViewController.swift
//  MultiComponentPickerView
//
//  Created by SaiSandeep on 19/01/18.
//  Copyright © 2018 iOSRevisited. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let textField = UITextField()
    
    var pickerView: UIPickerView!
    
    let feetList = Array(3...9)
    
    let inchList = Array(0...11)
    
    let numberOfComponents = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        textField.borderStyle = .roundedRect
        textField.placeholder = "What is your height?"
        textField.becomeFirstResponder()
        
        self.pickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 150))
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        textField.inputView = self.pickerView
        self.pickerView.backgroundColor = UIColor.white
        textField.inputView = self.pickerView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - UIPickerView Methods
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return numberOfComponents
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return feetList.count
        }else if component == 2 {
            return inchList.count
        }else {
            return 1
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return "\(feetList[row])"
        }else if component == 1 {
            return "ft"
        }else if component == 2 {
            return "\(inchList[row])"
        }else {
            return "in"
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let feetIndex = pickerView.selectedRow(inComponent: 0)
        let inchIndex = pickerView.selectedRow(inComponent: 2)
        textField.text = "\(feetList[feetIndex])'\(inchList[inchIndex])''"
    }
}



