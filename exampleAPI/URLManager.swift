//
//  URLManager.swift
//  앱개발 숙련 개인과제
//
//  Created by t2023-m0078 on 2023/08/29.
//

import Foundation

class URLManager {
    
    static let shared = URLManager()
    private init(){}
    

    
    func getJsonData(completion: @escaping (Result<Data, Error>) -> Void) {
        let urlString = "https://api.thecatapi.com/v1/images/search"
        let urltoKorea = urlEncode.URLencode(urlString)
        let request = URLRequest(url: urltoKorea)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                print("response 에러")
                completion(.failure(NetworkError.emptyResponse))
                return
            }
            guard let data = data else {
                print("data 에러")
                completion(.failure(NetworkError.emptyData))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
    
    
    
}
enum NetworkError: Error {
    case emptyResponse
    case emptyData
}
