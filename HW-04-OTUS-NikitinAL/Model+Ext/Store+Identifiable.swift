//
//  Store+Identifiable.swift
//  HW-04-OTUS-NikitinAL
//
//  Created by Александр Никитин on 05.04.2023.
//

import Foundation
import Networking

extension Store : Identifiable {
    public var id: String {
        self.storeID
    }
}
