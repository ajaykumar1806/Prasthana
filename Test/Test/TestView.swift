//
//  TestView.swift
//  Test
//
//  Created by G Ajay on 12/03/25.
//
import SwiftUI

struct TestView: View {
    var testViewModel = TestViewModel()
    @State private var userName: String = ""
    @State private var password: String = ""
    @State private var isVerified = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                TextField("Email", text: $userName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Submit") {
                    if testViewModel.verifyUser(email: userName, password: password) {
                        isVerified = true
                    }
                }
                .bold()
                .frame(width: 200)
                .padding()
                .background(.blue.gradient)
                .foregroundStyle(.white)
                .cornerRadius(15)
                
                .navigationDestination(isPresented: $isVerified) {
                    photosView
                }
            }
            .padding()
            .task {
                await testViewModel.fetchUsers()
                await testViewModel.fetchPhotos()
            }
        }
    }
    
    var photosView: some View {
        NavigationStack {
            ScrollView(.vertical) {
                ForEach(testViewModel.photos, id: \.id) { photo in
                        NavigationLink(destination: photoDetailsView(photo: photo)) {
                            LazyVStack(alignment : .leading, spacing: 10) {
                                AsyncImage(url: URL(string: "https://picsum.photos/seed/picsum/500/300")) { image in
                                    image.resizable()
                                        .cornerRadius(10)
                                        .frame(height: 200)
                                } placeholder: {
                                    ProgressView()
                                }
                                Text(photo.title ?? "-")
                                    .multilineTextAlignment(.leading)
                                    .foregroundStyle(.black)
                                
                            }
                            .padding(16)
                            .border(Color.gray, width: 1)
                        }
                    }
            }
            .navigationTitle("Photos List")
        }
    }
    
    func photoDetailsView(photo: Photo) -> some View {
        VStack(alignment: .leading,spacing: 20) {
            AsyncImage(url: URL(string: "https://picsum.photos/seed/picsum/500/300")) { image in
                image.resizable()
                    .cornerRadius(10)
                    .frame(width: 300, height: 200)
            } placeholder: {
                ProgressView()
            }
            
            Text(photo.title ?? "-")

            if let url = URL(string: photo.url ?? "") {
                Button(action: { UIApplication.shared.open(url)
                }) {
                    Text("\(url)")
                }
            }
            
            if let thumbnailUrl = URL(string: photo.thumbnailURL ?? "") {
                Button(action: { UIApplication.shared.open(thumbnailUrl)
                }) {
                    Text("\(thumbnailUrl)")
                }
            }
        }
        .padding(16)
        .multilineTextAlignment(.leading)
        .navigationTitle("Photo Details")
    }
}

#Preview {
    TestView()
}
