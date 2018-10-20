import Foundation
import MongoSwiftMobile

public protocol CoreStitchPushClient {
    func registerInternal(withRegistrationInfo registrationInfo: Document) throws
    
    func deregisterInternal() throws
}
