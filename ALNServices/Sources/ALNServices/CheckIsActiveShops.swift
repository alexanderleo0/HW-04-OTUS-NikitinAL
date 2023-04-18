//
//  CheckIsActiveShops.swift
//  HW-04-OTUS-NikitinAL
//
//  Created by Александр Никитин on 06.04.2023.
//

import Foundation
import Networking

public protocol CheckIsActiveShopsProtocol {
    func getOnlyActiveStore(allStores: [Store]) -> [Store]
}

public final class CheckIsActiveShops: CheckIsActiveShopsProtocol {
    
    public init() {
        
    }
    
    public func getOnlyActiveStore(allStores: [Store]) -> [Store] {
        var activeStores : [Store] = .init()
        for store in allStores {
            if store.isActive == 1 {
                activeStores.append(store)
            }
        }
        return activeStores
    }
    
}
