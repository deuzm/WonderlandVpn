//
//  ContainerView.swift
//  WonderlandVpn
//
//  Created by Лиза  Малиновская on 5/18/21.
//

import Foundation
import UIKit

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
