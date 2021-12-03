//
//  EmailViewModel.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/11/29.
//

import SwiftUI

class EmailViewModel: ObservableObject {

    @Published var email = "" {
        didSet {
            UserDefaults.standard.set(email, forKey: "email")
        }
    }

    @Published var isActive = false
    private var isFirstAppear = true

    func onAppear() {
        guard isFirstAppear else { return }
        isFirstAppear = false

        guard let fetchEmail = UserDefaults.standard.string(forKey: "email") else { return }
        email = fetchEmail

        if email.count > 8 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.isActive = true
            }
        }
    }
}

