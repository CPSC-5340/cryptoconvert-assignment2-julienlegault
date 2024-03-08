//
//  ContentView.swift
//  Converter
//
//  Created by Julien on 3/8/24.
//

import SwiftUI

struct Converter: View {
    
    @ObservedObject var viewModel = CurrencyConverterViewModel()
    
    var body: some View {
        Text("1 USD Exchange Rate")
            .padding(EdgeInsets(top: 60, leading: 0, bottom: 0, trailing: 0))
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                ForEach(viewModel.listOfCards) { card in
                    CurrencyItem(card: card)
                        .onTapGesture {
                            viewModel.flip(card: card)
                        }
                }
            }
        }
        .onAppear {
            viewModel.fetchCards()
        }
    }
}

#Preview {
    Converter()
}
