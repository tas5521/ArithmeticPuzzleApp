//
//  ContentView.swift
//  ArithmeticPuzzle
//
//  Created by 寒河江彪流 on 2023/05/15.
//

import SwiftUI

struct ContentView: View {
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
                // 「ゲームスタート」ボタンを配置
                NavigationLink {
                    // ゲーム画面に遷移
                    GameView()
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
    } // bodyここまで
} // ContnetViewここまで

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
