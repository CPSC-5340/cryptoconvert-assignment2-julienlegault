//
//  ContentView.swift
//  Converter
//
//  Created by Julien on 3/8/24.
//

import SwiftUI

struct Converter: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("World Currency Exchange", value: "currency")
                NavigationLink("Crypto Exchange", value: "crypto")            }
            .navigationDestination(for: String.self) { textValue in
                if textValue == "currency" {
                    CurrencyView()
                } else {
                    CryptoView()
                }
            }
             .navigationTitle("Conversion App")
        }
    }
}

#Preview {
    Converter()
}

struct CurrencyView: View {

    @ObservedObject var viewModel = CurrencyConverterViewModel()
    
    var body: some View {
        Text("1 USD Exchange Rate")
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

struct CryptoView: View {
    
    @ObservedObject var viewModel = CryptoConverterViewModel()
    
    var body: some View {
        List {
            Section {
                HStack {
                    Text("Bitcoin: ")
                    TextField("Amount", text: $viewModel.bitcoins)
                        .keyboardType(.numberPad)
                    }
                }
            Section {
                ForEach(viewModel.listOfCryptos) { card in
                    CryptoItem(card: card.cardContent)
                }
            }
        }
        .onAppear {
            viewModel.fetchCryptos()
        }
    }
}
