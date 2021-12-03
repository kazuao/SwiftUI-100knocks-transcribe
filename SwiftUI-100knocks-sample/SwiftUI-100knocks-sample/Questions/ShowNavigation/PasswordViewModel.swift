//
//  PasswordViewModel.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/11/29.
//

import SwiftUI

class PasswordViewModel: ObservableObject {
    @Published var password = "" {
        didSet {
            UserDefaults.standard.set(password, forKey: "password")
        }
    }

    @Published var isActive: Bool = false
    private var isFirstAppear = true

    func onAppear() {
        guard isFirstAppear else { return }
        isFirstAppear = false

        guard let p = UserDefaults.standard.string(forKey: "password") else { return }
        password = p

        if password.count > 8 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.isActive = true
            }
        }
    }
}
