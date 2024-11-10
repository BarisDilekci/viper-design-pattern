//
//  MockPresenter.swift
//  viper-design-pattern
//
//  Created by Barış Dilekçi on 10.11.2024.
//

import Foundation

class MockPresenter: AnyPresenter {
    var router: AnyRouter?
    var interactor: AnyInteractor?
    var view: AnyView?

    var cryptoData: [Crypto]?
    var errorMessage: String?

    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) {
        switch result {
        case .success(let cryptos):
            cryptoData = cryptos
        case .failure(let error):
            errorMessage = error.localizedDescription
        }
    }
}
