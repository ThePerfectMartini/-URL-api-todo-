
import Foundation

class URLManagerTemp {
    let myKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJYLUFwcC1SYXRlLUxpbWl0IjoiNTAwOjEwIiwiYWNjb3VudF9pZCI6IjE5MTI4NTI4NTciLCJhdXRoX2lkIjoiMiIsImV4cCI6MTcwODc2NDI4OCwiaWF0IjoxNjkzMjEyMjg4LCJuYmYiOjE2OTMyMTIyODgsInNlcnZpY2VfaWQiOiI0MzAwMTE0ODEiLCJ0b2tlbl90eXBlIjoiQWNjZXNzVG9rZW4ifQ.8-kBLF35_Anh_5ZN7WJPtJZMwBvDyjkynXJkj0PO8NU"
    
    //    static let shared = URLManager()
    private init(){}
    
    
    
    func getJsonData(completion: @escaping (Result<Data, Error>) -> Void) {
        func getJsonData(name: String, completion: @escaping (Result<Data, Error>) -> Void) {
            let urlString = "https://api.nexon.co.kr/fifaonline4/v1.0/users?nickname=" + name
            let urltoKorea = urlEncode.URLencode(urlString)
            var request = URLRequest(url: urltoKorea)
            request.setValue(myKey, forHTTPHeaderField: "Authorization")
            
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
        
        func getJsonDataDeal(id: String, completion: @escaping (Result<Data, Error>) -> Void) {
            let urlString = "https://api.nexon.co.kr/fifaonline4/v1.0/users/\(id)/markets?tradetype=buy&offset=0&limit=100"
            let urltoKorea = urlEncode.URLencode(urlString)
            var request = URLRequest(url: urltoKorea)
            request.setValue(myKey, forHTTPHeaderField: "Authorization")
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error {
                    print("에러")
                    completion(.failure(NetworkError.emptyResponse))
                    return
                }
                guard let data = data else {
                    print("data 에러")
                    completion(.failure(NetworkError.emptyResponse))
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
}
