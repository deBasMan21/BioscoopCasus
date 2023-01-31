//
//  FileUtils.swift
//  BioscoopCasus
//
//  Created by Qiang Loozen on 31/01/2023.
//

import Foundation

class FileUtils {
    private static let path = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("Desktop")
    
    static func exportJSON<T>(_ obj: T) where T: Encodable {
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let data = try encoder.encode(obj)
            let filePath = path.appendingPathComponent("Output.json")
            if let json = String(data: data, encoding: .utf8) {
                try json.write(to: filePath, atomically: true, encoding: .utf8)
            }
        } catch let error {
            print(error)
        }
    }
    private init() {}
    
    static func exportPlainText<T>(_ obj: T) where T: CustomStringConvertible {
        do {
            let stringValue = String(describing: obj)
            let path = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("Desktop")
            let filePath = path.appendingPathComponent("Output.txt")
            try stringValue.write(to: filePath, atomically: true, encoding: .utf8)
        } catch let error {
            print(error)
        }
    }
}
