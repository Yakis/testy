//
//  ContentView.swift
//  Testy
//
//  Created by Mugurel Moscaliuc on 13/07/2021.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @StateObject var loginVM = LoginVM()
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Login")
                .padding(10)
            TextField("username", text: $loginVM.username)
                .padding(5)
                .border(
                    Color.gray,
                    width: 0.5
                )
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                .padding(10)
            SecureField("password", text: $loginVM.password)
                .padding(5)
                .border(
                    Color.gray,
                    width: 0.5
                )
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                .padding(10)
            Button {
                loginVM.login()
            } label: {
                Label("Login", systemImage: "key.fill")
                    .padding(10)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
