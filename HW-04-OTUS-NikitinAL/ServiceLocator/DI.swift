//
//  DI.swift
//  HW-04-OTUS-NikitinAL
//
//  Created by Александр Никитин on 04.04.2023.
//

import Foundation

protocol DICProtocol {
    func register<Service>(type: Service.Type, service: Any)
    func resolve<Service>(type: Service.Type) -> Service?
}

final class DIContainer: DICProtocol {
    static let shared = DIContainer()
    var services: [String: Any] = [:]
    
    func register<Service>(type: Service.Type, service: Any) {
        if services["\(type)"] == nil {
            services["\(type)"] = service
        }
    }
    
    func resolve<Service>(type: Service.Type) -> Service? {
        return services["\(type)"] as? Service
        
    }
}
