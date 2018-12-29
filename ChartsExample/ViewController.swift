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
    
    func setAxisRange(forPoints points: [CGPoint]) {
        guard !points.isEmpty else {
            return
        }
        
        let xs = points.map() { $0.x }
        let ys = points.map() { $0.y }
        
        xMax = ceil(xs.max()! / deltaX) * deltaX
        yMax = ceil(ys.max()! / deltaY) * deltaY
        xMin = 0
        yMin = 0
        
        setTransform(minX: xMin, maxX: xMax, minY: yMin, maxY: yMax)
    }
    
    func setAxisRange(xMin: CGFloat, xMax: CGFloat, yMin: CGFloat, yMax: CGFloat) {
        self.xMin = xMin
        self.xMax = xMax
        self.yMin = yMin
        self.yMax = yMax
        
        setTransform(minX: xMin, maxX: xMax, minY: yMin, maxY: yMax)
    }
    
    func setTransform(minX: CGFloat, maxX: CGFloat, minY: CGFloat, maxY: CGFloat) {
        
        let xLabelSize = "\(Int(maxX))".size(whithSystemFontSize: labelFontSize)
        let yLabelSize = "\(Int(maxY))".size(whithSystemFontSize: labelFontSize)
        
        let xOffset = xLabelSize.height + 2
        let yOffset = yLabelSize.width + 5
        
        let xScale = (bounds.width - yOffset - xLabelSize.width/2 - 2) / (maxX - minX)
        let yScale = (bounds.height - xOffset - yLabelSize.height/2 - 2) / (maxY - minY)
        
        chartTranform = CGAffineTransform(a: xScale, b: 0, c: 0, d: -yScale, tx: yOffset, ty: bounds.height - xOffset)
        setNeedsDisplay()
    }
}
