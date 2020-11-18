//
//  main.swift
//  oop
//
//  Created by Ladolado3911 on 11/17/20.
//

import Foundation

struct FuelExpenses {
    var fuel_volume: Int = 0
    var fuel_needed_100km: Int = 0
}

enum Brand: CaseIterable {
    case BMW
    case Ford
    case Ferrari
    case Mercedes
    case Toyota
}



class Car {
    
    var color: String
    var door_qty: Int
    var fuel_expenses: FuelExpenses
    var brand: Brand
    
    init(_ color: String, _ door_qty: Int, _ fuel_expenses: FuelExpenses, _ brand: Brand) {
        self.color = color
        self.door_qty = door_qty
        self.fuel_expenses = fuel_expenses
        self.brand = brand
    }
}

struct Parking {
    
    var cars_themselves: Array<Car>
    
    //var count_red = 0
    //var count_green = 0
    //var count_blue = 0
    //var count_white = 0
   // var count_black = 0
    //var count_yellow = 0
    
    var colors = [0, 0, 0, 0, 0, 0]
    var dct = [Int: String]()
    

    mutating func find_max () -> String {
        for a in 0...colors.count - 1 {
            
            let test = true
            
            switch test {
            
            case a == 0:
                dct[colors[a]] = "red"
                
            case a == 1:
                dct[colors[a]] = "green"
                
            case a == 2:
                dct[colors[a]] = "blue"
                
            case a == 3:
                dct[colors[a]] = "white"
                
            case a == 4:
                dct[colors[a]] = "black"
                
            case a == 5:
                dct[colors[a]] = "yellow"
            
            default:
                print("No match")
         
            }
        }
        
        let max_color = dct.keys.max()!
        
        return "Most of the cars are \(dct[max_color]!), quantity = \(max_color)\n"
    }
    
}

var arr = [Car]()

let colors = ["red", "green", "blue", "white", "black", "yellow"]
let door_qty_combos = [2, 4]

var fuel_types = [FuelExpenses]()
var brands = (0...14).compactMap { _ in Brand.allCases.randomElement() }

for _ in 0...14 {
    var fuel = FuelExpenses()
    fuel.fuel_volume = Int.random(in: 44..<66)
    fuel.fuel_needed_100km = Int.random(in: 3..<9)
    
    let color = colors[Int.random(in: 0..<colors.count)]
    let door_qty = door_qty_combos[Int.random(in: 0..<2)]
    let brand = brands[Int.random(in: 0..<brands.count)]
    
    arr.append(Car(color, door_qty, fuel, brand))
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

var dct_of_fuel_needed = [Int: Car]()

for a in arr {
    dct_of_fuel_needed[a.fuel_expenses.fuel_needed_100km] = a

}


print("\(dct_of_fuel_needed[dct_of_fuel_needed.keys.min()!]!.brand) has the least fuel consumption per 100km - \(dct_of_fuel_needed.keys.min()!) litres")

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

var bmw = [Car]()
var ford = [Car]()
var ferrari = [Car]()
var mercedes = [Car]()
var toyota = [Car]()


for a in arr {
    
    let test = true
    
    switch test {
    
    case a.brand == Brand.BMW:
        bmw.append(a)
    
    case a.brand == Brand.Ford:
        ford.append(a)
        
    case a.brand == Brand.Ferrari:
        ferrari.append(a)
        
    case a.brand == Brand.Mercedes:
        mercedes.append(a)
        
    case a.brand == Brand.Toyota:
        toyota.append(a)
        
    default:
        print("No Match")
    }
}

print(bmw.count)
print(mercedes.count)
print(ford.count)
print(ferrari.count)
print(toyota.count)


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

var doors_2 = [Car]()
var doors_4 = [Car]()

for a in arr {
    
    let test = true
    
    switch test {
    
    case a.door_qty == 2:
        doors_2.append(a)
        
    case a.door_qty == 4:
        doors_4.append(a)
        
    default:
        print("No Match")
        
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

var max_distances = [Double: Car]()

for a in arr {
    let test = Double(a.fuel_expenses.fuel_volume) / Double(a.fuel_expenses.fuel_needed_100km)
    
    max_distances[test] = a
    
}

let max_distance_car = max_distances[max_distances.keys.max()!]

print("\n\(max_distance_car!.color) \(max_distance_car!.brand) can travel the most distance\n")

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


var parking = Parking(cars_themselves: arr)

for a in arr {
    
    let test = true
    
    switch test {
    
    case a.color == "red":
        parking.colors[0] += 1

    
    case a.color == "green":
        parking.colors[1] += 1


    case a.color == "blue":
        parking.colors[2] += 1
        
    case a.color == "white":
        parking.colors[3] += 1
        
    case a.color == "black":
        parking.colors[4] += 1
        
    case a.color == "yellow":
        parking.colors[5] += 1
        
    default:
        print("No match")
    }
}
    print(parking.find_max())

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

var dct_of_avg_fuel_consumptions = [Double: Brand]()
var arr_of_arrays_of_brands = [bmw, mercedes, ford, ferrari, toyota]


for a in arr_of_arrays_of_brands {
    
    if a.isEmpty {
        continue
    }
    
    var consumptions = [Int]()
    
    for b in a {
        consumptions.append(b.fuel_expenses.fuel_needed_100km)
    }
    
    let count = consumptions.count
    
    let average = Double(consumptions.reduce(0, +)) / Double(count)
    dct_of_avg_fuel_consumptions[average] = a[0].brand
    
}

let min_avg_consumption = dct_of_avg_fuel_consumptions.keys.min()!
let min_avg_consumption_brand = dct_of_avg_fuel_consumptions[min_avg_consumption]!

//print(dct_of_avg_fuel_consumptions)

let result = min_avg_consumption_brand

print("\(result) cars have the least average rate of fuel consumption\n")
