//
//  ArithmeticButton.swift
//  ArithmeticPuzzle
//
//  Created by 寒河江彪流 on 2023/05/15.
//

import SwiftUI

struct ArithmeticButton: View {
    @Binding var selectedArithmeticSymbol: ArithmeticSymbols?
    @State var arithmeticSymbol: ArithmeticSymbols?

    var body: some View {
        Button {
            arithmeticSymbol = selectedArithmeticSymbol
        } label: {
            if let arithmeticSymbol {
                Image(systemName: arithmeticSymbol.rawValue)
                    .foregroundColor(Color.black)
            } else {
                Text(" ")
            }
        } // Buttonここまで
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
                .frame(width: 50, height: 50)
        }
    } // bodyここまで
} // ArithmeticButtonここまで

struct ArithmeticButton_Previews: PreviewProvider {
    static var previews: some View {
        ArithmeticButton(selectedArithmeticSymbol: Binding.constant(.minus))
    }
}
