import SwiftUI
import Swinject
import Combine

struct DetailView: View {
    
    @ObservedObject var presenter: DetailsPresenter
    @State private var showMap = false
    let tail: String
    
    var body: some View {
        LoadingView(status: presenter.amiibo == nil){
            List{
                VStack {
                    RemoteImage(url: presenter.amiibo?.image ?? "")
                    Text("\(presenter.amiibo?.amiiboSeries ?? "") - \(presenter.amiibo?.character ?? "")")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .lineLimit(3)
                    Divider()
                    HStack{
                        Text(presenter.amiibo?.character ?? "")
                            .multilineTextAlignment(.leading)
                            .lineLimit(20)
                        Divider().frame(width: 10, height: 10, alignment: .center)
                        Text("Type: \(presenter.amiibo?.type ?? "")")
                            .font(.subheadline)
                    }
                    Divider()
                    HStack {
                        Button(action: { self.showMap = true }) {
                            Image(systemName: "mappin.and.ellipse")
                        }
                        .sheet(isPresented: $showMap) {
                            
                        }
                        Text("Click to show map")
                            .font(.subheadline)
                    }
                }
                .padding()
                .navigationBarTitle(Text(presenter.amiibo?.name ?? ""), displayMode: .inline)
            }
        }.onAppear(){
            presenter.getDetails(tail: self.tail)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Container.detailsContainer.resolve(DetailView.self, argument: "003d0102")
    }
}

struct RemoteImage: View {
    var url: String
    @ObservedObject var imageLoader = ImageLoaderService()
    @State var image: UIImage = UIImage()
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .frame(maxWidth: 300, maxHeight: 600)
            .aspectRatio(contentMode: .fit)
            .onReceive(imageLoader.$image) { image in
                self.image = image
            }
            .onAppear {
                imageLoader.loadImage(for: url)
            }
    }
}

class ImageLoaderService: ObservableObject {
    @Published var image: UIImage = UIImage()
    
    func loadImage(for urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data) ?? UIImage()
            }
        }
        task.resume()
    }
    
}
