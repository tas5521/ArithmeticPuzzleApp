//
//  GameView.swift
//  ArithmeticPuzzle
//
//  Created by 寒河江彪流 on 2023/05/15.
//

import SwiftUI

struct GameView: View {
    // 選択されている記号を保持する変数
    @State var selectedArithmeticSymbol: ArithmeticSymbols?
    // 問題番号を保持する変数
    @State var questionNumber: Int = 0
    // 問題集
    @Binding var questions: [Question]
    // 問題数の変数
    //    @Binding var numberOfQuestion: Int
    // 「back」ボタンを「戻る」に変更するために使用する環境変数
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        // 縦方向にレイアウト
        VStack {
            // 問題番号
            Text("第\(questionNumber+1)問")
                .font(.largeTitle)
                .bold()
            Spacer()
            // 水平方向にレイアウト
            HStack(spacing: 25) {
                Text("\(questions[questionNumber].leftNumber)")
                ArithmeticButton(selectedArithmeticSymbol: $selectedArithmeticSymbol)
                Text("\(questions[questionNumber].rightNumber)")
                Text("=")
                Text("\(questions[questionNumber].answer)")
            } // HStackここまで
            .font(.largeTitle)
            Spacer()
            // 記号選択ボタンを配置
            ArithmeticSymbolSelectButtons(selectedArithmeticSymbol: $selectedArithmeticSymbol)
                .scaleEffect(2)
            Spacer()
        } // VStackここまで
        // 「back」ボタンを「戻る」に変更
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 17, weight: .medium))
                        Text("戻る")
                    } // HStackここまで
                } // Buttonここまで
            } // ToolbarItemここまで
        } // .toolbarここまで
    } // bodyここまで
} // GameViewここまで

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(questions: Binding.constant(QuestionMaker().makeQuestions(10)))
    }
}
