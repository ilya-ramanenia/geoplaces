//
//  Extensions.swift
//  GeoPlaces
//
//  Created by Ilya Ramanenia on 6/29/18.
//  Copyright © 2018 ilyaramanenia. All rights reserved.
//

import UIKit

extension CALayer {
    var borderUIColor: UIColor {
        set { self.borderColor = newValue.cgColor }
        get { return UIColor(cgColor: self.borderColor!) }
    }
}


extension UIColor {
    static func blend(colors: [UIColor]) -> UIColor {
        let componentsSum = colors.reduce((red: CGFloat(0), green: CGFloat(0), blue: CGFloat(0))) { (temp, color) in
            guard let components = color.cgColor.components else { return temp }
            return (temp.0 + components[0], temp.1 + components[1], temp.2 + components[2])
        }
        let components = (red: componentsSum.red / CGFloat(colors.count) ,
                          green: componentsSum.green / CGFloat(colors.count),
                          blue: componentsSum.blue / CGFloat(colors.count))
        return UIColor(red: components.red, green: components.green, blue: components.blue, alpha: 1)
    }
    
    func blend(_ color: UIColor, proportion: CGFloat) -> UIColor {
        guard let componentsL = cgColor.components, let componentsR = color.cgColor.components else { return self }
        
        let lR = componentsL[0] * proportion
        let lG = componentsL[1] * proportion
        let lB = componentsL[2] * proportion
        
        let rR = componentsR[0] * (1 - proportion)
        let rG = componentsR[1] * (1 - proportion)
        let rB = componentsR[2] * (1 - proportion)
        
        return UIColor(red: lR + rR, green: lG + rG, blue: lB + rB, alpha: 1)
    }
}

//Stroryboard
extension UIStoryboard {
    static var main: UIStoryboard { return UIStoryboard(name: "Main", bundle: nil) }
}
