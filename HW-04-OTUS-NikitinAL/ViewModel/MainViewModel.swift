    //
    //  MainScreen-ViewModel.swift
    //  HW-04-OTUS-NikitinAL
    //
    //  Created by Александр Никитин on 04.04.2023.
    //

import Foundation
import Networking
import SwiftUI
import ALNUI
import Combine

//@MainActor
final class MainViewModel: ObservableObject {
    
    @Published var stores: [Store] = .init()
    
    @Injected var checkIsActiveShops: CheckIsActiveShopsProtocol?
    @Injected var allStores: FetchAllStoresProtocol?
    
    var strores: AnyCancellable?
    
    init (){
        getStores()
    }
    
    func getStores(){
        allStores?.fetch { [weak self] stores in
            guard let stores = self?.checkIsActiveShops?.getOnlyActiveStore(allStores: stores) else { return }
            DispatchQueue.main.async {
                self?.stores = stores
            }
        }
    }
    
    func getVMforDeals(byStore: StoreProtocol) -> VMforDeals {
        return VMforDeals(forStore: byStore)
    }
    
    func getVMforStores () -> VMforStores {
        return VMforStores(stores: stores)
    }
    
    
    
    func getStoresImages() -> [String] {
        return stores.map { "https://www.cheapshark.com/\($0.images.banner)" }
    }
    
    func getViewModelForHorizontalView() -> SmallViewModelProtocol {
        let storesImages = stores.map { "https://www.cheapshark.com/\($0.images.banner)" }
        let smallViewModel = SmallViewModel(imagesString: storesImages)
        return smallViewModel
    }
    
}


final class SmallViewModel: SmallViewModelProtocol {
    var imagesString: [String]
    
    init(imagesString: [String]) {
        self.imagesString = imagesString
    }
    
}

protocol SmallViewModelProtocol {
    
}

protocol FetchAllStoresProtocol {
    func fetch(stores: @escaping ([Store]) -> Void)
}

class FetchAllStores: FetchAllStoresProtocol {
    var stores : [Store]?
    func fetch(stores: @escaping ([Store]) -> Void) {
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

protocol CheckIsActiveShopsProtocol {
    func getOnlyActiveStore(allStores: [Store]) -> [Store]
}

final class CheckIsActiveShops: CheckIsActiveShopsProtocol {
    
    func getOnlyActiveStore(allStores: [Store]) -> [Store] {
        var activeStores : [Store] = .init()
        for store in allStores {
            if store.isActive == 1 {
                activeStores.append(store)
            }
        }
        return activeStores
    }
    
}
