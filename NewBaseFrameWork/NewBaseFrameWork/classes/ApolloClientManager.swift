//
//  ApolloClientManager.swift
//  frh
//
//  Created by Ismael AlShabrawy on 4/4/18.
//  Copyright © 2018 Ismael AlShabrawy. All rights reserved.
//

//import Foundation
//import Apollo
//import ApolloWebSocket
//
//open class ApolloClientManager {
//    static let instance = ApolloClientManager()
//    var apollo: ApolloClient!
//    var apolloClientInstance: ApolloClient? = nil
//    
//    func getApolloClient() -> ApolloClient {
//        let configuration = URLSessionConfiguration.default
//        configuration.timeoutIntervalForRequest = 10.0
//        configuration.timeoutIntervalForResource = 10.0
//        let url = URL(string: BASE_URL)!
//        self.apolloClientInstance = ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
//        return self.apolloClientInstance!
//    }
//    
//    func getApolloClientWithHeader(userToken : String = UserShared.instance.userToken) -> ApolloClient {
//        let configuration = URLSessionConfiguration.default
//        configuration.timeoutIntervalForRequest = 10.0
//        configuration.timeoutIntervalForResource = 10.0
//        configuration.httpAdditionalHeaders = ["Authorization": "Bearer \(UserShared.instance.userToken)"]
//        let url = URL(string: BASE_URL)!
//        self.apolloClientInstance = ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
//        return self.apolloClientInstance!
//    }
//    
//    func getSubscribtionClient() -> ApolloClient {
//        let authPayloads = [
//            "Authorization": "Bearer \(UserShared.instance.userToken)"
//        ]
//        let configuration = URLSessionConfiguration.default
//        configuration.httpAdditionalHeaders = authPayloads
//
//        let map: GraphQLMap = authPayloads
//        let wsEndpointURL = URL(string: graphQlSubscribtion)!
//        let endpointURL = URL(string: BASE_URL)!
//        let websocket = WebSocketTransport(request: URLRequest(url: wsEndpointURL), connectingPayload: map)
//        let splitNetworkTransport = SplitNetworkTransport(
//            httpNetworkTransport: HTTPNetworkTransport(
//                url: endpointURL,
//                configuration: configuration
//            ),
//            webSocketNetworkTransport: websocket
//        )
//        return ApolloClient(networkTransport: splitNetworkTransport)
//
//    }
//    
//}
