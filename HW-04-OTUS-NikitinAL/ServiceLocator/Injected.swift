    //
    //  Injected.swift
    //  HW-04-OTUS-NikitinAL
    //
    //  Created by Александр Никитин on 04.04.2023.
    //


@propertyWrapper
struct Injected<T> {
    
    private var service: T?
    private weak var diContainer = DIContainer.shared
    
    public var wrappedValue: T? {
        mutating get {
            if service == nil {
                service = diContainer?.resolve(type: T.self)
            }
            return service
        }
        mutating set {
            service = newValue 
        }
    }
}
