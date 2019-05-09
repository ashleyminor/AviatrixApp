//
//  main.swift
//  AviatrixApp
//
//  Created by Amy Holt on 6/10/18.
//  Copyright © 2018 Amy Holt. All rights reserved.
//

import Foundation

func gauges(myPlane : Aviatrix) {
    print("Reading the gauges...")
    print(" ")
    print("| Running:  | ✅")
    print("| Location:  | \(myPlane.currentLocation)")
    print("| Distance:  | \(myPlane.distanceTraveled) miles")
    print("| Fuel:      | \(myPlane.fuelLevel) gallons")
    print("| Max Fuel:  | \(myPlane.maxFuel) gallons")
    print("| MPG:       | \(myPlane.mpg)")
    print("| Fuel Bill: | \(myPlane.fuelCost)")
}

func fly(myPlane : Aviatrix) {
    print("Where would you like to fly?")
    print(" ")
    let destinations = myPlane.knownDestinations()
    
    for (index, city) in destinations.enumerated() {
        let distance = myPlane.distanceTo(target: city, current: myPlane.currentLocation)
        print("\(index): \(city), \(distance) miles")
    }
    
    let response = Int(readLine()!)
    var desiredLocation = ""
    
    if response! >= 0 && response! < 4 {
        desiredLocation = myPlane.knownDestinations()[response!]
        
        print("🛫 Preparing for takeoff...")
        print("🛫 Flying...")
        
        if fuelCheck(myPlane: myPlane, destination : desiredLocation) {
            myPlane.flyTo(destination: desiredLocation)
            print("🛬 You've arrived in \(myPlane.currentLocation)!")
            gauges(myPlane: myPlane)
        }
    }
    else {
        print("⚠️Please enter a valid command⚠️")
    }
    
}

func refuel(myPlane : Aviatrix) {
    _ = myPlane.refuel()
    let data = AviatrixData().fuelPrices
    
    print("Refueling...")
    print("⛽ Here in \(myPlane.currentLocation), jet fuel costs $\(data[myPlane.currentLocation]!)")
    print("⛽ You refueled \(myPlane.refuel()) gallons totaling $\(myPlane.fuelCost)")
}

func fuelCheck(myPlane : Aviatrix, destination : String) -> Bool {
//    let distanceToTravel =  Double(myPlane.distanceTo(target : destination))
//    if myPlane.fuelLevel < distanceToTravel {
//        print(" ")
//        print("🔥 🔥 🔥 🔥 🔥 🔥 🔥 🔥 🔥 🔥")
//        print("Oh no! You've run out of fuel and crashed on the way to \(myPlane.location)!")
//        print("🔥 🔥 🔥 🔥 🔥 🔥 🔥 🔥 🔥 🔥")
//
//        return false
//    } else {
//        return true
//    }
    return true
}

var plane = Aviatrix(name: "Ashley Minor")
plane.name = "Ashley Minor"
print("Welcome to the Aviatrix Flight System by \(plane.name)")
plane.start()

print("You're currently in \(plane.currentLocation)")

var command = ""

while command != "q" {
    print(" ")
    print("What would you like to do?")
    print("a) 📊 Check the plane gauges 🤔")
    print("b) 🛫 Fly to a different city 🥳")
    print("c) ⛽ Refuel 😵")
    print("q) ❌ Quit 😪")
    print(" ")
    print("Action: ")
    command = readLine()!
    
    if command == "a" {
        gauges(myPlane: plane)
    }
    else if command == "b" {
        fly(myPlane: plane)
    }
    else if command == "c" {
        refuel(myPlane: plane)
    }
    else if command != "q" {
        print("⚠️Please enter a valid command⚠️")
    }
}

print(" ")
print("Thanks for flying with AKM Airlines!")
