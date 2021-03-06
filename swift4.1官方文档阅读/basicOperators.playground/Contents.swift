//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

var i = 100000000

let enterdDoorCode = false
let passedRetinaScan = true

if  enterdDoorCode && passedRetinaScan { // 逻辑与运算符
    
}
// ++i ,i++ 在swift 4.1 中不支持了
//if i = 1 + 2 {  // 赋值运算符不会返回值，预防判断相等的地方写成赋值运算符
//
//}


// 算数预算符检测值不会溢出，避免溢出造成的异常

// swift 数值计算溢出行为会被捕获并报告

//error: Execution was interrupted, reason: EXC_BAD_INSTRUCTION (code=EXC_I386_INVOP, subcode=0x0).
//The process has been left at the point where it was interrupted, use "thread return -x" to return to the state before expression evaluation.

//TODO: thread return -x 不知道是干啥的

// 问题连接：https://forums.swift.org/t/thread-return-x-what-does-it-mean/11342

/*
 It’s an LLDB command.
 
 That message is more of a follow-up message to an error, rather than an error message itself. It’s saying “hey, something went wrong, but you’re in a context where you can type LLDB commands and possibly spelunk around and debug your program’s state”.
 
 If you’re in the Swift REPL, you run that command by prefixing it with a colon, like :thread return -x.
 
 If you’re in Xcode, type that into the debug area 1.
 
 LLDB’s description of the command is helpful if you know what stack frames are; otherwise I think there’s a bit of a learning cliff here that’s going to be tricky to hurdle:
 
 :help thread return
 
 Prematurely return from a stack frame, short-circuiting execution of newer frames and optionally yielding a specified value. Defaults to the exiting the current stack frame. Expects ‘raw’ input (see help raw-input.)
 
 -x ( --from-expression ) Return from the innermost expression evaluation.
 
 */

// TODO: 学习 lldb 中的 stack frame ，这里面太多不知道的了，需要另外制定计划系统学习 。



//let j:Int8 = Int8(i * 1000000)// 每个乘数不能大于Int8 的范围

// 可以溢出的运算符 都以 & 开始

let j:Int8 = Int8.max
let k:Int8 = Int8.max &* j
//let m:Int8 = In8(128) * 128  // 每个乘数不能大于Int8 的范围

//% 可以对浮点数进行取余运算 ，这条在swift4 中已经不适用了，可以写成下面这种方式
33333.33333.truncatingRemainder(dividingBy: 3)
var trunca = 333.22222
trunca.formTruncatingRemainder(dividingBy: 2)
trunca

//let flat = 3.33333 % 0.3 // 这种写法是错误的 % is unavailable: Use truncatingRemainder instead

// 浮点数 取余改为了这种写法
let float = 3.3333.truncatingRemainder(dividingBy: 0.3)
//正数取余
let int = 3 % 2

1.1..<1.2
//1.2..<1.1 // 错误

//基础运算符，高级运算符，自定义运算符，自定义类型的运算符重载

//运算符包括一元，二元，三元运算符

//一元运算符操作一个对象，紧跟操作对象之后和之后
let bo = false
!bo

//二元运算符操作两个对象，放在两个对象之间，两边都带或者都不带空格
1+1
1 + 2
//1+ 3 //错误
//1 +3  // 错误

//三元运算符 操作对象是3个，只有一个三目运算符

bo ? j : k

//bo?j:k  错误，两两之间都得带空格


//赋值运算符

//用b的值初始化a的值
let b = 10
var a = 5
a
a = b
a
b

//元组赋值，是元素分别赋值,相当于执行了x = 3 ，y = 5

let (x, y) = (3, 5)
x
y

//if x = y {
//    // 此句错误，x = y 不返回任何值
//}


//算数运算符

// 加减乘除

// 另外加号可以拼接 String

//求余运算符

9%4
-9%4
-10%4
10 % -4 // 在符号右边为负数的时候，符号会被忽略

//8 % 2.5 // 编译器不过
8.truncatingRemainder(dividingBy: 1.01)


// 自增和自减已经取消
//var i = 0
//++i //

// 一元符号运算,中间没有空格
let three = 3
let minusThree = -three
let plusThree = -minusThree

//一元正号,只是为了负数和正数都带符号的对称美
let minusSix = -6
let alsoMinusSix = +minusThree

// 复合赋值 Compound Assignment Operators

var comp = 1
comp += 2
comp

//比较运算符

// == 等于

minusThree == three

minusThree != three

minusThree > three

minusThree < three

minusThree >= three

minusThree <= three

//alsoMinusSix === minusSix //错误， 两边都得是 AnyObject，用于判断是否为同一个对象实例
let name = "world"
if name == "world" {
    print("hello world")
} else {
    print("i'm sorry \(name), but I don't recognize you")
}

// 三目运算符 ternary conditional operator

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

// 空合运算符 nil coalescing opertator

let coal:Int8? = nil
let array = [1,2,3]

//coal ?? Int8(array[4])  // 短路效果


//逻辑非

let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}

//小心选择布尔常量有助于代码的可读性

//逻辑与
//只要任意一个false ，整个表达式就为false
// 第一个为false，就不计算第二个的结果了
// 被称为短路计算
// 空合运算符 逻辑与 都有短路计算

let enterdDoorECode = true
let passedERetinaScan = false
if enterdDoorECode && passedERetinaScan {
    print("Welcome")
}else {
    print("ACCESS DENIED")
}

//逻辑或
//两个表达式中一个为true就位true
// 也是符合 短路计算的，第一个为true ，就不会计算第二个表达式
//目前 有 空合运算符 ，逻辑与 逻辑或 有短路计算

let hasDoorKey = false
let knowOverridePassword = true
if hasDoorKey || knowOverridePassword {
    print("Welcome")
}else {
    print("ACCESS DENIED")
}


// 逻辑运算组合计算

if enterdDoorECode && passedRetinaScan || hasDoorKey {
    print("Welcome")
} else {
   print("ACCESS DENIED")
}

if (enterdDoorCode && passedRetinaScan) || hasDoorKey {
    print("Welcome")
} else {
    print("ACEESS DENIED")
}







