//
//  SummaryStateStorage.swift
//  HarryPotterBookSeries
//
//  Created by 천성우 on 4/1/25.
//

import Foundation

enum SummaryStateStorage {
    private static func key(for index: Int) -> String {
        return "isSummaryExpanded_\(index)"
    }

    static func isExpanded(for index: Int) -> Bool {
        return UserDefaults.standard.bool(forKey: key(for: index))
    }

    static func setExpanded(_ value: Bool, for index: Int) {
        UserDefaults.standard.set(value, forKey: key(for: index))
    }
}
