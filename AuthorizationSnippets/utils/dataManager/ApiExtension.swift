//
//  ApiExtension.swift
//  Makfy
//
//  Created by Mohamed Emad on 1/23/19.
//  Copyright © 2019 Baianat. All rights reserved.
//

import Foundation
import RxSwift
import NewBaseFrameWork
//import Apollo

extension ApiHelperImp{
    
    /// perform any subscribtion happens for this subscribtion
//    func performSubcription<T: GraphQLSubscription>(subscription: T, withHeader: Bool = true, closeIt: Bool = true) -> Observable<T.Data?>{
//        let apolloClient = ApolloClientManager.instance.getSubscribtionClient()
//
//        return Observable<T.Data?>.create({ (observer) -> Disposable in
//
//            apolloClient.subscribe(subscription: subscription){
//                (result, error) in
//                DispatchQueue.main.async {
//                    if error != nil{
//                        observer.onError(error!)
//                        return
//                    }
//                    observer.onNext(result?.data)
//
//                    if closeIt{
//                        observer.onCompleted()
//                    }
//
//                }
//            }
//
//            return Disposables.create()
//        })
//
//    }
//
//    /// perform the mutation with the header token or without header
//    func performMutation<T: GraphQLMutation>(mutation: T, withHeader: Bool = true) -> Observable<T.Data?>{
//        var apolloClient : ApolloClient? = ApolloClientManager.instance.getApolloClientWithHeader()
//        if !withHeader{
//            apolloClient = ApolloClientManager.instance.getApolloClient()
//        }
//        return Observable<T.Data?>.create({ (observer) -> Disposable in
//            apolloClient?.perform(mutation: mutation){
//                (result, error) in
//                DispatchQueue.main.async {
//                    if error != nil{
//                        observer.onError(error!)
//                        return
//                    }
//                    observer.onNext(result?.data)
//                    observer.onCompleted()
//                }
//            }
//            apolloClient = nil
//            return Disposables.create()
//        })
//
//    }
//
//    /// if the user wanna fetch aquery with header token or not
//    func fetchQuery<T: GraphQLQuery>(query: T, withHeader: Bool = true) -> Observable<T.Data?>{
//        var apolloClient : ApolloClient? = ApolloClientManager.instance.getApolloClientWithHeader()
//        if !withHeader{
//            apolloClient = ApolloClientManager.instance.getApolloClient()
//        }
//        return Observable<T.Data?>.create({ (observer) -> Disposable in
//            apolloClient?.fetch(query: query){
//                (result, error) in
//
//                if error != nil{
//                    observer.onError(error!)
//                    return
//                }
//                observer.onNext(result?.data)
//                observer.onCompleted()
//                return
//            }
//            apolloClient = nil
//            return Disposables.create()
//        })
//    }
}
