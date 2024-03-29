//
//  DbSwiftDataModel.swift
//  DrgonBollWiki
//
//  Created by Esteban Perez Castillejo on 7/3/24.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class DbSwiftDataModel {
    
    var idFavorites: String
    var id: Int
    var orden: Int
    
    init(idFavorites: String = UUID().uuidString, id: Int, orden: Int = 0) {
        self.idFavorites = idFavorites
        self.id = id
        self.orden = orden
       
    }
}
