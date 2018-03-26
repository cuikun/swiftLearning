

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

catString.count



