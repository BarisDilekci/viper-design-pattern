//
//  Router.swift
//  viper-design-pattern
//
//  Created by Barış Dilekçi on 10.11.2024.
//

import Foundation
import UIKit

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entryPoint: EntryPoint? { get }
    static func startExecution() -> AnyRouter
}

class CryptoRouter: AnyRouter {
    var entryPoint: EntryPoint?
    
    static func startExecution() -> AnyRouter {
        let router = CryptoRouter()
        
        var view : AnyView = CryptoViewController()
        var presenter : AnyPresenter = CryptoPresenter()
        var insteractor : AnyInteractor = CryptoInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = insteractor
        
        insteractor.presenter = presenter
        
        
        router.entryPoint = view as? EntryPoint
        return router
    }
}
