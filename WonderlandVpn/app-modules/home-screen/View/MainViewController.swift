//
//  ViewController.swift
//  WonderlandVpn
//
//  Created by Лиза  Малиновская on 5/14/21.
//

import UIKit

class MainViewController: UIViewController {

    lazy var connectionButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        button.layer.cornerRadius = 100
        button.backgroundColor = UIColor.blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("FUCK BUTOMA", for: UIButton.State.normal)
        return button
    }()
    
    lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.text = "Bangladesh"
        label.textColor = UIColor.white
        label.font = .systemFont(ofSize: 20)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 20, y: 10, width: self.view.bounds.width - 100, height: 20)
        return label
    }()
    
    lazy var flagImage: UIImageView = {
        let image = UIImage(named: "001-paraguay.png")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 20, y: self.view.bounds.height/2 - 10, width: 25, height: 25)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var titleView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 100))
        view.addSubview(flagImage)
        view.addSubview(countryLabel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.Custom.Black
        view.addSubview(connectionButton)
        view.addSubview(titleView)
        layoutSubviews()
        view.addSubview(UIView(frame: CGRect(x: 10, y: 10, width: 10, height: 10)))
        // Do any additional setup after loading the view.
    }

    func layoutSubviews() {
        NSLayoutConstraint.activate([
          //2
          connectionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            connectionButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
          //3
            connectionButton.widthAnchor.constraint(equalToConstant: 200),
            connectionButton.heightAnchor.constraint(equalToConstant: 200)
        ])
        NSLayoutConstraint.activate([
          //2
            titleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleView.bottomAnchor.constraint(equalTo: connectionButton.topAnchor),
          //3
            titleView.widthAnchor.constraint(equalToConstant: 150),
            titleView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
          //2
            countryLabel.leadingAnchor.constraint(equalTo: titleView.leadingAnchor, constant: 40),
          //3
            
            countryLabel.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
            countryLabel.widthAnchor.constraint(equalToConstant: 200),
            countryLabel.heightAnchor.constraint(equalToConstant: 20),
//            countryLabel.bottomAnchor.constraint(equalTo: connectionButton.topAnchor, constant: -20)
            
        ])
        NSLayoutConstraint.activate([
          //2
            flagImage.leadingAnchor.constraint(equalTo: titleView.leadingAnchor),
          //3
            flagImage.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
            flagImage.widthAnchor.constraint(equalToConstant: 20),
            flagImage.heightAnchor.constraint(equalToConstant: 20),
//            flagImage.bottomAnchor.constraint(equalTo: connectionButton.topAnchor, constant: -20)
            
        ])
 
    }
}

