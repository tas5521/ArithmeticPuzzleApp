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
    // 問題集
    @State var questions: [Question] = QuestionMaker().makeQuestions(10)

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                // タイトルを表示
                Text("四則演算パズル")
                    .font(.largeTitle)
                    .bold()
                Spacer()
                // +-×÷のイメージを配置
                Image(systemName: "photo")
                Spacer()
                // 問題数を指定
                Text("問題数を選択してください")
                Picker(selection: $numberOfQuestion, label: Text("問題数を選択")) {
                    Text("1")
                        .tag(1)
                    Text("5")
                        .tag(5)
                    Text("10")
                        .tag(10)
                    Text("20")
                        .tag(20)
                }
                .pickerStyle(.inline)
                // 「ゲームスタート」ボタンを配置
                NavigationLink {
                    // ゲーム画面に遷移
                    GameView(questions: $questions)
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
            questions = questionMaker.makeQuestions(numberOfQuestion)
            print(questions)
        }
    } // bodyここまで
} // ContnetViewここまで

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
