//
//  ViewModelForStoreDeals.swift
//  HW-04-OTUS-NikitinAL
//
//  Created by Александр Никитин on 06.04.2023.
//

import Foundation
import ALNUI
import ALNServices


final class VMforStores: VMforStoreProtocol, ObservableObject {
    
    let stores: [StoreProtocol]

    internal init(stores: [StoreProtocol]) {
        self.stores = stores
    }
    
    
    
    func getImage(forStore store: StoreProtocol) -> String {
        return "https://www.cheapshark.com/\(store.imagesP.banner)"
    }
    

}

