import UIKit

class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    private var foodManager = SideDishManager.sharedInstance()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let dataCount = [8, 8, 8] //임시코드 반드시 수정해야 함
        return dataCount[section]
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.foodCell, for: indexPath) as? FoodCell else { return UICollectionViewCell() }
        let data = foodManager.getFoodData(indexPath.section, indexPath.row)
        let url = URL(string: data.image)!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let data = data, let image = UIImage(data: data) {
                    cell.setupFoodImage(image)
                }
            
            }
        }.resume()
        cell.setupFoodName(data.title)
        cell.setupFoodDescription(data.detail)
        cell.setupNormalPrice(data.sPrice)
        cell.setupEventPrice(data.nPrice ?? "")
        if let badge = data.badge {
            badge.forEach { content in
                if content == "이벤트특가"
                {
                    cell.setupEventBadge(content)
                }
                else
                {
                    cell.setupLaunchingBadge(content)
                }
            }
        }
        //End TestCode
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return foodManager.getDataCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CellIdentifier.foodHeader, for: indexPath) as? CollectionViewHeader else {
            return UICollectionReusableView()
        }
        
        if kind == UICollectionView.elementKindSectionHeader
        {
            if indexPath.section == 0
            {
                header.setupHeaderLabel(HeaderInfo.main)
            }
            else if indexPath.section == 1
            {
                header.setupHeaderLabel(HeaderInfo.soup)
            }
            else
            {
                header.setupHeaderLabel(HeaderInfo.side)
            }
        }
        return header
    }
    
}
