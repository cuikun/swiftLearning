//: Playground - noun: a place where people can play

import UIKit

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
threeTimesTable[6]

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
           assert(indexIsValid(row: row, column: column), "index out of range")
           return grid[row * column + column]
        }
        set {
           assert(indexIsValid(row: row, column: column), "index out of range")
            return grid[row * column + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix.grid
matrix[2,2]
