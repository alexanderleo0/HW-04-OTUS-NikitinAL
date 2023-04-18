//
//  FetchAllStores.swift
//  HW-04-OTUS-NikitinAL
//
//  Created by Александр Никитин on 06.04.2023.
//

import Foundation
import Networking

public protocol FetchAllStoresProtocol {
    func fetch(stores: @escaping ([Store]) -> Void)
}

public class FetchAllStores: FetchAllStoresProtocol {

    var stores : [Store]?
    
    public init(){
    }
    
    public func fetch(stores: @escaping ([Store]) -> Void) {
        Task {
            do {
                let response = try await AllStoresAPI.storesGet()
                stores(response)
            } catch {
                debugPrint(error.localizedDescription)
            }
        }
    }
    
}
