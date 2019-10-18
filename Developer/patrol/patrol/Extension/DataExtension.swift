//
//  DataExtension.swift
//  patrol
//
//  Created by DOWN LUNYOU on 2019/10/17.
//  Copyright © 2019 Leo. All rights reserved.
//

import Foundation
extension Data {
    func encodableModel<T:Encodable>(model : T) -> Data? {
        do {
            return try JSONEncoder().encode(model)
            
        } catch  {
            return nil
        }
    }
    
    func decodableJson<T:Decodable>(jsonObject : [String : Any] , model : T.Type ) -> T?{
        guard let jsonData = getJsonData(jsonObject: jsonObject) else {
            return nil
        }
        
        do {
            return try JSONDecoder().decode(model, from: jsonData)
        } catch {
            return nil
        }
    }
    func getJsonData(jsonObject : [String :Any])-> Data? {
        do {
            return try JSONSerialization.data(withJSONObject: jsonObject)
        } catch {
            return nil
        }
    }
    func getJson()->[String : Any]?{
        do {
            return try JSONSerialization.jsonObject(with: self , options: []) as? [String : Any]
        } catch {
            return nil
        }
    }
}
