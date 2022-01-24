//
//  Dataset Tester.swift
//  StatsScannerTests
//
//  Created by Kamran Hussain on 1/21/22.
//

import XCTest
@testable import StatsScanner

class DatasetTester: XCTestCase {
    
    private var arr = [[String]]()
    private var arr2 = [[String]]()
    private let db = DataBridge()

    override func setUpWithError() throws {
        arr = [["id", "num_awards", "prog", "math"], ["45", "1", "3", "41"], ["108", "1", "1", "41"], ["15", "1", "3", "44"], ["67", "1", "3", "42"], ["153", "1", "3", "40"], ["51", "1", "1", "42"], ["164", "1", "3", "46"], ["133", "1", "3", "40"], ["2", "1", "3", "33"], ["53", "1", "3", "46"], ["1", "1", "3", "40"], ["128", "0", "2", "38"], ["16", "1", "3", "44"], ["106", "1", "3", "37"], ["89", "1", "3", "40"], ["134", "1", "1", "39"], ["19", "1", "1", "43"], ["145", "0", "3", "38"], ["11", "1", "2", "45"], ["117", "0", "3", "39"], ["109", "1", "1", "42"], ["12", "1", "3", "45"], ["37", "1", "3", "40"], ["69", "0", "3", "40"], ["43", "1", "2", "43"], ["196", "1", "2", "49"], ["36", "1", "1", "44"], ["155", "1", "1", "46"], ["6", "0", "2", "46"], ["4", "1", "2", "41"], ["25", "0", "1", "42"], ["107", "0", "3", "47"], ["5", "1", "2", "43"], ["47", "1", "2", "49"], ["140", "1", "3", "40"], ["22", "1", "3", "39"], ["18", "1", "3", "49"], ["30", "0", "2", "42"], ["40", "0", "1", "43"], ["176", "0", "2", "41"], ["126", "0", "1", "57"], ["197", "0", "2", "50"], ["46", "0", "2", "44"], ["49", "0", "3", "39"], ["8", "0", "2", "52"], ["124", "1", "3", "41"], ["13", "0", "3", "39"], ["111", "0", "1", "39"], ["142", "0", "3", "52"], ["193", "1", "2", "48"], ["105", "3", "2", "45"], ["58", "2", "3", "40"], ["129", "3", "1", "46"], ["38", "3", "2", "50"], ["182", "0", "2", "43"], ["115", "0", "1", "43"], ["14", "1", "2", "54"], ["175", "1", "1", "42"], ["44", "2", "3", "45"], ["86", "2", "1", "54"], ["72", "3", "3", "47"], ["41", "1", "2", "45"], ["191", "0", "2", "43"], ["138", "1", "3", "40"], ["9", "0", "3", "52"], ["151", "1", "3", "52"], ["119", "0", "1", "45"], ["55", "1", "2", "49"], ["73", "1", "2", "53"], ["28", "0", "1", "54"], ["90", "2", "2", "50"], ["17", "0", "2", "48"], ["102", "0", "2", "51"], ["70", "0", "1", "41"], ["148", "1", "3", "51"], ["54", "0", "1", "46"], ["42", "0", "3", "55"], ["87", "0", "1", "46"], ["21", "2", "1", "61"], ["181", "1", "2", "45"], ["165", "1", "3", "54"], ["78", "1", "2", "54"], ["76", "1", "2", "51"], ["29", "0", "1", "49"], ["91", "1", "3", "56"], ["52", "2", "2", "53"], ["10", "1", "1", "49"], ["85", "3", "1", "57"], ["50", "0", "1", "42"], ["56", "1", "3", "46"], ["64", "1", "3", "45"], ["130", "1", "1", "55"], ["141", "1", "3", "47"], ["74", "0", "2", "50"], ["83", "1", "3", "41"], ["31", "0", "1", "52"], ["172", "1", "2", "57"], ["184", "1", "3", "53"], ["75", "1", "3", "51"], ["187", "1", "1", "57"], ["113", "1", "2", "51"], ["162", "0", "3", "40"], ["110", "2", "3", "50"], ["150", "2", "3", "57"], ["167", "0", "1", "35"], ["77", "1", "2", "49"], ["35", "0", "1", "50"], ["158", "1", "1", "55"], ["112", "0", "2", "48"], ["48", "0", "2", "52"], ["147", "1", "2", "53"], ["7", "1", "2", "59"], ["65", "2", "2", "66"], ["168", "0", "2", "57"], ["190", "1", "2", "54"], ["178", "0", "3", "57"], ["159", "1", "2", "54"], ["120", "0", "2", "54"], ["116", "0", "2", "54"], ["79", "2", "2", "49"], ["98", "1", "3", "51"], ["122", "3", "2", "58"], ["179", "1", "2", "60"], ["198", "1", "2", "51"], ["189", "1", "2", "63"], ["199", "1", "2", "50"], ["156", "1", "2", "53"], ["166", "0", "2", "53"], ["160", "0", "2", "55"], ["152", "1", "2", "56"], ["183", "0", "2", "49"], ["94", "1", "2", "61"], ["149", "0", "1", "49"], ["131", "0", "2", "57"], ["24", "0", "2", "66"], ["99", "0", "1", "56"], ["171", "3", "2", "60"], ["104", "1", "2", "57"], ["81", "1", "2", "59"], ["97", "1", "2", "58"], ["20", "0", "2", "57"], ["163", "3", "2", "64"], ["195", "0", "1", "60"], ["84", "0", "1", "54"], ["27", "1", "2", "61"], ["118", "1", "1", "58"], ["71", "0", "1", "56"], ["63", "0", "1", "60"], ["185", "0", "2", "55"], ["127", "3", "2", "57"], ["177", "0", "2", "62"], ["188", "0", "2", "56"], ["60", "0", "2", "51"], ["66", "2", "3", "56"], ["173", "0", "1", "61"], ["186", "1", "2", "63"], ["96", "5", "2", "61"], ["101", "0", "2", "67"], ["3", "0", "2", "48"], ["170", "1", "2", "61"], ["92", "0", "1", "57"], ["62", "0", "1", "48"], ["135", "2", "2", "65"], ["26", "4", "2", "62"], ["139", "1", "2", "61"], ["121", "0", "3", "53"], ["144", "1", "1", "58"], ["146", "1", "2", "64"], ["137", "3", "2", "65"], ["123", "1", "1", "56"], ["169", "1", "1", "63"], ["34", "3", "2", "57"], ["33", "2", "2", "72"], ["32", "0", "3", "66"], ["114", "0", "2", "62"], ["125", "1", "2", "58"], ["59", "1", "2", "63"], ["23", "3", "2", "64"], ["161", "2", "2", "72"], ["103", "0", "2", "64"], ["194", "6", "2", "69"], ["136", "4", "2", "70"], ["154", "1", "2", "66"], ["157", "0", "1", "58"], ["93", "2", "2", "62"], ["39", "2", "2", "67"], ["88", "1", "2", "64"], ["192", "2", "2", "63"], ["80", "1", "2", "68"], ["200", "1", "2", "75"], ["180", "0", "2", "69"], ["82", "1", "2", "65"], ["174", "2", "2", "71"], ["95", "5", "2", "71"], ["61", "1", "2", "60"], ["100", "2", "2", "71"], ["143", "2", "3", "75"], ["68", "1", "2", "71"], ["57", "0", "2", "72"], ["132", "3", "2", "73"], ["", "", ""]]
        
        arr2 = [["Person", "Gender", "Heardofcondition", "Set", "@1st", "@2nd", "@3rd", "@4th", "Combination", "VideoAGenUnderstandingCONDITION", "VideoBdoctorUnderstandingCONDITION", "VideoCOldUnderstandingCONDITION", "DEMOUnderstandingCONDITION", "TotalAGen", "TotalBdoc", "TotalCOld", "TotalDDEMO"], ["1", "1", "1", "1", "4", "1", "3", "2", "4132", "5", "5", "3", "5", "25", "23", "13", "22"], ["2", "2", "1", "1", "4", "1", "3", "2", "4132", "5", "5", "5", "5", "23", "23", "20", "22"], ["3", "2", "2", "1", "4", "1", "3", "2", "4132", "4", "4", "2", "5", "20", "17", "14", "23"], ["4", "2", "0", "1", "4", "1", "3", "2", "4132", "5", "5", "5", "5", "24", "24", "23", "25"], ["5", "2", "2", "1", "4", "1", "3", "2", "4132", "5", "5", "4", "5", "25", "22", "18", "23"], ["6", "2", "1", "11", "1", "3", "4", "2", "1342", "5", "4", "5", "5", "24", "22", "23", "25"], ["7", "2", "1", "11", "1", "3", "4", "2", "1342", "5", "4", "2", "5", "25", "22", "9", "21"], ["8", "1", "1", "11", "1", "3", "4", "2", "1342", "4", "4", "2", "5", "24", "23", "6", "21"], ["9", "2", "0", "11", "1", "3", "4", "2", "1342", "5", "4", "3", "5", "25", "21", "11", "23"], ["10", "2", "0", "11", "1", "3", "4", "2", "1342", "5", "5", "1", "5", "24", "23", "5", "25"], ["11", "1", "0", "24", "3", "1", "2", "4", "3124", "5", "5", "4", "5", "24", "23", "15", "21"], ["12", "2", "0", "24", "3", "1", "2", "4", "3124", "4", "5", "3", "5", "22", "24", "14", "19"], ["13", "1", "0", "24", "3", "1", "2", "4", "3124", "4", "3", "4", "4", "24", "23", "14", "19"], ["14", "2", "0", "24", "3", "1", "2", "4", "3124", "5", "5", "5", "5", "25", "25", "17", "18"], ["15", "2", "0", "24", "3", "1", "2", "4", "3124", "4", "4", "4", "4", "24", "22", "14", "17"], ["16", "1", "2", "10", "2", "4", "3", "1", "2431", "5", "5", "3", "5", "25", "23", "13", "20"], ["17", "1", "2", "10", "2", "4", "3", "1", "2431", "5", "5", "3", "5", "25", "22", "16", "21"], ["18", "2", "1", "10", "2", "4", "3", "1", "2431", "5", "4", "2", "5", "25", "21", "11", "22"], ["19", "2", "1", "10", "2", "4", "3", "1", "2431", "5", "5", "2", "5", "25", "23", "19", "25"], ["20", "1", "1", "10", "2", "4", "3", "1", "2431", "5", "5", "4", "5", "24", "23", "18", "25"]]

    }

    func testCoreDataWrite() throws {
        let h = HomeViewController()
        let d = Dataset(name: "Test Set", appendable: arr)
        h.createItem(item: d, name: d.name)
    }
    
    func testFirstInit() throws {
        let data = Dataset()
        print("Name: " + data.name)
        print("Creation Date: " + data.creationDate)
        print("Num Items: " + String(data.getTotalNumItems()))
        print("Keys: ", data.keys)
        print("X-Axis: ", data.xvals)
        print("Data Stored: ",  data.getData())
    }
    
    func testSecondInit() throws {
        let data = Dataset(name: "TestSet")
        print("Name: " + data.name)
        print("Creation Date: " + data.creationDate)
        print("Num Items: " + String(data.getTotalNumItems()))
        print("Keys: ", data.keys)
        print("X-Axis: ", data.xvals)
        print("Data Stored: ",  data.getData())
    }
    
    func testThirdInit() throws {
        let data = Dataset(name: "TestSet", appendable: self.arr)
        print("Name: " + data.name)
        print("Creation Date: " + data.creationDate)
        print("Num Items: " + String(data.getTotalNumItems()))
        print("Keys: ", data.keys)
        print("X-Axis: ", data.xvals)
        print("Data Stored: ",  data.getData())
    }
    
    func testDataAppending()  throws {
        let data = Dataset()
        data.appendArray(array: arr)
    }
    
    func testCSVWrite() throws {
        let data = Dataset(name: "Test", appendable: arr)
        data.toCSV()
        print("FINISHED WRITING TO CSV SUCCESSFULLY")
    }
    
    func testModesCalc() throws {
        let data = Dataset()
        print(data.getModes(arr: [2, 2, 2, 3, 4, 4, 4, 5, 6]))
    }
    
    func testCSVRead() throws {
        let data = Dataset(name: "Test", appendable: arr)
        data.toCSV()
        print(db.readCSV(fileName: "Test1-22-22.csv"))
    }
    
    func testCSVReadAppend() throws {
        let data = Dataset(name:"Test", appendable: db.readCSV(fileName: "Test1-22-22.csv"))
        print(data.data)
    }
    
    func testSecondFile() throws {
        let h = HomeViewController()
        let d = Dataset(name: "Test Set", appendable: arr)
        h.createItem(item: d, name: d.name)
        let d2 = Dataset(name: "Test Set 2", appendable: arr2)
        h.createItem(item: d2, name: d2.name)
        h.getAllItems()
    }

}
