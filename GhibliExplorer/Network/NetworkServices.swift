import Foundation
class NetworkServices {
    
    static let sharedInstance = NetworkServices()
    
    func listfilms(completionBlock:@escaping CompletionBlockArray){
        NetworkManager.sharedInstance.callUrlWithCompletion(url: "films", params: nil, completion: completionBlock, method: .get)
    }
}
