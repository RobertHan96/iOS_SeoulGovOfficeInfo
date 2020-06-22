import UIKit

import Then
import SnapKit
import FirebaseAnalytics

class OfficeListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        makeConstrains()
    }
    let ad = UIApplication.shared.delegate as? AppDelegate
    let btnTitle = UIButton().then {
        $0.setTitle("officeListViewTitle".localized, for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.setTitleColor(.black, for: .normal)
//        $0.layer.cornerRadius = 10
//        $0.backgroundColor = UIColor(displayP3Red: 93, green: 81, blue: 81, alpha: 1)
//        $0.layer.bounds.borderWidth = 1.0
//        $0.layer.borderColor = UIColor.darkGray.cgColor
//        $0.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    let officeListCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.register(UINib(nibName: "OfficeListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "officeListItem")
        let layout = UICollectionViewFlowLayout()
        $0.backgroundColor = .groupTableViewBackground
        layout.minimumInteritemSpacing = 3
        $0.collectionViewLayout = layout
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if ad?.officeID == 1 {
            return DatafetchManager.shared.guOffice.count
        } else {
            return DatafetchManager.shared.taxOffice.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let officeListItem = collectionView.dequeueReusableCell(withReuseIdentifier: "officeListItem", for: indexPath) as? OfficeListCollectionViewCell
            else { return UICollectionViewCell() }
        if ad?.officeID == 1 {
            officeListItem.labelOfficeName.text = DatafetchManager.shared.guOffice[indexPath.row].name
            return officeListItem
        } else {
            officeListItem.labelOfficeName.text = DatafetchManager.shared.taxOffice[indexPath.row].name
            return officeListItem
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.bounds.width / 3 - 20, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        ad?.selectedOfficeID = indexPath.row
        let officeDetailVC = OfficeDetailViewController()
        self.navigationController?.pushViewController(officeDetailVC, animated: true)
    }

    func setupUI() {
        view.backgroundColor = .groupTableViewBackground
        view.addSubview(btnTitle)
        view.addSubview(officeListCollectionView)
        officeListCollectionView.delegate = self
        officeListCollectionView.dataSource = self
    }
    
    func makeConstrains()  {
        btnTitle.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(30)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(10)
            make.right.lessThanOrEqualTo(self.view.safeAreaLayoutGuide.snp.right).offset(-30)
        }
        officeListCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(btnTitle.snp.bottom).offset(20)
            make.centerX.equalToSuperview().offset(0)
            make.width.equalTo(view.snp.width).inset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }


}
