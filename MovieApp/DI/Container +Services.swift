//
//  Container +Services.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/03/29.
//

import Swinject
import SwinjectAutoregistration

extension Container{
    func registerServices(){
        self.autoregister(BackedRestClient.self, initializer: BackedRestClient.init).inObjectScope(.container)
        self.autoregister(AlertDispatcher.self, initializer: AlertDispatcher.init).inObjectScope(.container)
        self.autoregister(SessionService.self, initializer: SessionService.init).inObjectScope(.container)
        self.autoregister(HttpClient.self, initializer: MovieHttp.init).inObjectScope(.container)
    }
}


