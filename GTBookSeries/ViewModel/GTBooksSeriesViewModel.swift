//
//  GTBookSeriesViewModel.swift
//  GTBookSeries
//
//  Created by Shilpa M on 10/11/20.
//  Copyright © 2020 Shilpa. All rights reserved.
//

import UIKit

class GTBooksSeriesViewModel: NSObject {
    
    private var apiService : APIService!
    let group = DispatchGroup()
    let sourcesURL = URL(string: "https://anapioficeandfire.com/api/books/")

    private(set) var empData : [GTBooksData]! {
        didSet {
            self.bindEmployeeViewModelToController()
        }
    }
    
    var bindEmployeeViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService =  APIService()
        callFuncToGetEmpData()
    }
    
    func callFuncToGetEmpData() {
       self.group.enter()
       self.apiService.apiToGetBooksData(sourcesURL: sourcesURL!) { (empData) in
            self.empData = empData
       }
        self.group.leave()
    }

}
