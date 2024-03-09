//
//  CryptoItem.swift
//  Assignment2
//
//  Created by Julien on 3/8/24.
//

import SwiftUI

struct CryptoItem: View {
    
    var card: CryptoItemModel
    
    var body: some View {
        HStack {
            Text(card.cryptoName)
            Spacer()
            Text(String(card.multiplier))
        }
    }
}

#Preview {
    CryptoItem(card: CryptoItemModel(cryptoName: "US Dollar", cryptoCode: "USD", multiplier: 23450))
}
