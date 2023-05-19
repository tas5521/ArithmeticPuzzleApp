//
//  QuestionMaker.swift
//  ArithmeticPuzzle
//
//  Created by 寒河江彪流 on 2023/05/16.
//

import Foundation

struct Question {
    let leftNumber: Int
    let rightNumber: Int
    let answer: Int
    let answerSymbol: [ArithmeticSymbols]
} // Questionここまで

struct QuestionMaker {
    // 問題を作るメソッド
    private func makeQuestion() -> Question? {
        let symbol: ArithmeticSymbols = ArithmeticSymbols.allCases.randomElement()!
        let number1: Int = Int.random(in: 0...9)
        let number2: Int = Int.random(in: 0...9)
        var question: Question?
        switch symbol {
        case .plus:
            let answer: Int = number1 + number2
            let answerSymbolCheckResult: [ArithmeticSymbols] =
                otherAnswerSymbolCheck(number1: number1, number2: number2, answer: answer)
            question = Question(leftNumber: number1,
                                rightNumber: number2,
                                answer: answer,
                                answerSymbol: answerSymbolCheckResult)
        case .minus:
            let answer: Int = number1 - number2
            if answer >= 0 {
                let answerSymbolCheckResult: [ArithmeticSymbols] =
                    otherAnswerSymbolCheck(number1: number1, number2: number2, answer: answer)
                question = Question(leftNumber: number1, rightNumber: number2,
                                    answer: answer, answerSymbol: answerSymbolCheckResult)
            } else {
                let answerSymbolCheckResult: [ArithmeticSymbols] =
                    otherAnswerSymbolCheck(number1: number2, number2: number1, answer: -answer)
                question = Question(leftNumber: number2, rightNumber: number1,
                                    answer: -answer, answerSymbol: answerSymbolCheckResult)
            }
        case .multiply:
            let answer: Int = number1 * number2
            let answerSymbolCheckResult: [ArithmeticSymbols] =
                otherAnswerSymbolCheck(number1: number1, number2: number2, answer: answer)
            question =
                Question(leftNumber: number1,
                         rightNumber: number2,
                         answer: answer,
                         answerSymbol: answerSymbolCheckResult)
        case .divide:
            if number2 != 0 {
                if (Double(number1) / Double(number2)).truncatingRemainder(dividingBy: 1) == 0 {
                    let answer: Int = Int(Double(number1) / Double(number2))
                    let answerSymbolCheckResult: [ArithmeticSymbols] =
                        otherAnswerSymbolCheck(number1: number1, number2: number2, answer: answer)
                    question = Question(leftNumber: number1, rightNumber: number2,
                                        answer: answer, answerSymbol: answerSymbolCheckResult)
                } // 小数点以下チェックここまで
            } // ゼロ除算チェックここまで
        } // switchここまで
        return question
    } // makeQuestionここまで

    // 問題集を作るメソッド
    func makeQuestions(_ numberOfQuestion: Int) -> [Question] {
        var questions: [Question] = []
        repeat {
            if let question = makeQuestion() {
                questions.append(question)
            }
        } while questions.count != numberOfQuestion
        return questions
    }

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
    } // 他の答えを探す関数ここまで
} // QuestionMaker
