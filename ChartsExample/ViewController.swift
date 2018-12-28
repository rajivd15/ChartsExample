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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        combinedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        combinedInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        lineLayer.frame = bounds
        circlesLayer.frame = bounds
        
        if let d = data {
//            setTransform(minX: xMin, maxX: xMax, minY: yMin, maxY: yMax)
//            plot(d)
        }
    }
    
    func combinedInit() {
        layer.addSublayer(lineLayer)
        lineLayer.fillColor = UIColor.clear.cgColor
        lineLayer.strokeColor = lineColor.cgColor
        
        layer.addSublayer(circlesLayer)
        circlesLayer.fillColor = circleColor.cgColor
        
        layer.borderWidth = 1.0
        layer.borderColor = axisColor.cgColor
    }
}
