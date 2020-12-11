//
//  structure.swift
//  top 50 app
//
//  Created by CastorPay on 12/10/20.
//

import Foundation
struct RSS :Decodable{
    var feed:Feed?
}
struct Feed :Decodable{
    var title : String?
    var results : [Result]?
}
struct Result :Decodable,Hashable{
    var id,releaseDate,artistUrl,name,artworkUrl100,copyright,artistName : String?
}
