import Foundation

struct Amiibo:  Codable , Identifiable{
    let id = UUID() // aways let, for atribute default value in encodable
    let latitude: Float = 21.273389
    let longitude: Float = -157.823802
    
    let amiiboSeries, character, gameSeries, head: String
    let image: String
    let name: String
    let release: Release
    let tail, type: String
    
    func load() {
//      print(">>>>> Downloading \(self.image) <<<<<")
    }
    
}

struct Release: Hashable, Codable {
    let au, eu, jp, na: String?
}
