//
//  ContentView.swift
//  BaseProject
//
//  Created by Tony Wang on 4/13/21.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                GeometryReader { geometry in
                    HStack(alignment: .top) {
                        Text("User name")
                            .frame(width: geometry.size.width * 0.3, alignment: .leading)
                        TextField(
                                "User name",
                                text: $username)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .border(Color(UIColor.separator))
                    }
                }
                .frame(height: 50)
                
                GeometryReader { geometry in
                    HStack(alignment: .top) {
                        Text("Password")
                            .frame(width: geometry.size.width * 0.3, alignment: .leading)
                        SecureField("Password", text: $password) {
                            
                        }
                        .border(Color(UIColor.separator))
                    }
                }
                .frame(height: 50)
                
                NavigationLink(destination: MovieListView(viewModel: MovieListViewModel())) {
                    Text("Sign In")
                        .foregroundColor(.purple)
                        .font(.headline)
                        .padding()
                        .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.purple, lineWidth: 1)
                            )
                }
                .frame(height: 32)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
