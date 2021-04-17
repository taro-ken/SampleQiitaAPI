//
//  QiitaAccessTokenModel.swift
//  Qiita
//
//  Created by 木元健太郎 on 2021/04/16.
//

import Foundation

struct QiitaAccessTokenModel: Codable {
  let clientId: String
  let scopes: [String]
  let token: String
}
