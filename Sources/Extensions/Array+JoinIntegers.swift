//
//  Array+JoinIntegers.swift
//  C32Shared
//
//  Created by Robin Israel on 11/1/25.
//

import Foundation

public extension Array where Element: FixedWidthInteger {
	
	func joined(prefix: Bool = false, width: Int? = nil, separator: String = " ") -> String {
		self.map {
			$0.formatted(.hex(prefix: prefix, width: width))
		}.joined(separator: separator)
	}
}
