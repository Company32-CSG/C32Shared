//
//  Array+Join.swift
//  C32Shared
//
//  Created by Robin Israel on 11/1/25.
//

import Foundation
import Testing

import C32Shared

@Test
func arrayJoin() {
	let bytes: [UInt8] = [
		0x00, 0x05, 0x08, 0x09, 0x0C
	]
	
	#expect(bytes.joined(separator: ",") == "0,5,8,9,C")
	
	#expect(bytes.joined(width: 2) == "00 05 08 09 0C")
	
	#expect(bytes.joined(prefix: true, width: 4) == "0x0000 0x0005 0x0008 0x0009 0x000C")
	
	#expect(bytes.joined(prefix: true, width: 1, separator: ", ") == "0x0, 0x5, 0x8, 0x9, 0xC")
}
