//
//  ConverterViewModel.swift
//  Converter
//
//  Created by Julien on 3/8/24.
//

import Foundation

class CryptoConverterViewModel: ObservableObject {
    
    @Published private(set) var listOfCryptos = [ConvertModel<CryptoItemModel>]()
    var bitcoins: String = "1" {
        didSet {
            fetchCryptos()
        }
    }
    
    func fetchCryptos() {
        if let doubleBitcoins = Double(bitcoins) {
            self.listOfCryptos = [
                ConvertModel(cardContent: CryptoItemModel(cryptoName: "US Dollar", cryptoCode: "USD", multiplier: 23450 * doubleBitcoins)),
                ConvertModel(cardContent: CryptoItemModel(cryptoName: "Ethereum", cryptoCode: "ETH", multiplier: 14.3 * doubleBitcoins)),
                ConvertModel(cardContent: CryptoItemModel(cryptoName: "Tether", cryptoCode: "THR", multiplier: 23450 * doubleBitcoins)),
                ConvertModel(cardContent: CryptoItemModel(cryptoName: "BNB", cryptoCode: "BNB", multiplier: 77.2 * doubleBitcoins)),
                ConvertModel(cardContent: CryptoItemModel(cryptoName: "USD Coin", cryptoCode: "USC", multiplier: 23454 * doubleBitcoins)),
                ConvertModel(cardContent: CryptoItemModel(cryptoName: "XRP", cryptoCode: "XRP", multiplier: 62113 * doubleBitcoins)),
            ]
        }
    }
}
