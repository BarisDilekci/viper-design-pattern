//
//  viper_design_patternTests.swift
//  viper-design-patternTests
//
//  Created by Barış Dilekçi on 9.11.2024.
//

import XCTest
@testable import viper_design_pattern

final class viper_design_patternTests: XCTestCase {
    var interactor: CryptoInteractor!
    var mockPresenter: MockPresenter!
    var mockSession: MockURLSession!
    
    override func setUp() {
        super.setUp()
        mockPresenter = MockPresenter()
        mockSession = MockURLSession()
        interactor = CryptoInteractor(session: mockSession)
        interactor.presenter = mockPresenter
    }
    
    override func tearDown() {
        interactor = nil
        mockPresenter = nil
        mockSession = nil
        super.tearDown()
    }
    
    func test_download_crypto_data_failure() {
        mockSession.error = NetworkError.networkFailed
        
        interactor.downloadCryptoData()
        
        XCTAssertNotNil(mockPresenter.errorMessage)
        XCTAssertEqual(mockPresenter.errorMessage, NetworkError.networkFailed.localizedDescription)
        XCTAssertNil(mockPresenter.cryptoData)
    }
    
    func test_download_crypto_data_success() {
        let cryptoData = "[{\"currency\": \"BTC\", \"price\": \"50000\"}]".data(using: .utf8)
        mockSession.data = cryptoData
        
        interactor.downloadCryptoData()
        
        XCTAssertNotNil(mockPresenter.cryptoData)
        XCTAssertEqual(mockPresenter.cryptoData?.first?.currency, "BTC")
        XCTAssertNil(mockPresenter.errorMessage)
    }
}
