//
//  FetchDealsForStore.swift
//  HW-04-OTUS-NikitinAL
//
//  Created by Александр Никитин on 07.04.2023.
//

import Foundation
import Networking

public protocol FetchDealsForStoreProtocol {
    func fetch(forStores: String, forPageNumber pageNumber: Int, response: @escaping ([Networking.Deals]) -> Void) 
}

public final class FetchDealsForStore: FetchDealsForStoreProtocol {
    
    private var pageNumber = 1
    
    public init(){
    }
    
    public func fetch(forStores: String, forPageNumber pageNumber: Int, response: @escaping ([Networking.Deals]) -> Void) {
        Task {
            do{
                let result = try await AllDealsAPI.dealsGet(storeID: forStores, pageNumber: pageNumber, pageSize: 10, onSale: "1")
                response(result)
            } catch {
                debugPrint(error.localizedDescription)
            }
        }
    }
}
