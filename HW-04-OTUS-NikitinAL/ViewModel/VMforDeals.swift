//
//  VMforDeals.swift
//  HW-04-OTUS-NikitinAL
//
//  Created by Александр Никитин on 07.04.2023.
//

import SwiftUI
import ALNUI
import Networking
import ALNServices

final class VMforDeals: VMforDealsProtocol, ObservableObject {
    let id = UUID().uuidString
    @Injected var dealsForStore: FetchDealsForStoreProtocol?
    
    @Published var deals: [DealsProtocol] = []
    private var pageNumber = 1
    private var store: StoreProtocol
    
    init(forStore store: StoreProtocol){
        print("Create VM for store: \(store.storeName) with id:\(id)")
        self.store = store
    }
    
    deinit {
        print("Destroy VM for store \(id)")
    }
    
    func fetchDeals () {

        dealsForStore?.fetch(forStores: store.storeID, forPageNumber: pageNumber, response: { [weak self] deals in
            DispatchQueue.main.async {
                self?.deals = deals
            }
        })
    }
    
}
