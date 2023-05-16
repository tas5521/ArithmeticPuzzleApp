//
//  ArithmeticSymbolSelectButtons.swift
//  ArithmeticPuzzle
//
//  Created by 寒河江彪流 on 2023/05/15.
//

import SwiftUI

struct ArithmeticSymbolSelectButtons: View {
    // 選択されている記号を保持する変数
    @Binding var selectedArithmeticSymbol: ArithmeticSymbols?
    @State var plusButtonColor: Bool = false
    @State var minusButtonColor: Bool = false
    @State var multiplyButtonColor: Bool = false
    @State var divideButtonColor: Bool = false

    var body: some View {
        HStack(spacing: 20) {
            // 「プラス」Button
            Button {
                changeButtonColor(ArithmeticSymbols.plus)
                selectedArithmeticSymbol = .plus
            } label: {
                Image(systemName: "plus")
                    .foregroundColor(plusButtonColor ? Color.red : Color.black)
            } // Buttonここまで
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(plusButtonColor ? Color.red : Color.black, lineWidth: 1)
                    .frame(width: 25, height: 25)
            } // 「プラス」Buttonここまで

            // 「マイナス」Button
            Button {
                changeButtonColor(ArithmeticSymbols.minus)
                selectedArithmeticSymbol = .minus
            } label: {
                Image(systemName: "minus")
                    .foregroundColor(minusButtonColor ? Color.red : Color.black)
            } // Buttonここまで
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(minusButtonColor ? Color.red : Color.black, lineWidth: 1)
                    .frame(width: 25, height: 25)
            } // 「マイナス」Buttonここまで

            // 「かける」Button
            Button {
                changeButtonColor(ArithmeticSymbols.multiply)
                selectedArithmeticSymbol = .multiply
            } label: {
                Image(systemName: "multiply")
                    .foregroundColor(multiplyButtonColor ? Color.red : Color.black)
            } // Buttonここまで
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(multiplyButtonColor ? Color.red : Color.black, lineWidth: 1)
                    .frame(width: 25, height: 25)
            } // 「かける」Buttonここまで

            // 「わる」Button
            Button {
                changeButtonColor(ArithmeticSymbols.divide)
                selectedArithmeticSymbol = .divide
            } label: {
                Image(systemName: "divide")
                    .foregroundColor(divideButtonColor ? Color.red : Color.black)
            } // Buttonここまで
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(divideButtonColor ? Color.red : Color.black, lineWidth: 1)
                    .frame(width: 25, height: 25)
            } // 「わる」Buttonここまで

        } // HStackここまで
    } // bodyここまで

    // 選択されたボタンの色を変える関数
    func changeButtonColor(_ selected: ArithmeticSymbols) {
        plusButtonColor = false
        minusButtonColor = false
        multiplyButtonColor = false
        divideButtonColor = false

        switch selected {
        case .plus: plusButtonColor.toggle()
        case .minus: minusButtonColor.toggle()
        case .multiply: multiplyButtonColor.toggle()
        case .divide: divideButtonColor.toggle()
        }
    }
} // ArithmeticSymbolSelectButtonsここまで

struct ArithmeticSymbolSelectButtons_Previews: PreviewProvider {
    static var previews: some View {
        ArithmeticSymbolSelectButtons(selectedArithmeticSymbol: Binding.constant(.plus))
    }
}
