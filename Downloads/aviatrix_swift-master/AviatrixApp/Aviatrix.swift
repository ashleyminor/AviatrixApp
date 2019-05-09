//
//  Aviatrix.swift
//  AviatrixApp
//
//  Created by Amy Holt on 6/10/18.
//  Copyright © 2018 Amy Holt. All rights reserved.
//

import Foundation

class Aviatrix {
    
    var running = false
    var name = "Some Author Name"
    var currentLocation = "St. Louis"
    var distanceTraveled = 0
    var maxFuel = 5000
    var fuelLevel = 5000.0
    var mpg = 0.4
    var fuelCost = 0.0
    
    init(name : String) {
        self.name = name
    }
    
    func start() -> Bool {
        running = true
        return running
    }
    
    func refuel() -> Double {
        let gallonsNeeded = Double(maxFuel) - fuelLevel
        let data = AviatrixData()
        fuelCost += gallonsNeeded * data.fuelPrices[currentLocation]!
        
        fuelLevel = 5000.0
        
        return gallonsNeeded
    }
    
    func flyTo(destination : String) {
        distanceTraveled += distanceTo(target: destination, current: currentLocation)
        let fuelUsed = Double(distanceTraveled) / mpg
        fuelLevel -= fuelUsed
        currentLocation = destination
        
    }
    
    func distanceTo(target : String, current : String) -> Int {
        let data = AviatrixData()
        return data.knownDistances[current]![target]!
    }
    
    func knownDestinations() -> [String] {
       return ["St. Louis", "Phoenix", "Denver", "SLC"]
    }
}
