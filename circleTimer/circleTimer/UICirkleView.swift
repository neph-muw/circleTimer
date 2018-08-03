//
//  UICirkleView.swift
//  circleTimer
//
//  Created by Roman Mykitchak on 03/08/2018.
//  Copyright © 2018 Roman Mykitchak. All rights reserved.
//

import Foundation
import UIKit

class UICircleView: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let path = UIBezierPath()
        let radius = self.minSide() - 20.0
        let realCenter = CGPoint(x: self.center.x-self.frame.origin.x, y: self.center.y-self.frame.origin.y)
        debugPrint(self.frame)
        
        //UIColor.white.setFill()
        UIColor(red: 239.0/255.0, green: 148.0/255.0, blue: 147.0/255.0, alpha: 1.0).setStroke()
        path.addArc(withCenter:realCenter , radius: CGFloat(radius), startAngle: CGFloat(0), endAngle: CGFloat(2.0*Double.pi/1.0), clockwise: true)
        path.lineWidth = 35.0
        
        self.drawShtrih(path: path, radius: radius)
        
        path.close()
        //path.fill()
        path.stroke()
    }
    
    func drawShtrih(path:UIBezierPath, radius:CGFloat) {
        UIColor(red: 235.0/255.0, green: 98.0/255.0, blue: 98.0/255.0, alpha: 1.0).setFill()
        path.lineWidth = 3.0
        
        let r1 = Double(radius - 15.0 + 2.0)
        let r2 = Double(radius + 15.0 - 2.0)
        let x0 = Double( self.center.x-self.frame.origin.x)
        let y0 = Double( self.center.y-self.frame.origin.y)
        
        let A = Double.pi*3.0/2.0
        for i in 0...11 {
            let x1 = r1 * cos(A+(Double(i)*Double.pi/6)) + x0;
            let y1 = r1 * sin(A+(Double(i)*Double.pi/6)) + y0;
            
            let x2 = r2 * cos(A+(Double(i)*Double.pi/6)) + x0;
            let y2 = r2 * sin(A+(Double(i)*Double.pi/6)) + y0;
            
            path.move(to: CGPoint(x: x1, y: y1))
            path.addLine(to: CGPoint(x: x2, y: y2))
        }
    }
    
    func minSide() -> CGFloat {
        if self.frame.size.width>self.frame.size.height {
            return self.frame.size.height/2.0
        } else {
            return self.frame.size.width/2.0
        }
    }
    
    
    
}
