//
//  DataImporter.swift
//  StatsScanner
//
//  Created by Kamran on 12/27/21.
//

import Foundation

extension String {
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}

class DataBridge {
    
    func writeData(data:String) {
        let str = data
        let url = getDocumentsDirectory().appendingPathComponent("message.txt")
        
        do {
            try str.write(to: url, atomically: true, encoding: .utf8)
            
            let input = try String(contentsOf: url)
            print(input)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    

    func readCSV(inputFile: URL, lineSeparator: String, valSeparator: String) -> [[String]] {
        //Get Data
        print("reading csv")
        var result: [[String]] = []
        do {
            let data = try String(contentsOf: inputFile)
            let rows = data.components(separatedBy: CharacterSet(charactersIn: lineSeparator))
            for row in rows {
                let columns = row.components(separatedBy: valSeparator)
                result.append(columns)
            }
            print("copying cleaned data")
            result = clean(data: result)
            return result
        } catch {
            // Any Errors will go here
            return [["ERROR: File Could Not be Found"]]
        }
    }
    
    private func clean(data: [[String]]) -> [[String]] {
        var result = data
        print("cleaning data")
        for i in 0...data.count-1 {
            for j in 0...data[i].count-1 {
                if (data[i][j].contains("\n") || data[i][j].contains("\r")) {
                    result[i][j] = data[i][j].replacingOccurrences(of: "\r", with: "")
                    result[i][j] = data[i][j].replacingOccurrences(of: "\n", with: "")
                }
            }
        }
        
        return result
    }

}