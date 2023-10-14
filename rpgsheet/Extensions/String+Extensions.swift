//
//  String+Extensions.swift
//  rpgsheet
//
//  Created by Augusto Avelino on 13/10/23.
//

import Foundation

extension String {
    func abbreviated(_ characterCount: Int) -> String {
        let offset = max(0, min(characterCount - 1, count))
        return String(self[self.startIndex...self.index(self.startIndex, offsetBy: offset)])
    }
}
