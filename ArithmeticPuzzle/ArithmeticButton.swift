//
//  ArithmeticButton.swift
//  ArithmeticPuzzle
//
//  Created by 寒河江彪流 on 2023/05/15.
//

import SwiftUI

struct ArithmeticButton: View {
    // 選択されている記号を保持する変数
    @Binding var selectedArithmeticSymbol: ArithmeticSymbols?
    // 入力された記号を保持する変数
    @Binding var arithmeticSymbol: ArithmeticSymbols?
    // 正誤を格納する変数
    @Binding var correctOrWrong: Bool?
    // 問題集
    @Binding var questions: [Question]
    // 問題番号を保持する変数
    @Binding var questionNumber: Int
    // シート表示の有無
    @Binding var isShowSheet: Bool
    // 正解の音のプレイヤーのインスタンスを生成
    let correctAnswerSoundPlayer: SoundPlayer = SoundPlayer(soundName: "Quiz-Correct_Answer02-1")
    // 不正解の音のプレイヤーのインスタンスを生成
    let wrongAnswerSoundPlayer: SoundPlayer = SoundPlayer(soundName: "Quiz-Wrong_Buzzer02-1")

    var body: some View {
        Button {
            // 選択されている記号を保持する変数を入力された記号を保持する変数に渡す
            arithmeticSymbol = selectedArithmeticSymbol
            // arithmeticSymbolがnilでないか確認
            guard let _ = arithmeticSymbol else { return }
            // 正誤判定
            if checkCorrectOrWrong() {
                correctOrWrong = true
                correctAnswerSoundPlayer.soundPlay()
                // リセットし、次の問題へ
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    if questionNumber != (questions.count - 1) {
                        correctOrWrong = nil
                        arithmeticSymbol = nil
                        questionNumber += 1
                    } else {
                        isShowSheet.toggle()
                    }
                } // DispatchQueueここまで
            } else {
                correctOrWrong = false
                wrongAnswerSoundPlayer.soundPlay()
                // リセット
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    correctOrWrong = nil
                    arithmeticSymbol = nil
                } // DispatchQueueここまで
            } // 正誤判定ここまで
        } label: {
            if let arithmeticSymbol {
                Image(systemName: arithmeticSymbol.rawValue)
                    .foregroundColor(Color.black)
            } else {
                Text(" ")
            }
        }
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
                .frame(width: 50, height: 50)
        } // Buttonここまで
    } // bodyここまで

    // 正誤を判定するメソッド
    private func checkCorrectOrWrong() -> Bool {
        questions[questionNumber].answerSymbol.contains(arithmeticSymbol!)
    } // 正誤を判定するメソッドここまで

} // ArithmeticButtonここまで

struct ArithmeticButton_Previews: PreviewProvider {
    static var previews: some View {
        ArithmeticButton(selectedArithmeticSymbol: Binding.constant(.minus),
                         arithmeticSymbol: Binding.constant(.plus),
                         correctOrWrong: Binding.constant(nil),
                         questions: Binding.constant(QuestionMaker().makeQuestions(10)),
                         questionNumber: Binding.constant(0),
                         isShowSheet: Binding.constant(false))
    }
}
