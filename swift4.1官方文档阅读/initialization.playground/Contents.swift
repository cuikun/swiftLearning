//: Playground - noun: a place where people can play

import UIKit

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()
print("the default temperature is\(f.temperature)")


struct Fahrenheit1 {
    var temperature = 32.0
}

struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsisus: Double) {
        temperatureInCelsius = celsisus
    }
}

let boilingPointOfwather = Celsius(fromFahrenheit: 212.0)
let freezingPointOFWather = Celsius(fromKelvin: 273.15)
let bodyTemperature = Celsius(37)


struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
    
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

class SurveyQuestion {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask()  {
        print(text)
    }
}

let cheeseQuestion = SurveyQuestion(text: "do you like cheese?")
cheeseQuestion.ask()

cheeseQuestion.response = "YEs. I do like cheese."


class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

var item = ShoppingListItem()

class 





