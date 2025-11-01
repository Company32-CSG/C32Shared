//
//  ByteUtils.swift
//  C32Shared
//
//  Created by Robin Israel on 9/18/22.
//

import Foundation

public extension C32 {
	
	class ByteUtils {
		public static func hexToStr(_ data: [UInt8] = [], prefix: String = "", seperator: String = " ") -> String {
			var retval = ""
			
			for (i, b) in data.enumerated() {
				retval += prefix + String(format: "%02X", b)
				
				if (i + 1 != data.endIndex) {
					retval += seperator
				}
			}
			
			return retval
		}
		
		public static func hexToStr(_ data: ArraySlice<UInt8>, prefix: String = "", seperator: String = " ") -> String {
			var retval = ""
			
			for (i, b) in data.enumerated() {
				retval += prefix + String(format: "%02X", b)
				
				if (i + 1 != data.endIndex) {
					retval += seperator
				}
			}
			
			return retval
		}
		
		public static func hexToStr(_ data: ByteBuffer, prefix: String = "", seperator: String = " ") -> String {
			var retval = ""
			
			for (i, b) in data.enumerated() {
				retval += prefix + String(format: "%02X", b)
				
				if (i + 1 != data.endIndex) {
					retval += seperator
				}
			}
			
			return retval
		}
		
		public static func hexToStr(_ data: Data, prefix: String = "", seperator: String = " ") -> String {
			var retval = ""
			
			for (i, b) in data.enumerated() {
				retval += prefix + String(format: "%02X", b)
				
				if (i + 1 != data.endIndex) {
					retval += seperator
				}
			}
			
			return retval
		}
	}
}
