//
//  ViewController.swift
//  TrafficIntersection
//
//  Created by Riley Hooper on 11/20/17.
//  Copyright © 2017 Riley Hooper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var NorthStraight: UIView!
    @IBOutlet weak var NorthRight: UIView!
    @IBOutlet weak var NorthLeft: UIView!
    
    @IBOutlet weak var EastStraight: UIView!
    @IBOutlet weak var EastRight: UIView!
    @IBOutlet weak var EastLeft: UIView!
    
    @IBOutlet weak var SouthStraight: UIView!
    @IBOutlet weak var SouthRight: UIView!
    @IBOutlet weak var SouthLeft: UIView!
    
    @IBOutlet weak var WestStraight: UIView!
    @IBOutlet weak var WestRight: UIView!
    @IBOutlet weak var WestLeft: UIView!
    
    var timer = Timer()
    var counter = 0
    
    var northLight: light?
    var eastLight: light?
    var southLight: light?
    var westLight: light?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetCycle()
    }
    
    /// Reset timer for tracking light cycles.
    func resetCycle() {
        timer.invalidate()
        counter = 0
        self.timer = Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(self.setPath), userInfo: nil, repeats: true)
    }
    
    @objc func setPath() {
        print(counter)
        switch counter {
        case 1:
            setTrafficRightTurn(northDirection: true)
        case 5:
            setTrafficRightTurnYellow(northDirection: true)
        case 8:
            setTrafficStraight(northDirection: true)
        case 14:
            setTrafficStraightYellow(northDirection: true)
        case 17:
            setTrafficRightTurn(northDirection: false)
        case 21:
            setTrafficStraightYellow(northDirection: false)
        case 24:
            setTrafficStraight(northDirection: false)
        case 30:
            setTrafficStraightYellow(northDirection: false)
        case 33:
            resetCycle()
        default:
            break
        }
        counter += 1
    }
    
    func setTrafficStraight(northDirection: Bool) {
        if northDirection {
            northLight = light(straightColor: UIColor.green, rightColor: UIColor.orange, leftColor: UIColor.red)
            southLight = light(straightColor: UIColor.green, rightColor: UIColor.orange, leftColor: UIColor.red)
            eastLight = light(straightColor: UIColor.red, rightColor: UIColor.orange, leftColor: UIColor.red)
            westLight = light(straightColor: UIColor.red, rightColor: UIColor.orange, leftColor: UIColor.red)
        } else {
            eastLight = light(straightColor: UIColor.green, rightColor: UIColor.orange, leftColor: UIColor.red)
            westLight = light(straightColor: UIColor.green, rightColor: UIColor.orange, leftColor: UIColor.red)
            northLight = light(straightColor: UIColor.red, rightColor: UIColor.orange, leftColor: UIColor.red)
            southLight = light(straightColor: UIColor.red, rightColor: UIColor.orange, leftColor: UIColor.red)
        }
        updateLights()
    }
    
    func setTrafficStraightYellow(northDirection: Bool) {
        if northDirection {
            northLight = light(straightColor: UIColor.yellow, rightColor: UIColor.yellow, leftColor: UIColor.red)
            southLight = light(straightColor: UIColor.yellow, rightColor: UIColor.yellow, leftColor: UIColor.red)
            eastLight = light(straightColor: UIColor.red, rightColor: UIColor.yellow, leftColor: UIColor.red)
            westLight = light(straightColor: UIColor.red, rightColor: UIColor.yellow, leftColor: UIColor.red)
        } else {
            eastLight = light(straightColor: UIColor.yellow, rightColor: UIColor.yellow, leftColor: UIColor.red)
            westLight = light(straightColor: UIColor.yellow, rightColor: UIColor.yellow, leftColor: UIColor.red)
            northLight = light(straightColor: UIColor.red, rightColor: UIColor.yellow, leftColor: UIColor.red)
            southLight = light(straightColor: UIColor.red, rightColor: UIColor.yellow, leftColor: UIColor.red)
        }
        updateLights()
    }
    
    func setTrafficRightTurn(northDirection: Bool) {
        if northDirection {
            northLight = light(straightColor: UIColor.red, rightColor: UIColor.red, leftColor: UIColor.green)
            southLight = light(straightColor: UIColor.red, rightColor: UIColor.red, leftColor: UIColor.green)
            eastLight = light(straightColor: UIColor.red, rightColor: UIColor.green, leftColor: UIColor.red)
            westLight = light(straightColor: UIColor.red, rightColor: UIColor.green, leftColor: UIColor.red)
        } else {
            eastLight = light(straightColor: UIColor.red, rightColor: UIColor.red, leftColor: UIColor.green)
            westLight = light(straightColor: UIColor.red, rightColor: UIColor.red, leftColor: UIColor.green)
            northLight = light(straightColor: UIColor.red, rightColor: UIColor.green, leftColor: UIColor.red)
            southLight = light(straightColor: UIColor.red, rightColor: UIColor.green, leftColor: UIColor.red)
        }
        updateLights()
    }
    
    func setTrafficRightTurnYellow(northDirection: Bool) {
        if northDirection {
            northLight = light(straightColor: UIColor.red, rightColor: UIColor.red, leftColor: UIColor.yellow)
            southLight = light(straightColor: UIColor.red, rightColor: UIColor.red, leftColor: UIColor.yellow)
            eastLight = light(straightColor: UIColor.red, rightColor: UIColor.yellow, leftColor: UIColor.red)
            westLight = light(straightColor: UIColor.red, rightColor: UIColor.yellow, leftColor: UIColor.red)
        } else {
            eastLight = light(straightColor: UIColor.red, rightColor: UIColor.red, leftColor: UIColor.yellow)
            westLight = light(straightColor: UIColor.red, rightColor: UIColor.red, leftColor: UIColor.yellow)
            northLight = light(straightColor: UIColor.red, rightColor: UIColor.yellow, leftColor: UIColor.red)
            southLight = light(straightColor: UIColor.red, rightColor: UIColor.yellow, leftColor: UIColor.red)
        }
        updateLights()
    }
    
    
    func updateLights() {
        guard let north = northLight else {
            emergencyStop()
            return
        }
        guard let east = eastLight else {
            emergencyStop()
            return
        }
        guard let south = southLight else {
            emergencyStop()
            return
        }
        guard let west = westLight else {
            emergencyStop()
            return
        }
        
        NorthStraight.backgroundColor = north.straightColor
        NorthRight.backgroundColor = north.rightColor
        NorthLeft.backgroundColor = north.leftColor
        
        EastStraight.backgroundColor = east.straightColor
        EastRight.backgroundColor = east.rightColor
        EastLeft.backgroundColor = east.leftColor
        
        SouthStraight.backgroundColor = south.straightColor
        SouthRight.backgroundColor = south.rightColor
        SouthLeft.backgroundColor = south.leftColor
        
        WestStraight.backgroundColor = west.straightColor
        WestRight.backgroundColor = west.rightColor
        WestLeft.backgroundColor = west.leftColor
    }
    
    func emergencyStop() {
        NorthStraight.backgroundColor = UIColor.orange
        NorthRight.backgroundColor = UIColor.orange
        NorthLeft.backgroundColor = UIColor.orange
        
        EastStraight.backgroundColor = UIColor.orange
        EastRight.backgroundColor = UIColor.orange
        EastLeft.backgroundColor = UIColor.orange
        
        SouthStraight.backgroundColor = UIColor.orange
        SouthRight.backgroundColor = UIColor.orange
        SouthLeft.backgroundColor = UIColor.orange
        
        WestStraight.backgroundColor = UIColor.orange
        WestRight.backgroundColor = UIColor.orange
        WestLeft.backgroundColor = UIColor.orange
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
            self.resetCycle()
        })
    }
    
    
}

