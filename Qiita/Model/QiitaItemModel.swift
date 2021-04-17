//
//  QiitaItemModel.swift
//  Qiita
//
//  Created by 木元健太郎 on 2021/04/16.
//

import Foundation

struct QiitaItemModel: Codable {
  var urlStr: String
  var title: String

  enum CodingKeys: String, CodingKey {
    case urlStr = "url"
    case title = "title"
  }
  var url: URL? { URL.init(string: urlStr) }
}

