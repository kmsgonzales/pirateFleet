//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
}

struct Mine: _Mine_ {
    let location: GridLocation
    let explosionText: String
}

class ControlCenter {
    
    func addShipsAndMines(_ human: Human) {
        let mediumShip1 = Ship(length: 3, location: GridLocation(x: 2, y:3),isVertical: true)
        human.addShipToGrid(mediumShip1)
        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 6, y:2), isVertical: true)
        human.addShipToGrid(mediumShip2)
        let smallShip = Ship(length: 2, location: GridLocation(x: 4, y:3), isVertical: true)
        human.addShipToGrid(smallShip)
        let largeShip = Ship(length: 4, location: GridLocation(x: 2, y: 7), isVertical: false)
        human.addShipToGrid(largeShip)
        let xlShip = Ship(length: 5, location: GridLocation(x:1, y: 1), isVertical: false)
        human.addShipToGrid(xlShip)
        let mine1 = Mine(location: GridLocation(x: 2, y:2), explosionText: "Oh, no! You've hit a mine! The opponent gets another turn!")
        human.addMineToGrid(mine1)
        let mine2 = Mine(location: GridLocation(x:6, y: 6), explosionText: "A mine! Your opponent has beeen rewarded an extra turn!")
        human.addMineToGrid(mine2)
    }
    
    func calculateFinalScore(_ gameStats: GameStats) -> Int {
        
    
        let enemyShips: Int = gameStats.enemyShipsRemaining * gameStats.shipBonus
        let humanShips: Int = gameStats.humanShipsSunk * gameStats.sinkBonus
        let guess: Int = (gameStats.numberOfMissesByHuman + gameStats.numberOfHitsOnEnemy) * gameStats.guessPenalty
        
        let finalScore: Int = enemyShips + humanShips - guess
        
        return finalScore
    }
}
