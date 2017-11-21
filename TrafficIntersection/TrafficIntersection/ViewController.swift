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
            // Set Traffic to Left Turn (north bound: true)
            updateLights(ns: UIColor.red, nr: UIColor.red, nl: UIColor.green, es: UIColor.red, er: UIColor.green, el: UIColor.red, ss: UIColor.red, sr: UIColor.red, sl: UIColor.green, ws: UIColor.red, wr: UIColor.green, wl: UIColor.red)
        case 5:
            // Set Traffic to Left Turn Yellow (north bound: true)
            updateLights(ns: UIColor.red, nr: UIColor.red, nl: UIColor.yellow, es: UIColor.red, er: UIColor.yellow, el: UIColor.red, ss: UIColor.red, sr: UIColor.red, sl: UIColor.yellow, ws: UIColor.red, wr: UIColor.yellow, wl: UIColor.red)
        case 8:
            // Set Traffic to Straight (north bound: true)
            updateLights(ns: UIColor.green, nr: UIColor.orange, nl: UIColor.red, es: UIColor.red, er: UIColor.orange, el: UIColor.red, ss: UIColor.green, sr: UIColor.orange, sl: UIColor.red, ws: UIColor.red, wr: UIColor.orange, wl: UIColor.red)
        case 14:
            // Set Traffic to Straight Yellow (north bound: true)
            updateLights(ns: UIColor.yellow, nr: UIColor.yellow, nl: UIColor.red, es: UIColor.red, er: UIColor.yellow, el: UIColor.red, ss: UIColor.yellow, sr: UIColor.yellow, sl: UIColor.red, ws: UIColor.red, wr: UIColor.yellow, wl: UIColor.red)
        case 17:
            // Set Traffic to Left Turn (north bound: false)
            updateLights(ns: UIColor.red, nr: UIColor.green, nl: UIColor.red, es: UIColor.red, er: UIColor.red, el: UIColor.green, ss: UIColor.red, sr: UIColor.green, sl: UIColor.red, ws: UIColor.red, wr: UIColor.red, wl: UIColor.green)
        case 21:
            // Set Traffic to Left Turn Yellow (north bound: false)
            updateLights(ns: UIColor.red, nr: UIColor.yellow, nl: UIColor.red, es: UIColor.red, er: UIColor.red, el: UIColor.yellow, ss: UIColor.red, sr: UIColor.yellow, sl: UIColor.red, ws: UIColor.red, wr: UIColor.red, wl: UIColor.yellow)
        case 24:
            // Set Traffic to Straight (north bound: false)
            updateLights(ns: UIColor.red, nr: UIColor.orange, nl: UIColor.red, es: UIColor.green, er: UIColor.orange, el: UIColor.red, ss: UIColor.red, sr: UIColor.orange, sl: UIColor.red, ws: UIColor.green, wr: UIColor.orange, wl: UIColor.red)
        case 30:
            // Set Traffic to Straight Yellow (north bound: false)
            updateLights(ns: UIColor.red, nr: UIColor.yellow, nl: UIColor.red, es: UIColor.yellow, er: UIColor.yellow, el: UIColor.red, ss: UIColor.red, sr: UIColor.yellow, sl: UIColor.red, ws: UIColor.yellow, wr: UIColor.yellow, wl: UIColor.red)
        case 33:
            resetCycle()
        default:
            break
        }
        counter += 1
    }
    
    
    func updateLights(ns: UIColor, nr: UIColor, nl: UIColor, es: UIColor, er: UIColor, el: UIColor, ss: UIColor, sr: UIColor, sl: UIColor, ws: UIColor, wr: UIColor, wl: UIColor) {
//        guard let north = northLight else {
//            emergencyStop()
//            return
//        }
//        guard let east = eastLight else {
//            emergencyStop()
//            return
//        }
//        guard let south = southLight else {
//            emergencyStop()
//            return
//        }
//        guard let west = westLight else {
//            emergencyStop()
//            return
//        }
        
        NorthStraight.backgroundColor = ns
        NorthRight.backgroundColor = nr
        NorthLeft.backgroundColor = nl
        
        EastStraight.backgroundColor = es
        EastRight.backgroundColor = er
        EastLeft.backgroundColor = el
        
        SouthStraight.backgroundColor = ss
        SouthRight.backgroundColor = sr
        SouthLeft.backgroundColor = sl
        
        WestStraight.backgroundColor = ws
        WestRight.backgroundColor = wr
        WestLeft.backgroundColor = wl
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

