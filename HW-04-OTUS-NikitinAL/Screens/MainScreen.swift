    //
    //  MainScreen.swift
    //  HW-04-OTUS-NikitinAL
    //
    //  Created by Александр Никитин on 04.04.2023.
    //

import SwiftUI
import Kingfisher
import Networking
import ALNUI
import NavStack

struct MainScreen: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        NavStack{
            ALNStoreDealsView(vmForStore: viewModel.getVMforStores()){ store in
                DealsView<VMforDeals, NavLink>(viewModelVS: viewModel.getVMforDeals(byStore: store)) { deal in
                    NavLink(destination: DealCardView(deal: deal)) {
                        DealCardView(deal: deal)
                    }
                }
                
            }
        }
        
    }
    
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        let _ = Configurator.shared.setup()
        MainScreen()
            .environmentObject(MainViewModel())
    }
}

           
  
