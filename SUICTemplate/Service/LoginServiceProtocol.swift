//
//  LoginService.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 03/03/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation
import Combine
import Alamofire

protocol LoginServiceProtocol: WebServiceProtocol {
    func requestLogin(email: String, password: String) -> AnyPublisher<UserToken, AFError>
}

final class LoginService: LoginServiceProtocol {
    var session: Session
    let bgQueue = DispatchQueue(label: "bg_parse_queue")

    init(session: Session = Session.default) {
        self.session = session
    }

    func requestLogin(email: String, password: String) -> AnyPublisher<UserToken, AFError> {
        let route = APIRouter.login(email: email, password: password)
        return self.performRequestDecodable(route: route)
    }
}
