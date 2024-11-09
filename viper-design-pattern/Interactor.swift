//
//  Interactor.swift
//  viper-design-pattern
//
//  Created by Barış Dilekçi on 10.11.2024.
//

import Foundation

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }
    
    func downloadCryptoData()
    
}

final class CryptoInteractor: AnyInteractor {
    var presenter: (any AnyPresenter)?
    
    func downloadCryptoData() {
               guard let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/IA32-CryptoComposeData/main/cryptolist.json")
               else {
                   return
               }
               
               let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                   guard let data = data, error == nil else {
                       self?.presenter?.interactorDidDownloadCrypto(result: .failure(NetworkError.networkFailed))
                       return
                   }
                   
                   do {
                       let cryptos = try JSONDecoder().decode([Crypto].self,from: data)
                       self?.presenter?.interactorDidDownloadCrypto(result: .success(cryptos))
                   } catch {
                       self?.presenter?.interactorDidDownloadCrypto(result: .failure(NetworkError.parsingFailed))
                   }
               }
               task.resume()            
        }
    }
    
