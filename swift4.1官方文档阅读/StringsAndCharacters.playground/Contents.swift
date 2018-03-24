

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










