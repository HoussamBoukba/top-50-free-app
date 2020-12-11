//
//  ContentView.swift
//  top 50 app
//
//  Created by CastorPay on 12/8/20.
//
import SwiftUI
import KingfisherSwiftUI

struct ContentView: View {
    @ObservedObject var item = fetchedData()
    @State var text = ""
    var body: some View {
        NavigationView{
            ScrollView{
                HStack{
                    TextField("search ", text:$text )
                }.padding()
                .background(Color(.systemGray5))
                .cornerRadius(12)
                .padding(.horizontal)

                LazyVGrid(columns: [GridItem(.flexible(minimum: 100, maximum: 200)),
                                    GridItem(.flexible(minimum: 100, maximum: 200)),
                                    GridItem(.flexible(minimum: 100, maximum: 200))], content: {
                                        ForEach (item.results/*.filter{$0.name!.contains($text)}*/ ,id:\.self){app in
                                            
                                            ExtractedView(app:app)
                                        }
                                    }).padding(.horizontal,12)
            }.navigationTitle("top best free :")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExtractedView: View {
    let app : Result

    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            Spacer()
            KFImage(URL(string: app.artworkUrl100!))
                .resizable()
                .scaledToFit()
                .cornerRadius(22)
            Link(app.name ??  "", destination: URL(string: app.artistUrl ?? "https://smashthewalls.com")!)
                .font(.system(size: 13, weight: .semibold))
                .padding(.top,6)
            Text(app.copyright ??  "")
                .font(.system(size: 9, weight: .semibold))
            Text(app.releaseDate ??  "")
                .font(.system(size: 8, weight: .semibold))
            Spacer()
           
            }
        }
    }

