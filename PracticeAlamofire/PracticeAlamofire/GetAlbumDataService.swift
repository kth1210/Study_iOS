//
//  GetAlbumDataService.swift
//  PracticeAlamofire
//
//  Created by 김태현 on 2023/01/12.
//

import Foundation
import Alamofire

struct GetAlbumDataService {
    static let shared = GetAlbumDataService()
    
    func getAlbumInfo(completion: @escaping (NetworkResult<Any>) -> Void) {
        let URL = "https://jsonplaceholder.typicode.com/photos/1"
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        
        let dataRequest = AF.request(URL, method: .get, encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                print(statusCode)
//                guard let value = try? JSONSerialization.data(withJSONObject: dataResponse, options: .prettyPrinted) else {return}
                guard let value = dataResponse.value else { return }
                
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            case .failure:
                completion(.pathErr)
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200:
            return isValidData(data: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isValidData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        print("ehre")
        
        guard let decodedData = try? decoder.decode(AlbumDataModel.self, from: data) else { return .pathErr }
        
        return .success(decodedData)
    }
}
