//
//  Presenter.swift
//  viper-design-pattern
//
//  Created by Barış Dilekçi on 10.11.2024.
//

import Foundation

enum NetworkError : Error {
    case networkFailed
    case parsingFailed
}


protocol AnyPresenter {
    var router : AnyRouter? { get set }
    var interactor : AnyInteractor? { get set }
    var view : AnyView? { get set }
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>)

}

final class Presenter : AnyPresenter {
    var router: AnyRouter?
    
    var interactor: AnyInteractor?
    
    var view: AnyView?
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], any Error>) {
        switch result {
        case .success(let success):
            //update view
            print("update")
        case .failure(let failure):
            //error message
            print("error")
        }
    }
}
