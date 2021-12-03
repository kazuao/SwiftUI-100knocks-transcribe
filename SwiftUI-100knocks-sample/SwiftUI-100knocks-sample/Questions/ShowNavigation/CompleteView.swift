//
//  CompleteView.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/11/29.
//

import SwiftUI

struct BaseView: View {
    var body: some View {
        EmailView()
    }
}

struct CompleteView: View {

    @State var password: String = ""

    var body: some View {
        Text("Complete")
            .padding()
            .navigationBarTitle("Complete")
    }
}

struct EmailView: View {
    @ObservedObject var emailVM = EmailViewModel()

    var body: some View {
        VStack(spacing: 16) {
            TextField("email", text: $emailVM.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            NavigationLink(destination: PasswordView(), isActive: $emailVM.isActive) {
                Button(action: { }) {
                    Text("次へ")
                }
            }

            Spacer()
        }
        .onAppear {
            emailVM.onAppear()
        }
        .padding()
        .navigationTitle("Email")
    }
}

struct PasswordView: View {
    @ObservedObject var passwordVM = PasswordViewModel()

    var body: some View {
        VStack(spacing: 16) {
            TextField("password", text: $passwordVM.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            NavigationLink(destination: CompleteView(), isActive: $passwordVM.isActive) {
                Button(action: { }) {
                    Text("次へ")
                }
            }

            Spacer()
        }
        .onAppear {
            passwordVM.onAppear()
        }
        .padding()
        .navigationBarTitle("Password")
    }
}

struct CompleteView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteView()
    }
}
