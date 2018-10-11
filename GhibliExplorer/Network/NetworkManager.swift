import Foundation
import Alamofire
import SystemConfiguration
import Reachability

typealias CompletionBlock = (Bool, Dictionary<String,AnyObject>) -> Void
typealias CompletionBlockArray = (Bool,NSArray) -> Void
class NetworkManager {
    
static let sharedInstance = NetworkManager()

let initialUrl = "https://ghibliapi.herokuapp.com/"
    
    class func isConnectedToNetwork() -> Bool {
        let reachability: Reachability = Reachability.init()!
        
        if(reachability.connection == .none){
            return false
        }else{
            return true
        }
    }
    

    
    func callUrlWithCompletion(url : String!, params : [String: AnyObject]!, completion : @escaping CompletionBlockArray, method: HTTPMethod) {
        
        print("------------------------")
        print("URL --> \(String(describing: url))")
        print("------------------------")
        
        
        if (!(params != nil)){
            
        }else{
            
            if let theJSONData = try? JSONSerialization.data(
                withJSONObject: params,
                options: []) {
                let theJSONText = String(data: theJSONData,
                                         encoding: .ascii)
                print("------------------------")
                print("JSON Parameters Request--> \(theJSONText!)")
                print("------------------------")
            }
        }
        
        let urlString = initialUrl.appending(url)
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        Alamofire.request(urlString, method: method, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            if(response.response?.statusCode == 200){
                completion(true, (response.result.value as! NSArray))
            }else{
                completion(false, NSArray())
            }
        }
    }
}
