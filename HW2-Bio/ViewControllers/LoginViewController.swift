//
//  ViewController.swift
//  HW2-6
//
//  Created by Pavel Dolgopolov on 17.02.2024.
//

import UIKit

final class LoginViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - IBOutlet
    @IBOutlet var mainStackCenterY: NSLayoutConstraint!
    
    @IBOutlet var userNameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    @IBOutlet var loginButton: UIButton!
    
    @IBOutlet var remindNameButton: UIButton!
    @IBOutlet var remindPasswordButton: UIButton!
    
    //MARK: - Private Properties
    private let person = User.getPerson()
    
    // MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordField.delegate = self
        userNameField.delegate = self
        
        passwordField.setSettings()
        userNameField.setSettings()
        passwordField.isSecureTextEntry = true
        
        loginButton.layer.cornerRadius = 5
    }
    
    override func viewWillLayoutSubviews() {
        setViewColor()
        actionKeyboard()
    }
    
    // MARK: - Overrides Methods
    //событие перед переходом на WelcomeViewController, проверяем логин
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return checkСredentials()
    }
    
    // скрываем клавиатуру при тапе на экране
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // передаeм текст в welcomeView
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let tabBarController = segue.destination as? UITabBarController
        
        tabBarController?.viewControllers?.forEach {
            viewController in
            if let firstVC = viewController as? WelcomeViewController {
                firstVC.person = person
                print("firstVC")
            }
            else if let navigationVC = viewController as? UINavigationController {
                let secondVC = navigationVC.topViewController as? ShortInfoViewController
                secondVC?.person = person
                print("secondVC")
            }
            
        }
    }
    
    // MARK: - IBAction
    // показываем подсказки логина / пароля
    @IBAction func remindUserOrPassword(sender: UIButton) {
        sender == remindNameButton ?
        showAlert(
            withTitle: "Oops!",
            andMessage: "Your name is \(person.login) 😉"
        ) :
        showAlert(
            withTitle: "Oops!",
            andMessage: "Your password is \(person.password) 😉"
        )
    }
    
    // обрабатываем закрытие welcomeView
    @IBAction func unwind(for segue: UIStoryboardSegue ) {
        passwordField.text = ""
        userNameField.text = ""
    }
    
    // MARK: - Public Methods
    // событие клавиатуры при нажатии на Return
    // для работы нужно присвоить делегат и добавить протокол
    // UITextFieldDelegate и textField.delegate = self (через расширение не работает)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if checkСredentials() { // переход по сегвею mainSegue
            performSegue(withIdentifier: "mainSegue", sender: self)
        }
        return true
    }
    
    // MARK: - Private Methods
    // проверяем логин / пароль
    private func checkСredentials() -> Bool {
        
        guard userNameField.text != "" else { userNameField.alarm()
            return false
        }
        guard passwordField.text != "" else { passwordField.alarm()
            return false
        }
        
        guard userNameField.text == person.login,
              passwordField.text == person.password
        else {
            showAlert(
                withTitle: "Invalid login or password!",
                andMessage: "Please, enter correct login and password",
                clearableFields: [passwordField] )
            return false
        }
        return true
    }
    
    // объявление алерта
    private func showAlert(
        withTitle title: String,
        andMessage message: String,
        clearableFields: [UITextField]? = nil) {
            
            let alert = UIAlertController(
                title: title, message: message, preferredStyle: .alert
            )
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                clearableFields?.forEach { $0.text = "" } //стираем несколько полей
            }
            alert.addAction(okAction)
            present(alert, animated: true)
        }
}

