//
//  DataImporter.swift
//  StatsScanner
//
//  Created by Kamran on 12/27/21.
//

import Foundation
import UIKit

extension String {
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}

class DataBridge {
    
    func writeData(data:String, fileName: String) {
        let str = data
        let url = DataBridge.getDocumentsDirectory().appendingPathComponent(fileName + ".csv")
        
        do {
            try str.write(to: url, atomically: true, encoding: .utf8)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    public static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    

    func readCSV(fileName: String, lineSeparator: String = "\n", valSeparator: String = ",") throws -> [[String]] {
        let url = DataBridge.getDocumentsDirectory().appendingPathComponent(fileName)
        
        //Get Data
        var result: [[String]] = []
        let data = try String(contentsOf: url)
        let rows = data.components(separatedBy: CharacterSet(charactersIn: lineSeparator))
        
        for row in rows {
            //check for quotations and ignore commas in quotations
            let columns = row.components(separatedBy: valSeparator)
            result.append(columns)
        }
        
        try result = cleanCSVData(data: result)
        return result
    }
    
    // MARK: USED METHOD
    func readCSV(inputFile: URL, lineSeparator: String = "\n", valSeparator: String = ",") throws -> [[String]] {
        //Get Data
        
        var result: [[String]] = []
        let data = try String(contentsOf: inputFile)
        print(data)
        let rows = data.components(separatedBy: CharacterSet(charactersIn: lineSeparator))
        
        for row in rows {
            let columns = row.components(separatedBy: valSeparator)
            result.append(columns)
        }
        
        try result = cleanCSVData(data: result)
        return result
    }
    
    func writeCSV(fileName:String, data:[[String]]) {
        let url = DataBridge.getDocumentsDirectory().appendingPathComponent(fileName)
        
        var stringData = ""
        for i in 1...data.count-1 {
            for j in 0...data[i].count-1 {
                stringData += data[i][j]
                if(j != data[i].count-1) {
                    stringData += ","
                }
            }
            stringData += "\n"
        }
        do {
            try stringData.write(to: url, atomically: true, encoding: .utf8)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func cleanCSVData(data: [[String]]) throws -> [[String]] {
        var result = [[String]](repeating: [String](repeating: "", count: data[0].count), count: data.count)
        
        for i in 0...data.count-1 {
            for j in 0...data[i].count-1 {
                if(data[i].count > data[0].count) {
                    throw FileIOError.CorruptedFile
                }
                result[i][j] = data[i][j].replacingOccurrences(of: "\r", with: "")
            }
        }
        
        for i in 0...result.count-1 {
            if(result[i].isEmpty) {
                result.remove(at: i)
            }
        }
        return result
    }

}
