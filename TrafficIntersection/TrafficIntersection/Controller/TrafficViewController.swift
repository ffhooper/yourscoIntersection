//
//  TrafficViewController.swift
//  TrafficIntersection
//
//  Created by Riley Hooper on 11/20/17.
//  Copyright © 2017 Riley Hooper. All rights reserved.
//

import UIKit

class TrafficViewController: UIViewController {
    
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
    var testDangerSignal = UIColor.green
    
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
    
    /// Set light patten for intersection.
    @objc func setPath() {
        print(counter)
        switch counter {
        case 1:
            // Set Traffic to Left Turn (north bound: true)
            updateLights(ns: .red, nr: .red, nl: .green, es: .red, er: .green, el: .red, ss: .red, sr: .red, sl: .green, ws: .red, wr: .green, wl: .red)
        case 5:
            // Set Traffic to Left Turn Yellow (north bound: true)
            updateLights(ns: .red, nr: .red, nl: .yellow, es: .red, er: .yellow, el: .red, ss: .red, sr: .red, sl: .yellow, ws: .red, wr: .yellow, wl: .red)
        case 8:
            // Set Traffic to Straight (north bound: true)
            updateLights(ns: .green, nr: .orange, nl: .red, es: .red, er: .orange, el: .red, ss: .green, sr: .orange, sl: .red, ws: .red, wr: .orange, wl: testDangerSignal)
        case 14:
            // Set Traffic to Straight Yellow (north bound: true)
            updateLights(ns: .yellow, nr: .yellow, nl: .red, es: .red, er: .yellow, el: .red, ss: .yellow, sr: .yellow, sl: .red, ws: .red, wr: .yellow, wl: .red)
        case 17:
            // Set Traffic to Left Turn (north bound: false)
            updateLights(ns: .red, nr: .green, nl: .red, es: .red, er: .red, el: .green, ss: .red, sr: .green, sl: .red, ws: .red, wr: .red, wl: .green)
        case 21:
            // Set Traffic to Left Turn Yellow (north bound: false)
            updateLights(ns: .red, nr: .yellow, nl: .red, es: .red, er: .red, el: .yellow, ss: .red, sr: .yellow, sl: .red, ws: .red, wr: .red, wl: .yellow)
        case 24:
            // Set Traffic to Straight (north bound: false)
            updateLights(ns: .red, nr: .orange, nl: .red, es: .green, er: .orange, el: .red, ss: .red, sr: .orange, sl: .red, ws: .green, wr: .orange, wl: .red)
        case 30:
            // Set Traffic to Straight Yellow (north bound: false)
            updateLights(ns: .red, nr: .yellow, nl: .red, es: .yellow, er: .yellow, el: .red, ss: .red, sr: .yellow, sl: .red, ws: .yellow, wr: .yellow, wl: .red)
        case 33:
            resetCycle()
        default:
            break
        }
        counter += 1
    }
    
    
    /// Update light patten for each step in cycle.
    ///
    /// - Parameters:
    ///   - ns: North straight color.
    ///   - nr: North right color.
    ///   - nl: North left color.
    ///   - es: East straight color.
    ///   - er: East right color.
    ///   - el: East left color.
    ///   - ss: South straight color.
    ///   - sr: South right color.
    ///   - sl: South left color.
    ///   - ws: West straight color.
    ///   - wr: West right color.
    ///   - wl: West left color.
    func updateLights(ns: UIColor, nr: UIColor, nl: UIColor, es: UIColor, er: UIColor, el: UIColor, ss: UIColor, sr: UIColor, sl: UIColor, ws: UIColor, wr: UIColor, wl: UIColor) {
        // MARK: - Safety check. Double check that signals are not crossed.
        if ns == .green && el == .green { emergencyStop(); return }
        if ns == .green && sl == .green { emergencyStop(); return }
        if ns == .green && wl == .green { emergencyStop(); return }
        // TODO: Build safety check for all directions.
        
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
    
    /// Set all signal lights to orange, then restart cycle after 3 seconds.
    func emergencyStop() {
        testDangerSignal = .red
        
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

