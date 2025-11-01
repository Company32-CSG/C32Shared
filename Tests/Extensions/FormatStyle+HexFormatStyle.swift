//
//  FormatStyle+HexFormatStyle.swift
//  C32Shared
//
//  Created by Robin Israel on 11/1/25.
//

import Testing

import C32Shared

@Test func HexFormatStyle() {
	let value: UInt8 = 0x1A
	
	#expect(value.formatted(.hex(width: 2)) == "1A")
	
	#expect(value.formatted(.hex(width: 3)) == "01A")
	
	#expect(value.formatted(.hex(prefix: true, width: 4)) == "0x001A")
	
	#expect(value.formatted(.hex(width: 6, uppercase: false)) == "00001a")
}
