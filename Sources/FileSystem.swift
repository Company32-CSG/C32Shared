//
//  C32+FileSystem.swift
//  C32Shared
//
//  Created by Robin Israel on 10/21/25.
//

import Foundation

public extension C32 {
	enum FileSystem {}
}

// MARK: - Directory

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

// MARK: - File Access

public extension C32.FileSystem {
	static func readJsonFromBundle<T>(filename: String) throws -> T where T : Decodable {
		let name = (filename as NSString).deletingPathExtension
		let ext = (filename as NSString).pathExtension
		
		guard let url = Bundle.main.url(forResource: name, withExtension: ext) else {
			throw CocoaError(.fileNoSuchFile)
		}
		
		let fileContents = try Data(contentsOf: url)
		
		return try JSONDecoder().decode(T.self, from: fileContents)
	}

	static func readJson<T>(from url: URL) throws -> T where T : Decodable {
		let fm = FileManager.default
		
		guard let fileContents = fm.contents(atPath: url.path()) else {
			throw CocoaError(.fileReadUnknown)
		}
		
		return try JSONDecoder().decode(T.self, from: fileContents)
	}
	
	static func writeJson<T>(to url: URL, content: T) throws where T : Encodable {
		let data = try JSONEncoder().encode(content)
		
		try data.write(to: url)
	}
}
