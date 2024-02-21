//
//  StartViewController.swift
//  ColorizedApp
//
//  Created by Vladimir Dmitriev on 20.02.24.
//

import UIKit

protocol SettingColorViewControllerDelegate: AnyObject {
    func setBackgroundColor(_ color: UIColor)
}

final class StartViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingColorVC = segue.destination as? SettingColorViewController
        settingColorVC?.backgroundColor = view.backgroundColor
        settingColorVC?.delegate = self
    }
}

//MARK: - SettingColorViewControllerDelegate
extension StartViewController: SettingColorViewControllerDelegate {
    func setBackgroundColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
