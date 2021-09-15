//
//  ContentView.swift
//  HackerNews
//
//  Created by ABDUL-WADUD MUSA on 14/09/2021.
//

import SwiftUI
 
struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post  in
                NavigationLink(destination: DetailView(url: post.url)){
                        HStack {
                            Text(String(post.points)).border(Color.black, width: 3)
                            Text(post.title)
                        }
                    }
            }
            .navigationBarTitle("H4XOR NEWS")
        }
        .onAppear{
            networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

