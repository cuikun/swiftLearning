

//String 是 有序的character类型的值的集合
// 字符串连接 +
// 其中每个字符都是 Unicode 独立编码，可以用不同的 Unicode representation 访问
// String 可以和 NSSting 无缝桥接

// String Literals

//用 String literal 初始化

let someString = "Some string literal value"


// Mutiline String Literals

let qutation = """
the White Rabbit put on his spectacles."where shall I begin,
please your Majesty?" he asked.
"begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop"
"""
print(qutation)

let singleLineString = "these are the same"
let mutilineString = """
these are the same
"""
// \ 可以使代码更易读，代码中换行，实际并不换行
let softWrappedQuotation = """
The White Rabbit put on his spectacles. "Where shall I begin, \
please you Majesty?" he asked.

"Begin at the beginning" the King said gravely, "and go on\
till you come to the end; then stop"
"""
print(softWrappedQuotation)

// 空行就可以表示\n
let lineBreaks = """

This string starts with a line break.
It also end with a line break.

"""
print(lineBreaks)

// 缩进以close quotation 为准。
let linesWithIndentation = """
    This line doesn't begin with whitespace.
        this line begins with four spaces.
    this line does't begin with whitespace.
    """
print(linesWithIndentation)


//String literal 包含以下特殊字符

"\0" // 空字符
"\\" // 反斜线
"\t" // 水平制表符
"\n" // line feed 换行符
"\r" // 回车符
"\"" // 双引号
"\'" // 单引号

//Unicode 标量 \u{n} n为16进制数 1到8位

let wiseWords = "\"我是要成为海贼王的男人\" - 路飞"
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1f496}"

let threeDoubleQuotationMarks = """
Escaping the first qutation mark \"""
Escaping all three qutation mark \"\"\"
"""
print(threeDoubleQuotationMarks)


// Inialzing an Empty String

var emptyString = "" //empty string literal


if emptyString.isEmpty {
    print("Noting is here")
}

var variableString = "horse"
variableString += " and carriage"

let constantString = "Highlander"
//constantString += "and another Highlander" // this reports complie-time error - a constant string connot be modified


// Strings Are value types

// 在创建，传递给函数，赋值给一个变量或者常量的时候都会发生拷贝。
// 这样可以保证传递过来的值，不管来自哪，你都可以很确信的认为这个字符串不会被修改，除非你自己要修改它
// 在这种情况下，编译会优化实际发生拷贝的情况，只有需要的时候才会发生拷贝

// TODO： 什么时候才是编译器认为需要的发生拷贝的时候？

// https://forums.swift.org/t/about-the-swift-string-copy-when-takes-place/11341
"""
This may help you. From here 1(https://developer.apple.com/documentation/swift/string)

Performance Optimizations
Although strings in Swift have value semantics, strings use a copy-on-write strategy to store their data in a buffer. This buffer can then be shared by different copies of a string. A string’s data is only copied lazily, upon mutation, when more than one string instance is using the same buffer. Therefore, the first in any sequence of mutating operations may cost O(n) time and space.

When a string’s contiguous storage fills up, a new buffer must be allocated and data must be moved to the new storage. String buffers use an exponential growth strategy that makes appending to a string a constant time operation when averaged over many append operations.
"""

/*
 性能优化
 虽然Swift中的字符串具有值语义，但字符串使用写入时复制策略将其数据存储在缓冲区中。 这个缓冲区可以被一个字符串的不同副本共享。 当多个字符串实例使用相同的缓冲区时，字符串的数据只会在变化时被懒惰地复制。 因此，任何序列的变异操作中的第一个可能花费O（n）时间和空间。
 
 当一个字符串的连续存储填满时，必须分配一个新的缓冲区，并且必须将数据移动到新的存储区。 字符串缓冲区使用指数增长策略，当通过许多附加操作进行平均时，可以将字符串追加到常量时间操作。
 
 */



for character in "Dog!🐶" {
    print(character)
}

// https://forums.swift.org/t/how-do-you-type-a-character-like/11343
// cmd + ctrl + space 组合键 可以调出输入表情的键盘

//let exclamationMark: Character = "!"


let catCharaters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharaters)
print(catString)


// concatenating Strings and characters

let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

var instructon = "look over"
instructon += string2

let exclamationMark: Character = "!"
welcome.append(exclamationMark)

let badStart = """
one
two
"""

let end = """
three
"""
print(badStart + end)

let goodStart = """
one
two

"""
print(goodStart + end)

//String Interrpolation (字符串插入）

let mutiplier = 3
let message = "\(mutiplier) times 2.5 is \(Double(mutiplier) * 2.5)"

for item in catString.utf16 {
    print(item)
}
print("----------")
for item in catString.utf8 {
    print(item)
}
print("----------")
for item in catString.unicodeScalars {
    print(item)
}
print("----------")

for item in catString {
    print(item)
}
print("----------")

catString.count

catString.uppercased()


// 字符串相等

let quotation = "we are the same"
let sameQuotation = "we are the same"
if quotation == sameQuotation {
    print("this two word are equal")
}

let romeoAndJuliet = [
    "Act 1 Scene 1: verrona,A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room outsite Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        act1SceneCount += 1
    }
}
act1SceneCount

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell"){
        cellCount += 1
    }
}
mansionCount
cellCount

let normal = "Could you help me,please"
let shouty = normal.uppercased()

let whispered = normal.lowercased()


// Counting Characters

let unusualMenager = "koala 🐨, Snail 🐌, penguin 🐧, Dromedary 🐪"

unusualMenager.count

var word = "cafe"
word.count

word += "\u{301}"

word

word.count

"\u{0061}"//.count

"\u{1f425}"//.count


// 扩展字形集

let eAcute:Character = "\u{e9}"
let combineEAcute:Character = "\u{65}\u{301}"

let precomposed:Character = "\u{d55c}"
let decomposed:Character = "\u{1112}\u{1161}\u{11ab}"


let enclosedEAcute: Character = "\u{e9}\u{20dd}"
let encosedBabyChick: Character = "\u{1f425}\u{20dd}"
let regionalIndicatorForUS: Character = "\u{1f1fa}\u{1f1f8}"


// 不同字符 和 相同字符的不同表示 所占用的内存大小是不同的， 调用 swfit 中 String 的count 属性是需要遍历整个字符串的。
// NSString 的长度是和 String 的 UTF16 的长度相等





