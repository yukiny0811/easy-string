//
//  File.swift
//  
//
//  Created by Yuki Kuwashima on 2023/10/17.
//

import Foundation

public protocol ESHasBound {
    var lowIncluded: Int { get }
    var upIncluded: Int? { get }
}

extension CountableRange<Int>: ESHasBound {
    public var lowIncluded: Int {
        lowerBound
    }
    public var upIncluded: Int? {
        Swift.max(0, upperBound - 1)
    }
}

extension CountableClosedRange<Int>: ESHasBound {
    public var lowIncluded: Int {
        lowerBound
    }
    public var upIncluded: Int? {
        upperBound
    }
}

extension PartialRangeUpTo<Int>: ESHasBound {
    public var lowIncluded: Int {
        0
    }
    public var upIncluded: Int? {
        Swift.max(0, upperBound - 1)
    }
}

extension PartialRangeThrough<Int>: ESHasBound {
    public var lowIncluded: Int {
        0
    }
    public var upIncluded: Int? {
        upperBound
    }
}

extension PartialRangeFrom<Int>: ESHasBound {
    public var lowIncluded: Int {
        lowerBound
    }
    public var upIncluded: Int? {
        nil
    }
}

public extension String {
    
    subscript(_ bounds: some ESHasBound) -> String {
        if let up = bounds.upIncluded {
            return self[bounds.lowIncluded...up]
        } else {
            return self[bounds.lowIncluded...]
        }
    }
    
}
