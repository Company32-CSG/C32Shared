//
//  Array+Hex.swift
//  C32Shared
//
//  Created by Robin Israel on 11/1/25.
//

import Foundation

public extension Array where Element: FixedWidthInteger {
	
	func hex(prefix: Bool = false, width: Int = 2, separator: String = " ") -> String {
		self.map {
			$0.formatted(.hex(prefix: prefix, width: width))
		}.joined(separator: separator)
	}
}
