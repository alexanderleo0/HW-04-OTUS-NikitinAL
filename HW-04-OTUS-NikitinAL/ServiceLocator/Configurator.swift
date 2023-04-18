//
//  Configurator.swift
//  02-HW-SwiftUI-Nikitin
//
//  Created by Александр Никитин on 01.04.2023.
//

import Foundation
import Networking
import ALNServices

class Configurator {
    static let shared = Configurator()
    let dIContainer = DIContainer.shared
    
    func setup() {
        registerServices()
    }
    
    private func registerServices() {
        dIContainer.register(type: CheckIsActiveShopsProtocol.self, service: CheckIsActiveShops())
        dIContainer.register(type: FetchAllStoresProtocol.self, service: FetchAllStores())
        dIContainer.register(type: FetchDealsForStoreProtocol.self, service: FetchDealsForStore())
    }
}
