//
//  C32+FileSystem.swift
//  C32Shared
//
//  Created by Robin Israel on 10/21/25.
//

import Foundation

public extension C32.FileSystem {
	
	static func directoryContents(at url: URL) -> [URL] {
		let fm = FileManager.default
		
		let enumerator = fm.enumerator(
			at: url,
			includingPropertiesForKeys: [.isDirectoryKey],
			options: [.skipsHiddenFiles]
		)
		
		var ret: [URL] = []
		
		for case let url as URL in enumerator! {
			ret.append(url)
		}
		
		return ret
	}
}
