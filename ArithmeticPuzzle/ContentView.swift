//
//  ContentView.swift
//  ArithmeticPuzzle
//
//  Created by 寒河江彪流 on 2023/05/15.
//

import SwiftUI

struct ContentView: View {
    // 問題数の変数
    @State var numberOfQuestion: Int = 10
    // QuestionMakerのインスタンスを生成
    let questionMaker = QuestionMaker()
    // 問題集を作成
    @State var questions: [Question] = QuestionMaker().makeQuestions(10)

    var body: some View {
        // ナビゲーションスタックを配置
        NavigationStack {
            // 縦方向にレイアウト
            VStack {
                Spacer()
                // タイトルを表示
                Text("四則演算パズル")
                    .font(.largeTitle)
                    .bold()
                Spacer()
                // +-×÷のイメージを配置
                VStack(spacing: 10) {
                    HStack {
                        Image(systemName: "plus")
                            .foregroundColor(Color.red)
                        Image(systemName: "minus")
                            .foregroundColor(Color.blue)
                    }
                    HStack {
                        Image(systemName: "multiply")
                            .foregroundColor(Color.green)
                        Image(systemName: "divide")
                            .foregroundColor(Color.purple)
                    }
                }
                .scaleEffect(3)
                Spacer()
                // 問題数を指定
                Text("問題数を選択してください")
                    .font(.title2)
                // 問題数を選択するPicker
                Picker(selection: $numberOfQuestion, label: Text("問題数を選択")) {
                    Text("1")
                        .tag(1)
                    Text("5")
                        .tag(5)
                    Text("10")
                        .tag(10)
                    Text("20")
                        .tag(20)
                } // Pickerここまで
                .pickerStyle(.inline)
                // 「ゲームスタート」ボタンを配置
                NavigationLink {
                    // ゲーム画面に遷移
                    GameView(questions: $questions, numberOfQuestion: $numberOfQuestion)
                } label: {
                    Text("ゲームスタート")
                        .font(.title2)
                        .bold()
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                } // NavigationLinkここまで
                Spacer()
            } // VStackここまで
        } // NavigationStackここまで
        .onChange(of: numberOfQuestion) { newValue in
            // 問題集を更新
            questions = questionMaker.makeQuestions(newValue)
        }
    } // bodyここまで
} // ContnetViewここまで

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
