//
//  ViewController.swift
//  WonderlandVpn
//
//  Created by Лиза  Малиновская on 5/14/21.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK:- Properties
    
    var currentCountry: Country?
    var presenter: HomePresenterToViewProtocol?
    var configurator: HomeConfiguratorProtocol!
    var pulsatingLayer: CAShapeLayer!
    var animation: CABasicAnimation!
    var isAnimationRunning: Bool?
    var pulsingView: LayerContainerView!
    
    var stateString: String = "Connect" {
        didSet {
            connectionButton.setTitle(stateString, for: .normal)
        }
    }
    
    //MARK: - subviews
    lazy var connectionButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        button.layer.cornerRadius = 100
        button.backgroundColor = UIColor.Custom.VioletBackground
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(stateString, for: UIButton.State.normal)
        button.addTarget(self, action: #selector(connectionButtonPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func connectionButtonPressed() {
        presenter?.startConnectingToVPN()
    }
    
    lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.text = "Bangladesh"
        label.textColor = UIColor.Custom.FadedWhite
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        return label
    }()
    
    var imageName: String = "" {
        didSet {
            flagImage.image = UIImage(named: imageName)
        }
    }
    
    lazy var flagImage: UIImageView = {
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 20, y: self.view.bounds.height/2 - 10, width: 25, height: 25)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var titleView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 200))
        view.addSubview(flagImage)
        view.addSubview(countryLabel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK:- functions
    func setUpNontificationObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    
    func setUpPulsatingLayer() {
        pulsingView = LayerContainerView()
        
        pulsingView.backgroundColor = UIColor.red
        let layer = pulsingView.layer as! CAShapeLayer
        let circularPath = UIBezierPath(arcCenter: pulsingView.center, radius: 100, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        layer.path = circularPath.cgPath
        layer.fillColor = UIColor.Custom.VioletGlowColor.cgColor
        layer.lineCap = CAShapeLayerLineCap(rawValue: "round")
        layer.position = view.center
        view.addSubview(pulsingView)
    }
    
    
    func setPulsatingAnimation() {
        animation = CABasicAnimation(keyPath: "transform.scale")
        animation.toValue = 1.15
        animation.duration = 0.5
        animation.autoreverses = true
        animation.repeatCount = Float.infinity
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        pulsingView.layer.add(self.animation!, forKey: "pulsing")
    }
    @objc private func handleEnterForeground() {
        presenter?.refreshState()
    }
    
    func setUpViews() {
        view.backgroundColor = UIColor.Custom.Black
        view.addSubview(connectionButton)
        view.addSubview(titleView)
        layoutSubviews()
        view.addSubview(UIView(frame: CGRect(x: 10, y: 10, width: 10, height: 10)))
    }
    
    //MARK: - viewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator = HomeConfigurator()
        configurator.configure(with: self)
        
        setUpNontificationObservers()
        setUpPulsatingLayer()
        setUpViews()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        presenter?.refreshState()
        presenter?.startFetchingCurrentCountry()
    }
    
    //MARK: - Subviews layout
    func layoutSubviews() {

        connectionButton.layer.position = view.center
        titleView.layer.position = view.center
       
        NSLayoutConstraint.activate([
            
          connectionButton.centerXAnchor.constraint(equalTo: pulsingView.centerXAnchor),
            connectionButton.centerYAnchor.constraint(equalTo: pulsingView.centerYAnchor),
            connectionButton.widthAnchor.constraint(equalToConstant: 200),
            connectionButton.heightAnchor.constraint(equalToConstant: 200)
        ])
        NSLayoutConstraint.activate([
            
            titleView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -10),
            titleView.bottomAnchor.constraint(equalTo: connectionButton.topAnchor, constant: -20),
            titleView.widthAnchor.constraint(equalToConstant: 100),
            titleView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            
            countryLabel.leadingAnchor.constraint(equalTo: titleView.leadingAnchor, constant: 40),
            countryLabel.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
            countryLabel.widthAnchor.constraint(equalToConstant: 150),
            countryLabel.heightAnchor.constraint(equalToConstant: 60)
            
        ])
        NSLayoutConstraint.activate([
            
            flagImage.leadingAnchor.constraint(equalTo: titleView.leadingAnchor),
            flagImage.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
            flagImage.widthAnchor.constraint(equalToConstant: 20),
            flagImage.heightAnchor.constraint(equalToConstant: 20)
            
        ])
 
    }
}

//MARK: - Presenter callback functions
extension HomeViewController: HomeViewToPresenterProtocol {
    
    func setCountryUI(with data: Country) {
        imageName = data.image
        countryLabel.text = data.name
    }
    
    func startPulsingAnimation() {
        if isAnimationRunning == false {
            isAnimationRunning = true
        }
        setPulsatingAnimation()
        stateString =  "Connecting..."
    }
    
    func stopPulsingAnimation() {
        if isAnimationRunning == true {
            isAnimationRunning = false
        }
        pulsingView.layer.removeAllAnimations()
        stateString = "Completed!"
    }
    
    func resetAnimation() {
        isAnimationRunning = false
        stateString = "Connect"
        pulsingView.layer.removeAllAnimations()
    }
}


class LayerContainerView: UIView {

    override public class var layerClass: Swift.AnyClass {
        return CAShapeLayer.self
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        guard let shapeLayer = self.layer as? CAShapeLayer else { return }
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 100, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.green.cgColor
        shapeLayer.fillColor = UIColor.green.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap(rawValue: "round")
    }
}
