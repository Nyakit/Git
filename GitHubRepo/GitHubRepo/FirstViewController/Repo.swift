//
//  Repo.swift
//  GitHubRepo
//
//  Created by Пользователь on 24.05.2018.
//  Copyright © 2018 Abramenko. All rights reserved.
//

import Foundation

struct DataRepo:Decodable {
    let id: Int
    let name: String
    let owner: owner
    let description: String?
    let html_url: URL
}
struct owner:Decodable {
    let login: String
}
struct description:Decodable {
    let some: String
}
