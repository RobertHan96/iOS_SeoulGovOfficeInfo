import UIKit
import SafariServices

import SnapKit
import NMapsMap
import Then

class OfficeDetailViewController: UIViewController {
    let ad = UIApplication.shared.delegate as? AppDelegate
    lazy var id = ad!.selectedOfficeID
    lazy var officeDivision = ad!.officeID.setPreviousViewId(id: ad!.officeID)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        makeConstratins()
        setupOfficeLocation()
        print("이전 클릭 정보", id, officeDivision)
    }
    
    let labelOfficeName = UILabel().then {
        $0.text = "구청"
        $0.font = UIFont.boldSystemFont(ofSize: 40)
    }
    let labelOfficeNumber = UILabel().then {
        $0.text = "TEL."
        $0.font = UIFont.boldSystemFont(ofSize: 24)
        $0.textColor = .darkGray
    }
    let labelOfficeAddress = UILabel().then {
        $0.text = "서울시 00구"
        $0.font = UIFont.boldSystemFont(ofSize: 24)
        $0.textColor = .darkGray
    }
    let mapViewContainer = UIView().then {
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.darkGray.cgColor
    }
    let btnGotoPublicSite = UIButton().then {
        $0.setImage(UIImage(named: "internet"), for: .normal)
    }
    let mapView = NMFMapView()
    
    func setupOfficeLocation() {
        
        let officeLat : Double = self.officeDivision[self.id].lat
        let officeLng : Double = self.officeDivision[self.id].lng
        let officeLocation = NMGLatLng(lat: officeLat, lng:officeLng)
        let marker = NMFMarker()
        marker.position = officeLocation
        marker.mapView = mapView
        let cameraUpdate = NMFCameraUpdate(scrollTo: officeLocation)
        mapView.moveCamera(cameraUpdate)
    }
    
    @objc func oepnSFSafariViewControllerAction(_ sender: UIButton) {
        let publicSite : String = self.officeDivision[self.id].publicSite
        guard let url = URL(string: publicSite) else { return }
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true, completion: nil)
     }

    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(labelOfficeName)
        mapViewContainer.addSubview(mapView)
        view.addSubview(labelOfficeNumber)
        view.addSubview(labelOfficeAddress)
        view.addSubview(btnGotoPublicSite)
        view.addSubview(mapViewContainer)
        btnGotoPublicSite.addTarget(self, action: #selector(oepnSFSafariViewControllerAction), for: .touchUpInside)
        DatafetchManager.shared.fetchOfficeData {
            self.labelOfficeName.text = self.officeDivision[self.id].name
            self.labelOfficeNumber.text = "TEL.\(self.officeDivision[self.id].tel)"
            self.labelOfficeAddress.text = self.officeDivision[self.id].address
        }
    }
    
    func makeConstratins() {
        labelOfficeName.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(30)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(20)
        }
        btnGotoPublicSite.snp.makeConstraints { (make) in
            make.width.equalTo(40)
            make.height.equalTo(40)
            make.left.equalTo(labelOfficeName.snp.right).offset(30)
            make.centerY.equalTo(labelOfficeName)
        }
        labelOfficeNumber.snp.makeConstraints { (make) in
            make.top.equalTo(labelOfficeName.snp.bottom).offset(10)
            make.left.equalTo(labelOfficeName.snp.left)
        }
        labelOfficeAddress.snp.makeConstraints { (make) in
            make.top.equalTo(labelOfficeNumber.snp.bottom).offset(10)
            make.left.equalTo(labelOfficeName.snp.left)
        }
        mapViewContainer.snp.makeConstraints { (make) in
            make.top.equalTo(labelOfficeAddress.snp.bottom).offset(20)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-50)
            make.left.equalTo(labelOfficeName.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-10)
        }
        mapView.snp.makeConstraints { (make) in
            make.top.equalTo(mapViewContainer.snp.top)
            make.bottom.equalTo(mapViewContainer.snp.bottom)
            make.left.equalTo(mapViewContainer.snp.left)
            make.right.equalTo(mapViewContainer.snp.right)

        }
    }
}
