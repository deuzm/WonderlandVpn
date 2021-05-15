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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpViews()
    }

}

extension TabBarController: ViewToPresenterProtocol {
    
    func setUpViews() {
        
        self.restorationIdentifier = "TabViewController"
        self.viewControllers = [mainVC, countriesVC]
        self.setViewControllers(self.viewControllers, animated: false)
        
        self.selectedViewController = mainVC
        
        mainVC.tabBarController?.tabBar.items?[0].title = "Lol"
        countriesVC.tabBarController?.tabBar.items?[1].title =  NSLocalizedString("LabelInfo", comment: "comment")
        
    }

}
