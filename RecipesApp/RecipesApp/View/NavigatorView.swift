

import SwiftUI

struct NavigatorView: View {
    var recipe: Recipe
    var body: some View {
        ZStack {
            
            Color.init(uiColor: .systemGray5).ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(alignment: .center) {
                    AsyncImage(url: URL(string: recipe.thumbnail)) { image in
                        image.resizable()
                            .frame(width: 300 , height: 300)
                            .scaledToFit()
                            .cornerRadius(10)
                        
                    } placeholder: {
                        ProgressView()
                    }
                    
                    HStack {
                        Text(recipe.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity , alignment: .center)
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    VStack {
                        Text("Instructions :")
                            .frame(maxWidth: .infinity , alignment: .leading)
                            .padding(.leading)
                            .font(.title2).bold()
                        Text(recipe.instructions)
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal)
                    }
                    Button(action: {
                        recipe.youtube != "" ? UIApplication.shared.open(URL(string: recipe.youtube)!) : UIApplication.shared.open(URL(string: "https://www.youtube.com")!)
                    }) {
                        Text(recipe.youtube != "" ? "Watch Now" : "Youtube")
                            .bold()
                            .frame(width: 200)
                            .padding()
                            .background(Color.red)
                            .foregroundStyle(.black)
                            .cornerRadius(15)
                    }
                }
            }
        }
    }
}
//
//#Preview {
//    NavigatorView(recipe: Recipe(id: "52795", name: "Skillet Apple Pork Chops with Roasted Sweet Potatoes & Zucchini", category: "Chicken", area: "Indian", instructions: "Take a large pot or wok, big enough to cook all the chicken, and heat the oil in it. Once the oil is hot, add sliced onion and fry them until deep golden brown. Then take them out on a plate and set aside. To the same pot, add the chopped garlic and sauté for a minute. Then add the chopped tomatoes and cook until tomatoes turn soft. This would take about 5 minutes. Then return the fried onion to the pot and stir. Add ginger paste and sauté well. Now add the cumin seeds, half of the coriander seeds, and chopped green chilies. Give them a quick stir. Next goes in the spices – turmeric powder and red chili powder. Sauté the spices well for a couple of minutes. Add the chicken pieces to the wok, season it with salt to taste, and cook the chicken covered on medium-low heat until the chicken is almost cooked through. This would take about 15 minutes. Slowly sautéing the chicken will enhance the flavor, so do not expedite this step by putting it on high heat. When the oil separates from the spices, add the beaten yogurt, keeping the heat on the lowest so that the yogurt doesn’t split. Sprinkle the remaining coriander seeds and add half of the dried fenugreek leaves. Mix well. Finally, add the cream and give a final mix to combine everything well. Sprinkle the remaining kasuri methi and garam masala and serve the chicken handi hot with naan or rotis. Enjoy!", thumbnail: "https://www.themealdb.com/images/media/meals/wyxwsp1486979827.jpg", youtube: "https://www.youtube.com/watch?v=IO0issT0Rmc"))
//}
