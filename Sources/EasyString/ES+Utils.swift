//
//  File.swift
//  
//
//  Created by Yuki Kuwashima on 2023/10/17.
//

import Foundation

public extension String {
    
    mutating func replace(_ esrange: some ESHasBound, with str: String) {
        replaceSubrange(range(esrange), with: str)
    }
    
    mutating func lowercase(_ esrange: some ESHasBound) {
        let allLowered = self.lowercased()
        replace(esrange, with: allLowered[esrange])
    }
    
    mutating func uppercase(_ esrange: some ESHasBound) {
        let allUppered = self.uppercased()
        replace(esrange, with: allUppered[esrange])
    }
    
    func contains(_ substring: String) -> Bool {
        range(of: substring) != nil
    }
    
    func contains(_ substring: String, in esrange: ESHasBound) -> Bool {
        range(of: substring, range: range(esrange)) != nil
    }
    
    mutating func deleteFirst() {
        self = self[1..<count]
    }
    
    mutating func deleteLast() {
        self = self[0..<count-1]
    }
    
    mutating func removeWhitespace() {
        self = self.replacingOccurrences(of: " ", with: "")
        self = self.replacingOccurrences(of: "　", with: "")
    }
    
    mutating func removeNewLine() {
        self = self.replacingOccurrences(of: "\n", with: "")
    }
}
