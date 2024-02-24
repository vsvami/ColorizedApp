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
        settingColorVC?.delegate = self
        settingColorVC?.viewColor = view.backgroundColor
    }
}

//MARK: - SettingColorViewControllerDelegate
extension StartViewController: SettingColorViewControllerDelegate {
    func setBackgroundColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
