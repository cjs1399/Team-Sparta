//
//  NSObject+.swift
//  HarryPotterBookSeries
//
//  Created by 천성우 on 3/26/25.
//

import Foundation

extension NSObject {

    var className: String {
        NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
    
    static var className: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
}
