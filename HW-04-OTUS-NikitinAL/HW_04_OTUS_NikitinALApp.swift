//
//  HW_04_OTUS_NikitinALApp.swift
//  HW-04-OTUS-NikitinAL
//
//  Created by Александр Никитин on 04.04.2023.
//

import SwiftUI

@main
struct HW_04_OTUS_NikitinALApp: App {
    
    var body: some Scene {
        let _ = Configurator.shared.setup()
        WindowGroup {
            MainScreen()
                .environmentObject(MainViewModel())
        }
    }
}
