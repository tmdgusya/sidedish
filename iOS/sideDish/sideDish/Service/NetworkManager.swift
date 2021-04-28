import Foundation
import Alamofire

class NetworkManager {
    
    static func fetchSideDishData() {
        AF.request("https://h3rb9c0ugl.execute-api.ap-northeast-2.amazonaws.com/develop/baminchan/best")
            .validate()
            .responseDecodable(of: DataBody.self) { response in
                
                if let error = response.error {
                    print(error)
                    NotificationCenter.default.post(name: .networkError, object: self)
                    return
                }
                
                guard let data = response.value else { return }
                DispatchQueue.main.async {
                    let dataBody = data.body
                    dataBody.forEach { eachData in
                        let decodedData = SideDishes()
                        decodedData.categoryID = eachData.categoryID
                        decodedData.name = eachData.name
                        decodedData.items = eachData.items
                        let decodedData = SideDishes(categoryID: categoryID, name: name, items: items)
                        NotificationCenter.default.post(name: .fetchData, object: self, userInfo: [KeyValue.sideDishes:decodedData])
                    }
                }
            }
    }
    
    static func fetchDetailInfo(_ hash: String) {
        print("hash:\(hash)")
        AF.request("https://h3rb9c0ugl.execute-api.ap-northeast-2.amazonaws.com/develop/baminchan/detail/HBDEF")
            .validate()
            .responseDecodable(of: DetailData.self) { response in
                
                if let error = response.error {
                    print(error)
                    return
                }
                
                guard let data = response.value else { return }
                DispatchQueue.main.async {
                    let detaildata = data.data
                    let topImage = detaildata.topImage
                    let thumbImages = detaildata.thumbImages
                    let productDetail = detaildata.productDetail
                    let point = detaildata.point
                    let deliveryInfo = detaildata.deliveryInfo
                    let deliveryFee = detaildata.deliveryFee
                    let prices = detaildata.prices
                    let detailSection = detaildata.detailSection
                    let foodData = DetailFoodInfo(topImage: topImage, thumbImages: thumbImages, productDetail: productDetail, point: point, deliveryInfo: deliveryInfo, deliveryFee: deliveryFee, prices: prices, detailSection: detailSection)
                    NotificationCenter.default.post(name: .detailInfo, object: self, userInfo: ["detailInfo": foodData])
                }
            }
    }
}

