import UIKit

class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5 // test code
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.foodCell, for: indexPath) as? FoodCell else { return UICollectionViewCell() }
        //Start TestCode
        cell.setupFoodImage(UIImage(named: "side") ?? UIImage())
        cell.setupFoodName("[마샐미디쉬] 매콤마늘쫑 해산물볶음 180G")
        cell.setupFoodDescription("탱글탱글한 새우와 오징어를 ..")
        cell.setupNormalPrice("6,210원")
        cell.setupEventPrice("9,999원")
        cell.setupEventBadge("이벤트특가")
        cell.setupLaunchingBadge("론칭특가")
        //End TestCode
        return cell
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
