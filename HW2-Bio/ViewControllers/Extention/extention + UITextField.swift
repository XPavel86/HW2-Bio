//
//  extention + TextField.swift
//  HW2-6
//
//  Created by Pavel Dolgopolov on 21.02.2024.
//

import UIKit

extension UITextField {
    
    func setBorderColor() {
        layer.borderColor = 
        self.traitCollection.userInterfaceStyle == .light ? UIColor.systemGray4.cgColor : UIColor.link.cgColor
        
        layer.borderWidth = 1.0
        layer.cornerRadius = 5.0
    }
    
    func setSettings() {
        
        autocorrectionType = .no //автокоррекция отключена
        smartQuotesType = .no //замена типа кавычек
        smartDashesType = .no //замена тире
        smartInsertDeleteType = .no //авто уд./доб. пробелов
        keyboardType = .asciiCapable // отключаем смайлики
        //тип контента - ввод одноразового кода
        textContentType = .oneTimeCode
        //скрытые символы при вводе
        //isSecureTextEntry = secureText
        
        //бар, который отображается над клавиатурой, nil - скрываем.
        //Может не скрываться, если isSecureTextEntry = false и
        //textContentType не равно .oneTimeCode, и при не заданном keyboardType = .asciiCapable
        inputAccessoryView = nil
        
        setBorderColor()
    }
    
    func alarm() {
        
        let feedbackGenerator = UINotificationFeedbackGenerator()
        feedbackGenerator.notificationOccurred(.error) // виброответ
        
        becomeFirstResponder() // фокус
        // меняем цвет рамки с анимацией
        UIView.animate(withDuration: 0.5) { [self] in
            layer.borderColor = UIColor.red.cgColor
            layer.borderWidth = 1.0
            layer.cornerRadius = 5.0
        }
        // возврат к исходному цвету
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            UIView.animate(withDuration: 0.5) {
                self.setBorderColor()
            }
        }
    }
}
