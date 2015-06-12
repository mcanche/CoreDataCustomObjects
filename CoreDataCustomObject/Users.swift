import UIKit
import CoreData


@objc(Users)
class Users: NSManagedObject {
    @NSManaged var username:String
    @NSManaged var password:String
    
    func toString() -> String {
        return "The username is \(username) their password is \(password)"
        
    }
    func addFunnyPrefix(prefix: String){
        username = prefix + username
    }
    
    func validPassword(inputPassword: String) -> Bool{
        if inputPassword == password {
            return true
        }else {
            return false
        }
    }
}
