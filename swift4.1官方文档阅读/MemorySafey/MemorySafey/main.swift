//
//  main.swift
//  MemorySafey
//
//  Created by CKK on 2018/6/25.
//  Copyright © 2018年 CKK. All rights reserved.
//

import Foundation

//MARK: one

//var stepSize = 1
//
//func increment(_ number: inout Int) {
//    number += stepSize // 读取stepSize的过程在写的过程中，会发生崩溃
//}
//
//increment(&stepSize)

// 上面代码会出现崩溃

//MARK: two

//var stepSize = 1
//
//func increment(_ number: inout Int) {
//    number += stepSize
//}
//
//var copyOfStepSize = stepSize
//increment(&copyOfStepSize)

//MARK: three

func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}

struct Player {
    var name: String
    var health: Int
    var energy: Int
    
    static let maxHealth = 10
    mutating func restoreHealth() {
        health = Player.maxHealth
    }
}

var playScoreOne = 30
var playScoreTwo = 42
var copyOfPlayScoreOne = playScoreOne

balance(&playScoreOne, &playScoreTwo)
balance(&playScoreOne, &copyOfPlayScoreOne)
print(playScoreOne)

//var playerInformation = (health: 8, energy: 10)
//balance(&playerInformation.health, &playerInformation.energy)
//playerInformation

var holly = Player(name: "holly", health: 15, energy: 10)
//balance(&holly.health, &holly.energy)

func someFunc() {
    var holly = Player(name: "holly", health: 15, energy: 10)
    balance(&holly.health, &holly.energy)
}

someFunc()

func anotherFunc() {
    var playerInformation = (health: 10, energy: 20)
    balance(&playerInformation.health, &playerInformation.energy)
}
anotherFunc()

