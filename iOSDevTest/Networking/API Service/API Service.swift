//
//  API Service.swift
//  iOSDevTest
//
//  Created by MohamedAbdelhamed on 25/09/2022.
//

import Foundation
import Alamofire

class APIService {
    
    static let share = APIService()
    
    private init() {}
    
    func apiRequest<T:Codable>(URl:String, parameters:Parameters?, headders:HTTPHeaders?, method: HTTPMethod?, complation: @escaping (T?,Error?) -> Void){
        AF.request(URl, method: method ?? .get, parameters: parameters, encoding: JSONEncoding.default , headers: headders).responseJSON { response in
            switch response.result{
            case .success(_):
                guard let data = response.data else{return}
                do {
                    let data = try JSONDecoder().decode(T.self, from: data)
                    complation(data, nil)
                }catch(let error){
                    complation(nil, error)
                }
            case .failure(let error):
                print(error)
                complation(nil,error)
            }
        }
    }
}
