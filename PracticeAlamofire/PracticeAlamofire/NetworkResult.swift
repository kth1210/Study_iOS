//
//  NetworkResult.swift
//  PracticeAlamofire
//
//  Created by 김태현 on 2023/01/12.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
