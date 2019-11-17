//
//  RandomService.swift
//  easyGen-swift
//
//  Created by Sean Whitley on 11/15/19.
//  Copyright © 2019 Developed by Dubya. All rights reserved.
//

import Foundation
import Sodium

class RandomService {
    let sodium = Sodium()
    
    init() {}
    
    func getRandomInt(max: Int) -> Int {
        let result: Int = Int(sodium.randomBytes.uniform(upperBound: UInt32(max)))
        return result
    }
}
