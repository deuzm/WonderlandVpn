//
//  NavigationController.swift
//  WonderlandVpn
//
//  Created by Лиза  Малиновская on 5/15/21.
//

import UIKit

class NavigationController: UINavigationController {
// MARK:- header views
    lazy var coutriesLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.Custom.FadedWhite
        label.text = "Countries"
        label.font = .systemFont(ofSize: 20)
        label.frame = CGRect(x: 20,
                             y: 20,
                             width: 300,
                             height: 20)
        return label
    }()
    
    lazy var headerBox: UIView = {
        let view = UIView.init(frame: CGRect(x: 0.0, y: 0.0, width: 300, height: 60))
        view.backgroundColor = UIColor.Custom.Black
        var countries = coutriesLabel
        view.addSubview(countries)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.barTintColor = UIColor.Custom.Black
        navigationBar.isTranslucent = false
        navigationBar.addSubview(headerBox)
        // Do any additional setup after loading the view.
    }
    
    
}
