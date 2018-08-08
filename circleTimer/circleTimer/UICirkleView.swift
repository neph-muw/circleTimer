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
    
    var counter:CGFloat = 2.0
    var timer = Timer()
    @IBInspectable var outlineColor: UIColor = UIColor(red: 239.0/255.0, green: 148.0/255.0, blue: 147.0/255.0, alpha: 1.0)
    @IBInspectable var arcColor: UIColor = UIColor(red: 249.0/255.0, green: 169.0/255.0, blue: 84.0/255.0, alpha: 1.0)
    @IBInspectable var shtrihColor: UIColor = UIColor(red: 233.0/255.0, green: 99.0/255.0, blue: 96.0/255.0, alpha: 1.0)
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        //outline
        let path = UIBezierPath()
        
        let radius = self.minSide() - 20.0
        let realCenter = CGPoint(x: self.center.x-self.frame.origin.x, y: self.center.y-self.frame.origin.y)
        debugPrint(self.frame)
        
        outlineColor.setStroke()
        path.addArc(withCenter:realCenter , radius: CGFloat(radius), startAngle: CGFloat(0), endAngle: CGFloat(2.0*Double.pi/1.0), clockwise: true)
        path.lineWidth = 35.0
        
        path.close()
        path.stroke()
        
        //arc
        let startAngle: CGFloat = 3 * .pi / 2
        let endAngle: CGFloat = ((.pi / 6) * counter) + (3 * .pi / 2)
        let arcPath = UIBezierPath(arcCenter: realCenter,
                                      radius: CGFloat(radius),
                                      startAngle: startAngle,
                                      endAngle: endAngle,
                                      clockwise: true)
        debugPrint(counter)
        
        arcColor.setStroke()
        arcPath.lineWidth = 35.0
        
        arcPath.close()
        arcPath.stroke()
        
        //shtrih
        let shtrihPath = UIBezierPath()
        shtrihColor.setStroke()
        shtrihPath.lineWidth = 3.0

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

            shtrihPath.move(to: CGPoint(x: x1, y: y1))
            shtrihPath.addLine(to: CGPoint(x: x2, y: y2))
        }

        shtrihPath.close()
        shtrihPath.stroke()
        
    }
    
    func run(tagi:Int) {
        self.tag = tagi
        if tagi == 1 {
            self.start()
        } else {
            self.stop()
        }
    }
    
    func start() {
        counter = 0
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.secondPass), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    func stop() {
        counter = 0
        timer.invalidate()
        //self.draw(self.frame)
        setNeedsDisplay()
    }
    
    @objc func secondPass(){
        NSLog("counting..")
        if counter == 12 {
            counter = 0
            timer.invalidate()
        } else {
            counter = counter + 1
        }
        
        //self.draw(self.frame)
        self.setNeedsDisplay()
    }
    
    func minSide() -> CGFloat {
        if self.frame.size.width>self.frame.size.height {
            return self.frame.size.height/2.0
        } else {
            return self.frame.size.width/2.0
        }
    }
    
    
    
}
