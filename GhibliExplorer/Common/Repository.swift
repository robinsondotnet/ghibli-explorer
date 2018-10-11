//
//  RepositoryProtocol.swift
//  GhibliExplorer
//
//  Created by Juan Carlos Romaina on 17/06/18.
//  Copyright © 2018 robinsondotnet. All rights reserved.
//

import UIKit

protocol Repository {
   associatedtype T
    
    func GetAll() -> [T]
}
