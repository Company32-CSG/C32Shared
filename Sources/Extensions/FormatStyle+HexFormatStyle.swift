//
//  FormatStyle+HexFormatStyle.swift
//  C32Shared
//
//  Created by Robin Israel on 11/1/25.
//

import Foundation

public struct HexFormatStyle<Value: BinaryInteger>: FormatStyle {
	let prefix: Bool
	let width: Int?
	let uppercase: Bool
	
	public init(prefix: Bool = false, width: Int? = nil, uppercase: Bool = true) {
		self.prefix = prefix
		self.width = width
		self.uppercase = uppercase
	}
	
	public func format(_ value: Value) -> String {
		var formatted = String(value, radix: 16, uppercase: uppercase)
		
		if let width, formatted.count < width {
			formatted = String(repeating: "0", count: width - formatted.count) + formatted
		}
		
		return (prefix ? "0x" : "") + formatted
	}
}

extension FormatStyle {
	
	public static func hex<Value>(prefix: Bool = false, width: Int? = nil, uppercase: Bool = true) -> Self where Self == HexFormatStyle<Value>, Value : BinaryInteger {
		HexFormatStyle<Value>(prefix: prefix, width: width, uppercase: uppercase)
	}
	
}
