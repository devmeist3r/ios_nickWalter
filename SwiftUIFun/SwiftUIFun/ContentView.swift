//
//  ContentView.swift
//  SwiftUIFun
//
//  Created by Lucas Inocencio on 30/11/19.
//  Copyright © 2019 Lucas Inocencio. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: DetailView()) {
                Text("Go to Detail").foregroundColor(.black)
            }.navigationBarTitle("Hello World")
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
