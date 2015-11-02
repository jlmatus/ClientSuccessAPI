//
//  ClientSuccess.swift
//  ClientSuccess
//
//  Created by Jose on 10/28/15.
//  Copyright © 2015 Rain Agency. All rights reserved.
//

import Foundation

public class ClientSuccess {
    
    public static let sharedController = ClientSuccess()
    
    private let clientSucessURL = "https://usage.clientsuccess.com/collector/1.0.0/projects/"
    private let eventString = "/events/"
    
    public var apiKey: String?
    public var projectId: String?
    
  public func addEvent(eventId: String, organizationId: String, organizationName: String, userId: String, userName: String, userEmail: String, eventValue: String, completionHandler handler: (() -> ())? = nil, errorHandler: ((errorMessage: String) -> ())? = nil) {
        if let apiKey = apiKey, projectId = projectId, urlString = (clientSucessURL.stringByAppendingString(projectId).stringByAppendingString(eventString).stringByAppendingString(eventId + "?api_key=").stringByAppendingString(apiKey)).stringByAddingPercentEncodingWithAllowedCharacters(.URLQueryAllowedCharacterSet()), url = NSURL(string: urlString) {
            let request = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.HTTPBody = "{\n  \"identity\": {\n  \"organization\": {\n  \"id\": \(organizationId),\n \"name\": \"\(organizationName)\"\n  },\n  \"user\": {\n  \"id\": \(userId),\n  \"name\": \"\(userName)\",\n  \"email\": \"\(userEmail)\"\n }\n  },\n  \"value\": \(eventValue)\n}".dataUsingEncoding(NSUTF8StringEncoding)
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithRequest(request) { _, _, error in
                if let errorMessage = error?.description {
                    errorHandler?(errorMessage: errorMessage)
                } else {
                    handler?()
                }
            }
            task.resume()
        }
    }
    
}
