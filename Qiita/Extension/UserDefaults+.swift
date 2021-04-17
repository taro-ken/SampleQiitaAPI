//
//  UserDefaults+.swift
//  Qiita
//
//  Created by 木元健太郎 on 2021/04/16.
//

import Foundation

extension UserDefaults {
  private var qiitaAccessTokenKey: String { "qiitaAccessTokenKey" }
  var qiitaAccessToken: String {
    get {
      self.string(forKey: qiitaAccessTokenKey) ?? ""
    }
    set {
      self.setValue(newValue, forKey: qiitaAccessTokenKey)
    }
  }
}
