//
//  Traveled.swift
//  Amadeus
//
//  Created by Charly Maxter on 18/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation
import SwiftyJSON

fileprivate let traveled = "v1/travel/analytics/air-traffic/traveled"

/// A namespaced client for the `v1/travel/analytics/air-traffic/traveled` endpoints
///
/// Access via the `Amadeus` object
/// ```
/// let amadeus = Amadeus(client_id, client_secret)
/// amadeus.travel.analytics.airTraffic.traveled
/// ```
public class Traveled{
    
    private var client: Client
    
    public init(client:Client) {
        self.client = client
    }
    
    /// Returns a list of air traffic reports based on the number of people traveling.
    ///
    ///   ## Example
    ///   Find the air traffic from Nice in August 2017
    ///
    ///     amadeus.travel.analytics.airTraffic.booked.get(
    ///         originCityCode:"NCE",
    ///         period: "2017-08",
    ///         onCompletion: {
    ///             data in ...}
    ///     )
    /// - Parameters:
    ///    - originCityCode: `String` IATA code of the origin city.
    ///    - period: `String` period when consumers are travelling in `YYYY-MM` format
    ///
    /// - Returns:
    ///    `JSON` object
    public func get(originCityCode:String, period:String, onCompletion: @escaping (JSON) -> Void){
        client.getAccessToken(onCompletion: {
            (auth) in
            if auth != "error" {
                let body = "?originCityCode=\(originCityCode)&period=\(period)"
                makeHTTPGetRequestAuth(traveled, auth: auth, body: body, onCompletion: {
                    data,err  in
                    if let error = err {
                        onCompletion(JSON(parseJSON: "{error:\(error)}"))
                    }else{
                        onCompletion(data)
                    }
                })
            }else{
                onCompletion("error")
            }
        })
    }
}
