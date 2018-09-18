//
//  ViewController.swift
//  Animations
//
//  Created by Austin Van Alfen on 9/18/18.
//  Copyright © 2018 Austin Van Alfen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CAAnimationDelegate {
    
    private var maskLayer: CAShapeLayer {
        let circlePath = UIBezierPath(arcCenter: view.center, radius: 50, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        let newLayer = CAShapeLayer()
        newLayer.path = circlePath.cgPath
        newLayer.strokeColor = UIColor.blue.cgColor
        newLayer.lineWidth = 1
        newLayer.strokeEnd = 0
        newLayer.lineCap = .round
        newLayer.fillColor = UIColor.white.cgColor
        return newLayer
    }
    
    lazy private var blueLayer: CAShapeLayer = {
        let circlePath = UIBezierPath(arcCenter: view.center, radius: 50, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        let newLayer = CAShapeLayer()
        newLayer.path = circlePath.cgPath
        newLayer.strokeColor = #colorLiteral(red: 0.06274509804, green: 0.4196078431, blue: 0.6470588235, alpha: 1)
        newLayer.lineWidth = 1
        newLayer.strokeEnd = 0
        newLayer.lineCap = .round
        newLayer.fillColor = UIColor.clear.cgColor // #colorLiteral(red: 0.06274509804, green: 0.4196078431, blue: 0.6470588235, alpha: 1)
        return newLayer
    }()
    
    lazy private var fourthOval: CAShapeLayer = {
        let outsideOvalCenter = CGPoint(x: view.center.x - 88, y: view.center.y - 43.6)
        let ovalPath = UIBezierPath(ovalIn: CGRect.init(origin: outsideOvalCenter, size: CGSize.init(width: 176, height: 87.2)))
        let newLayer = CAShapeLayer()
        newLayer.path = ovalPath.cgPath
        newLayer.strokeColor = UIColor.white.cgColor
        newLayer.fillColor = UIColor.clear.cgColor
        newLayer.lineWidth = 3
        newLayer.mask = maskLayer
        return newLayer
    }()
    
    lazy private var thirdOval: CAShapeLayer = {
        let outsideOvalCenter = CGPoint(x: view.center.x - 88, y: view.center.y - 33)
        let ovalPath = UIBezierPath(ovalIn: CGRect.init(origin: outsideOvalCenter, size: CGSize.init(width: 176, height: 66)))
        let newLayer = CAShapeLayer()
        newLayer.path = ovalPath.cgPath
        newLayer.strokeColor = UIColor.white.cgColor
        newLayer.fillColor = UIColor.clear.cgColor
        newLayer.lineWidth = 3
        newLayer.mask = maskLayer
        return newLayer
    }()
    
    lazy private var secondOval: CAShapeLayer = {
        let outsideOvalCenter = CGPoint(x: view.center.x - 88, y: view.center.y - 20)
        let ovalPath = UIBezierPath(ovalIn: CGRect.init(origin: outsideOvalCenter, size: CGSize.init(width: 176, height: 40)))
        let newLayer = CAShapeLayer()
        newLayer.path = ovalPath.cgPath
        newLayer.strokeColor = UIColor.white.cgColor
        newLayer.fillColor = UIColor.clear.cgColor
        newLayer.lineWidth = 3
        newLayer.mask = maskLayer
        return newLayer
    }()
    
    lazy private var firstOval: CAShapeLayer = {
        let outsideOvalCenter = CGPoint(x: view.center.x - 88, y: view.center.y - 7.5)
        let ovalPath = UIBezierPath(ovalIn: CGRect.init(origin: outsideOvalCenter, size: CGSize.init(width: 176, height: 15)))
        let newLayer = CAShapeLayer()
        newLayer.path = ovalPath.cgPath
        newLayer.strokeColor = UIColor.white.cgColor
        newLayer.fillColor = UIColor.clear.cgColor
        newLayer.lineWidth = 3
        newLayer.mask = maskLayer
        return newLayer
    }()
    
    lazy private var containedV: CAShapeLayer = {
        let cgPath = CGMutablePath()
        cgPath.move(to: CGPoint.init(x: view.center.x - 50, y: view.center.y))
        cgPath.addLine(to: CGPoint.init(x: view.center.x - 35, y: view.center.y))
        cgPath.addLine(to: CGPoint.init(x: view.center.x - 15, y: view.center.y + 30))
        cgPath.addLine(to: CGPoint.init(x: view.center.x + 18, y: view.center.y - 25))
        cgPath.addLine(to: CGPoint.init(x: view.center.x + 50, y: view.center.y - 20))
        let ovalPath = UIBezierPath(cgPath: cgPath)
        
        let newLayer = CAShapeLayer()
        newLayer.path = ovalPath.cgPath
        newLayer.strokeColor = UIColor.white.cgColor
        newLayer.fillColor = UIColor.clear.cgColor
        newLayer.lineWidth = 15
        newLayer.strokeEnd = 0
        newLayer.mask = maskLayer
        return newLayer
    }()
    
    var animation = CABasicAnimation(keyPath: "strokeEnd")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.addSublayer(blueLayer)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startFirstAnimation()
    }
    
    private func startFirstAnimation() {
        animation.delegate = self
        animation.toValue = 1
        animation.duration = 2
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = true
        
        blueLayer.add(animation, forKey: "basic")
    }
    
    var animationNumber = 1
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
        switch animationNumber {
        case 1:
            addBackgroundOvals()
            
            animation = CABasicAnimation(keyPath: "strokeColor")
            animation.delegate = self
            animation.toValue = UIColor.white.cgColor
            animation.duration = 0.5
            animation.fillMode = .forwards
            animation.isRemovedOnCompletion = false
            
            blueLayer.add(animation, forKey: "nothing")
            animationNumber += 1
            
        case 2:
            animation = CABasicAnimation(keyPath: "fillColor")
            animation.delegate = self
            animation.toValue = #colorLiteral(red: 0.06274509804, green: 0.4196078431, blue: 0.6470588235, alpha: 1).cgColor
            animation.duration = 0.5
            animation.fillMode = .forwards
            animation.isRemovedOnCompletion = false

            blueLayer.add(animation, forKey: "nothing")
            animationNumber += 1
            
        case 3:
            view.layer.addSublayer(containedV)
            
            animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.delegate = self
            animation.toValue = 1
            animation.duration = 1
            animation.fillMode = .forwards
            animation.isRemovedOnCompletion = false
            
            containedV.add(animation, forKey: "nothing")
            animationNumber += 1
            
        default:
            return
        }
    }
    
    private func addBackgroundOvals() {
        view.layer.addSublayer(fourthOval)
        view.layer.addSublayer(thirdOval)
        view.layer.addSublayer(secondOval)
        view.layer.addSublayer(firstOval)
    }

}

