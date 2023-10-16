// The Swift Programming Language
// https://docs.swift.org/swift-book

internal extension String {
    
    subscript(bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
    
    subscript(bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }
    
    subscript(bounds: PartialRangeUpTo<Int>) -> String {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[startIndex..<end])
    }

    subscript(bounds: PartialRangeThrough<Int>) -> String {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[startIndex...end])
    }
    
    subscript(bounds: PartialRangeFrom<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        return String(self[start..<endIndex])
    }
    
}

extension String {
    public func range(_ bounds: some ESHasBound) -> Range<String.Index> {
        if let up = bounds.upIncluded {
            return index(startIndex, offsetBy: bounds.lowIncluded)..<index(startIndex, offsetBy: up+1)
        } else {
            return index(startIndex, offsetBy: bounds.lowIncluded)..<endIndex
        }
    }
}
