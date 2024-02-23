//
//  extention + ViewController.swift
//  HW2-Bio
//
//  Created by Pavel Dolgopolov on 23.02.2024.
//

import UIKit

extension UIViewController {

    func addGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [
             UIColor.systemCyan.cgColor, UIColor.systemPink.cgColor
            ]
            
            gradient.startPoint = CGPoint(x: 0.5, y: 1.0)
            gradient.endPoint = CGPoint(x: 0.5, y: 0.0)
            gradient.name = "GradientCyanPink" 
            
            // Удаляем предыдущий градиент
            // Градиент некорректно прорисовывается при смене ориентации, если не удалить градиент предыдущей ориентации.
            // Ищем имя GradientCyanPink и удаляем
            if let oldGradient = view.layer.sublayers?.first(where: {
                $0.name == "GradientCyanPink" }) {
                oldGradient.removeFromSuperlayer()
            }
        
            view.layer.insertSublayer(gradient, at: 0)
    }
    func setViewColor() { // свой цвет при светлой теме
        view.backgroundColor = self.traitCollection.userInterfaceStyle == .light ?
            UIColor(red: 0.957, green: 0.957, blue: 0.969, alpha: 1.0) :
            UIColor.systemBackground
    }
}
