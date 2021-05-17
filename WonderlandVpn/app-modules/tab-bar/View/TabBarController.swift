//
//  TabBarController.swift
//  WonderlandVpn
//
//  Created by Лиза  Малиновская on 5/14/21.
//

import UIKit

class TabBarController: UITabBarController {

    let mainVC = MainViewController()
    let countriesVC = CountriesTableViewController()
    let navVC = NavigationController(rootViewController: CountriesTableViewController())
    
    var presenter: PresenterToViewProtocol!
    var configurator = TabBarConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpViews()
    }
    
}

extension TabBarController: ViewToPresenterProtocol {
    
    func setUpViews() {
        
        tabBar.barTintColor = UIColor.Custom.Black
        tabBar.isTranslucent = false
        
        tabBar.unselectedItemTintColor = UIColor.Custom.LightGrey
        tabBar.tintColor = UIColor.Custom.FadedWhite
        
        restorationIdentifier = "TabViewController"
       
        viewControllers = [mainVC, navVC]
        
        tabBar.items?[0].title = "Home"
        tabBar.items?[0].image = UIImage(systemName: "house.fill")
        tabBar.items?[1].title = "Countries"
        tabBar.items?[1].image = UIImage(systemName: "location")
        
        setViewControllers(self.viewControllers, animated: false)
        selectedViewController = mainVC
        
        
        
        
    }

}
