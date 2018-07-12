//
//  main.swift
//  AdvancedOprators
//
//  Created by CKK on 2018/6/28.
//  Copyright © 2018年 CKK. All rights reserved.
//

import Foundation

struct Vector2D {
    var x = 0.0, y = 0.0
}

extension Vector2D: Equatable {
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
}

let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)

if twoThree != anotherTwoThree {
    print("these two vectors are not equivalent")
} else {
    print("these two vectors are equivalent")
}

