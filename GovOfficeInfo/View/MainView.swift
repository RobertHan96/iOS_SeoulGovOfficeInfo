import Foundation
import UIKit
import SnapKit

class Mainview : MainViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        makeConstraints()
    }
    
    func setupUI() {
        view.backgroundColor = UIColor(red: 208/255, green: 201/255, blue: 201/255, alpha: 1.0)
        view.addSubview(mainTitleImg)
        view.addSubview(headerIcon)
        view.addSubview(mainTitile)
        view.addSubview(btnContainer)
        view.addSubview(btnGotoTaxOffice)
        btnGotoTaxOffice.addTarget(self, action: #selector(gotoInfoView(_:)), for: .touchUpInside)
        btnGotoGuOffice.addTarget(self, action: #selector(gotoInfoView(_:)), for: .touchUpInside)
        btnGotoGuOfficeIntro.addTarget(self, action: #selector(gotoInfoView(_:)), for: .touchUpInside)
        btnGotoTaxOfficeIntro.addTarget(self, action: #selector(gotoInfoView(_:)), for: .touchUpInside)

        view.addSubview(btnGotoGuOffice)
        view.addSubview(btnGotoGuOfficeIntro)
        view.addSubview(btnGotoTaxOfficeIntro)
        view.addSubview(guofficeListCaption)
        view.addSubview(guofficeTaskCaption)
        view.addSubview(contactLabel)
        view.addSubview(taxofficeListCaption)
        view.addSubview(taxofficeTaskCaption)
    }

    func makeConstraints() {
        var iconSize = 75
        if UIDevice.current.userInterfaceIdiom == .pad { iconSize = 120 }
        mainTitile.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(0)
            make.height.equalTo(view.layer.bounds.height/4-100)
            make.left.equalTo(headerIcon.snp.right).offset(0)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(0)
        }
        headerIcon.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(0)
            make.height.equalTo(view.layer.bounds.height/4-100)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(0)
            make.width.equalTo(view.layer.bounds.width/4)
        }
        mainTitleImg.snp.makeConstraints { (make) in
            make.top.equalTo(mainTitile.snp.bottom).offset(0)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(0)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(0)
            make.bottom.equalTo(self.btnContainer.snp.top).offset(-10)
            make.height.equalTo(self.view.layer.bounds.height/2-100)
        }

        btnContainer.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(view.layer.bounds.height/2)
        }
                
        btnGotoTaxOffice.snp.makeConstraints { (make) in
            make.top.equalTo(btnContainer).offset(20)
            make.width.equalTo(iconSize)
            make.height.equalTo(iconSize)
            make.centerX.equalTo(taxofficeListCaption)
        }
        btnGotoTaxOfficeIntro.snp.makeConstraints { (make) in
            make.top.equalTo(btnContainer).offset(20)
            make.width.equalTo(iconSize)
            make.height.equalTo(iconSize)
            make.centerX.equalTo(taxofficeTaskCaption)
        }
        
        taxofficeListCaption.snp.makeConstraints { (make) in
            make.top.equalTo(btnGotoTaxOffice.snp.bottom).offset(5)
            make.left.equalTo(btnContainer).offset(0)
            make.height.equalTo(20)
            make.width.equalTo(btnContainer.snp.width).dividedBy(2)
        }
        taxofficeTaskCaption.snp.makeConstraints { (make) in
            make.top.equalTo(btnGotoTaxOfficeIntro.snp.bottom).offset(5)
            make.height.equalTo(20)
            make.width.equalTo(btnContainer.snp.width).dividedBy(2)
            make.left.equalTo(taxofficeListCaption.snp.right).offset(0)
            make.right.equalTo(btnContainer.snp.right).offset(-1)
        }

        
        btnGotoGuOffice.snp.makeConstraints { (make) in
            make.top.equalTo(taxofficeListCaption.snp.bottom).offset(30)
            make.centerX.equalTo(guofficeListCaption)
            make.width.equalTo(iconSize)
            make.height.equalTo(iconSize)
        }
        btnGotoGuOfficeIntro.snp.makeConstraints { (make) in
            make.top.equalTo(taxofficeTaskCaption.snp.bottom).offset(30)
            make.centerX.equalTo(guofficeTaskCaption)
            make.width.equalTo(iconSize)
            make.height.equalTo(iconSize)
        }
        
        guofficeListCaption.snp.makeConstraints { (make) in
            make.top.equalTo(btnGotoGuOffice.snp.bottom).offset(5)
            make.left.equalTo(btnContainer).offset(0)
            make.width.equalTo(btnContainer.snp.width).dividedBy(2)
            make.height.equalTo(20)
            make.bottom.equalTo(btnContainer.snp.bottom).offset(-20)
        }
        guofficeTaskCaption.snp.makeConstraints { (make) in
            make.top.equalTo(btnGotoGuOfficeIntro.snp.bottom).offset(5)
            make.height.equalTo(20)
            make.width.equalTo(btnContainer.snp.width).dividedBy(2)
            make.left.equalTo(guofficeListCaption.snp.right).offset(0)
            make.right.equalTo(btnContainer.snp.right).offset(0)
            make.bottom.equalTo(btnContainer.snp.bottom).offset(-20)
        }
        
        contactLabel.snp.makeConstraints { (make) in
            make.height.equalTo(80)
            make.top.equalTo(btnContainer.snp.bottom).offset(10)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(0)
        }
    }

}
