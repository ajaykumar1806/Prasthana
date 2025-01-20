import UIKit

import Foundation

//Declaring Error Types

let noConnection=true
let lowBandWidth=21
let noFileFound=true
enum fileTransferError:Error {
    case noConnection
    case lowBandWidth
    case noFileFound
}
func fileTransfer() throws {
    guard noConnection else {
        throw fileTransferError.noConnection
    }
    guard lowBandWidth>20 else {
        throw fileTransferError.lowBandWidth
    }
    guard noFileFound else {
        throw fileTransferError.noFileFound
    }
}

//calling the throwing methods and functions
func sendFile()->String{
    do{
        try fileTransfer()
    }
    catch fileTransferError.noConnection{
        return "please enable internet connection"
        
    }
    catch fileTransferError.lowBandWidth{
        return "file transfer speed is too low"
    }
    catch fileTransferError.noFileFound{
        return "no file found with the given name"
    }
    catch {
        return "unexpected error"
    }
    return "Successfully transfered the file"
}
print(sendFile())

// Disabling error catching(achieved by using try!)
    //this can only be used if the function doesnt have errors
print(try! sendFile())

//defer statements(used to perform some specific task before returning)
func add()->Int{
    return 10
}
func multiply()->Int{
    return 20
}
func sendFile1()->String{
    defer{
        print(add())
        print(multiply())
    }
    do{
        try fileTransfer()
    }
    catch fileTransferError.noConnection{
        return "please enable internet connection"
        
    }
    catch fileTransferError.lowBandWidth{
        return "file transfer speed is too low"
    }
    catch fileTransferError.noFileFound{
        return "no file found with the given name"
    }
    catch {
        return "unexpected error"
    }
    return "Successfully transfered the file"
}
print(sendFile1())
