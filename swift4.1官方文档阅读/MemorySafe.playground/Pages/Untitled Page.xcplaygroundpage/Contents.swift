import UIKit

// A write access to the memory where one is stored
var one = 1

// A read access from the memory where one is stored
print("We're number \(one)!")

func oneMore(than number: Int) -> Int{
    return number + 1
}

var myNumber = 1
myNumber = oneMore(than: myNumber)
print(myNumber)



var stepSize = 1
func incremnet(_ number: inout Int) {
    number += stepSize
}
incremnet(&stepSize)
stepSize
