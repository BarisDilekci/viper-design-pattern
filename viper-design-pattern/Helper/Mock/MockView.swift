//
//  MockView.swift
//  viper-design-pattern
//
//  Created by Barış Dilekçi on 10.11.2024.
//

import Foundation

class MockView: AnyView {
    var presenter: AnyPresenter?
    var cryptos: [Crypto]?
    var errorMessage: String?

    func update(with cryptos: [Crypto]) {
        self.cryptos = cryptos
    }

    func update(with error: String) {
        errorMessage = error
    }
}
