//
//  Extensions.swift
//  ChartsExample
//
//  Created by Rajiv Deshmukh on 12/28/18.
//  Copyright © 2018 Rajiv Deshmukh. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func size(whithSystemFontSize pointSize: CGFloat) -> CGSize {
        return (self as NSString).size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: pointSize)])
    }
}

extension CGPoint {
    func adding(x: CGFloat) -> CGPoint { return CGPoint(x: self.x + x, y: self.y) }
    func adding(y: CGFloat) -> CGPoint { return CGPoint(x: self.x, y: self.y + y) }
}
