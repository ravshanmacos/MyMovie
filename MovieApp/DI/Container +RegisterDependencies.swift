//
//  Container +RegisterDependencies.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/03/29.
//

import Swinject

extension Container{
    func registerDependencies(){
        self.registerServices()
        self.registerCoordinators()
        self.registerViewModels()
    }
}
