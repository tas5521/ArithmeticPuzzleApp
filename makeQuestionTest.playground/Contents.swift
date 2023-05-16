enum ArithmeticSymbols: String, CaseIterable {
    case plus = "plus"
    case minus = "minus"
    case multiply = "multiply"
    case divide = "divide"
}

// メモ
// 例 2 + 2 = 4と、2 * 2 = 4 で　+と*を答えにする必要がある
// 例 4 - 2 = 2 と、　4 / 2 = 2で、/と-を答えにする

// メモ 小数点以下を取得できる
let syosu: Double = 2.0.truncatingRemainder(dividingBy: 1)

// 他の答えを探す関数
func otherAnswerSymbolCheck(number1: Int, number2: Int, answer: Int) -> [ArithmeticSymbols] {
    var symbolsArray: [ArithmeticSymbols] = []
    if number1 + number2 == answer {
        symbolsArray.append(.plus)
    }
    if number1 - number2 == answer {
        symbolsArray.append(.minus)
    }
    if number1 * number2 == answer {
        symbolsArray.append(.multiply)
    }
    if Double(number1) / Double(number2) == Double(answer) {
        symbolsArray.append(.divide)
    }
    return symbolsArray
}

// 例 2 + 2 = 4と、2 * 2 = 4 で　+と*を答えにする必要がある　チェック
let a: Int = 2
let b: Int = 2
let c: Int = 4
print(otherAnswerSymbolCheck(number1: a, number2: b, answer: c))

// 例 4 - 2 = 2 と、　4 / 2 = 2で、/と-を答えにする　チェック
let d: Int = 4
let e: Int = 2
let f: Int = 2
print(otherAnswerSymbolCheck(number1: d, number2: e, answer: f))
