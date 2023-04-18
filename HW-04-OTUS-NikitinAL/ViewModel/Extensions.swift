//
//  extensions.swift
//  HW-04-OTUS-NikitinAL
//
//  Created by Александр Никитин on 07.04.2023.
//

import Foundation
import Networking
import ALNUI


extension Store: StoreProtocol {
    public var imagesP: ALNUI.StoreImagesProtocol {
        self.images
    }
    
}

extension StoreImages: StoreImagesProtocol {
    
}

extension Deals: DealsProtocol {
    
}
