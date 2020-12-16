//
//  Events.swift
//  Pods
//
//  Created by StarryMedia on 2020/12/16.
//

import Foundation
import HandyJSON

public class Events: HandyJSON {
    
    required public init() {
        
    }

    public var type: String = ""
    public var attributes: [Attributes] = []
}
