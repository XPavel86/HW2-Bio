//
//  WelcomeTabBarViewController.swift
//  HW2-Bio
//
//  Created by Pavel Dolgopolov on 23.02.2024.
//

import UIKit

final class WelcomeTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // настраиваем таббар
        let tabBarAppearance = UITabBarAppearance()
        //отключаем прозрачность
        tabBarAppearance.configureWithOpaqueBackground()
        // применяем к нашему таббару
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
    }
        
}
    


