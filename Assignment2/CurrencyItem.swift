//
//  Currency.swift
//  Converter
//
//  Created by Julien on 3/8/24.
//

import SwiftUI

struct CurrencyItem: View {

    var card: ConvertModel<CurrencyItemModel>
    
    var body: some View {
        if card.isFront {
            FrontCurrencyItem(card: card.cardContent)
        } else {
            BackCurrencyItem(card: card.cardContent)
        }
    }
}

#Preview {
    CurrencyItem(card: ConvertModel(cardContent: CurrencyItemModel(currencyName: "United States Dollar", currencyCode: "USD", countryFlag: "🇺🇸", multiplier: 1)))
}

struct FrontCurrencyItem: View {
    
    var card: CurrencyItemModel
    
    var body: some View {
        VStack {
            HStack {
                Text(card.countryFlag)
                    .font(.system(size: 60))
                Spacer()
            }
            HStack {
                Spacer()
                Text(card.currencyCode)
                    .foregroundColor(.white)
                    .font(.system(size: 35))
            }
        }
        .frame(width: 130, height: 130)
        .padding()
        .background(.tint)
        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
    }
}

struct BackCurrencyItem: View {
    
    var card: CurrencyItemModel
    
    var body: some View {
        VStack {
            HStack {
                Text(card.currencyName)
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                Spacer()
            }
            HStack {
                Spacer()
                Text(String(card.multiplier))
                    .foregroundColor(.white)
                    .font(.system(size: 25))
            }
        }
        .frame(width: 130, height: 130)
        .padding()
        .background(.tint)
        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
    }
}

