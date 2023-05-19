enum ArithmeticSymbols: String, CaseIterable {
    case plus
    case minus
    case multiply
    case divide
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
