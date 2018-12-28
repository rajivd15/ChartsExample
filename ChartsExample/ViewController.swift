//
//  ViewController.swift
//  ChartsExample
//
//  Created by Rajiv Deshmukh on 12/27/18.
//  Copyright © 2018 Rajiv Deshmukh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

class LineChart: UIView {
    
    let lineLayer = CAShapeLayer()
    let circlesLayer = CAShapeLayer()
    
    var chartTranform: CGAffineTransform!
    
    var lineColor: UIColor = UIColor.green {
        didSet {
            lineLayer.strokeColor = lineColor.cgColor
        }
    }
    
    var lineWidth: CGFloat = 1.0
    
    var showPoints: Bool = true {
        didSet {
            circlesLayer.isHidden = !showPoints
        }
    }
    
    var circleColor: UIColor = UIColor.red {
        didSet {
            circlesLayer.fillColor = circleColor.cgColor
        }
    }
    
    var cirleSizeMultiplier: CGFloat = 3.0
    
    var axisColor: UIColor = .white
    var showInnerLines: Bool = true
    var labelFontSize: CGFloat = 10.0
    
    var axisLinesWidth: CGFloat = 1.0
    
    var deltaX: CGFloat = 10.0
    var deltaY: CGFloat = 10
    
    var xMax: CGFloat = 100
    var yMax: CGFloat = 100
    var xMin: CGFloat = 0
    var yMin: CGFloat = 0
    
    var data: [CGPoint]?
}

extension String {
    func size(whithSystemFontSize pointSize: CGFloat) -> CGSize {
        return (self as NSString).size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: pointSize)])
    }
}

extension CGPoint {
    func adding(x: CGFloat) -> CGPoint { return CGPoint(x: self.x + x, y: self.y) }
    func adding(y: CGFloat) -> CGPoint { return CGPoint(x: self.x, y: self.y + y) }
}
