
import SwiftUI

struct MainView: View {
    @State private var recipes = [Recipe]()
    @State private var recipeName = ""
    var body: some View {
        
        
        ZStack {
            NavigationStack {
                ScrollView(.vertical) {
                    
                    HStack() {
                        TextField("Recipe name", text: $recipeName)
                            .padding(.all , 10)
                            .frame(width: 200)
                            .border(Color.gray)
                            .shadow(radius: 5)
                        Button(action: {
                            Task {
                                do {
                                    recipes = try await fetchRecipe(recipeName: recipeName)
                                }
                                catch {
                                    print("unexpected error")
                                }
                            }
                            
                        }) {
                            Text("Search")
                        }
                    }
                    
                    LazyVStack() {
                        ForEach(recipes , id: \.id) { item in
                            NavigationLink(destination: NavigatorView(recipe: item)) {
                                Text(item.name)
                                    .bold()
                                    .foregroundStyle(.black)
                                    .font(.headline)
                                    .padding()
                                    .frame(maxWidth: .infinity , maxHeight: .infinity)
                                    .background(Color.red.gradient)
                                    .cornerRadius(15)
                            }
                            .padding(.horizontal , 15)
                        }
                    }
                }
                .navigationTitle("Recipes").navigationBarTitleDisplayMode(.large)
                
            }
        }
    }
}

//#Preview {
//    MainView()
//}
