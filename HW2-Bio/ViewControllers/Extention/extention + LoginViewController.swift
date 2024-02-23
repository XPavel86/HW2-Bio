//
//  extention + LoginViewController.swift
//  HW2-6
//
//  Created by Pavel Dolgopolov on 19.02.2024.
//

import UIKit

// MARK: - IB Setup
extension LoginViewController {
    
    //MARK: - Public Methods

    func actionKeyboard() {
        // Подписываемся на уведомления о появлении и исчезновении клавиатуры
        NotificationCenter.default.addObserver(
            self, selector: #selector(keyboardShow(_:)),
            name: UIResponder.keyboardWillShowNotification, object: nil
        )
        
        NotificationCenter.default.addObserver(
            self, selector: #selector(keyboardHide(_:)),
            name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // если появилась клавиатура и ландшафтная ориентация,
    // то сдвигаемся вверх на 80 поинтов
     @objc func keyboardShow(_ notification: Notification) {
         
        mainStackCenterY.constant = UIDevice.current.orientation.isLandscape ?
         -80 : 0
        view.layoutIfNeeded() // принудительно обновляем макет
    }
    
    // сбрасываем изменения констрейнта, если клавиатура скрылась
    @objc func keyboardHide(_ notification: Notification) {
        
        if mainStackCenterY.constant != 0 {
            mainStackCenterY.constant = 0
            view.layoutIfNeeded()
        }
    }
}


