//
//  SettingColorViewController.swift
//  ColorizedApp
//
//  Created by Владимир Дмитриев on 03.02.24.
//

import UIKit

final class SettingColorViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    var backgroundColor: UIColor!
    
    weak var delegate: SettingColorViewControllerDelegate?
    
    private var red: CGFloat = 0
    private var green: CGFloat = 0
    private var blue: CGFloat = 0
    private var alpha: CGFloat = 0
   
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        colorView.layer.cornerRadius = 20
        
        getColor()
        setSlider()
        setColor()
        
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
        
        redTextField.text = "\(redSlider.value)"
        greenTextField.text = "\(greenSlider.value)"
        blueTextField.text = "\(blueSlider.value)"
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
    }
    
    @IBAction func slidersAction(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redSlider:
            redLabel.text = string(from: redSlider)
            redTextField.text = string(from: redSlider)
        case greenSlider:
            greenLabel.text = string(from: greenSlider)
            greenTextField.text = string(from: greenSlider)
        default:
            blueLabel.text = string(from: blueSlider)
            blueTextField.text = string(from: blueSlider)
        }
    }
    
    @IBAction func doneButtonAction(_ sender: UIButton) {
        delegate?.setBackgroundColor(colorView.backgroundColor ?? .black)
        dismiss(animated: true)
    }
    
    private func getColor() {
        backgroundColor?.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    }
    
    private func setSlider() {
        redSlider.value = red.float()
        greenSlider.value = green.float()
        blueSlider.value = blue.float()
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: redSlider.value.cgFloat(),
            green: greenSlider.value.cgFloat(),
            blue: blueSlider.value.cgFloat(),
            alpha: alpha
        )
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

extension Float {
    func cgFloat() -> CGFloat {
        CGFloat(self)
    }
}

extension CGFloat {
    func float() -> Float {
        Float(self)
    }
}

extension SettingColorViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case redTextField:
            if let text = textField.text {
                redSlider.setValue(Float(text) ?? 0, animated: true)
            }
        case greenTextField:
            if let text = textField.text {
                greenSlider.setValue(Float(text) ?? 0, animated: true)
            }
        default:
            if let text = textField.text {
                blueSlider.setValue(Float(text) ?? 0, animated: true)
            }
        }
        setColor()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
