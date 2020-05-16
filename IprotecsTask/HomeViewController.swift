//
//  HomeViewController.swift
//  IprotecsTask
//
//  Created by veeresham on 5/16/20.
//  Copyright © 2020 veeresham. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var orderNameLabel: UILabel!
    @IBOutlet weak var orderDueDateLabel: UILabel!
    @IBOutlet weak var customerNameLabel: UILabel!
    @IBOutlet weak var customerPhoneNumberLabel: UILabel!
    @IBOutlet weak var ordertotalLabel: UILabel!
    @IBOutlet weak var customerAddressLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
}


class HomeViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var popUpTransView: UIView!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var orderNumberView: UIView!
    @IBOutlet weak var orderNumberTf: UITextField!
    @IBOutlet weak var orderDueDateView: UIView!
    @IBOutlet weak var orderDueDateTF: UITextField!
    @IBOutlet weak var customerNameView: UIView!
    @IBOutlet weak var customerNameTF: UITextField!
    @IBOutlet weak var customerPhoneNumber: UIView!
    @IBOutlet weak var customerPhoneNumberTf: UITextField!
    @IBOutlet weak var orderTotalView: UIView!
    @IBOutlet weak var totalOrderTF: UITextField!
    @IBOutlet weak var customerAddressView: UIView!
    @IBOutlet weak var customerAddressTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Design()
       self.homeTableView.delegate = self
         self.homeTableView.dataSource = self
       self.homeTableView.tableFooterView = UIView()
        self.popUpTransView.isHidden = true
        self.popupView.isHidden = true
    }
    
    func Design(){
        self.orderNumberView.layer.borderWidth = 1
        self.orderNumberView.layer.borderColor = UIColor.customlightGray
        self.orderNumberView.layer.cornerRadius = 8
        
        self.orderDueDateView.layer.borderWidth = 1
        self.orderDueDateView.layer.borderColor = UIColor.customlightGray
        self.orderDueDateView.layer.cornerRadius = 8
        
        self.customerNameView.layer.borderWidth = 1
        self.customerNameView.layer.borderColor = UIColor.customlightGray
        self.customerNameView.layer.cornerRadius = 8
        
        self.customerPhoneNumber.layer.borderWidth = 1
        self.customerPhoneNumber.layer.borderColor = UIColor.customlightGray
        self.customerPhoneNumber.layer.cornerRadius = 8
        
        self.orderTotalView.layer.borderWidth = 1
        self.orderTotalView.layer.borderColor = UIColor.customlightGray
        self.orderTotalView.layer.cornerRadius = 8
        
        self.customerAddressView.layer.borderWidth = 1
        self.customerAddressView.layer.borderColor = UIColor.customlightGray
        self.customerAddressView.layer.cornerRadius = 8
    }
    
    // MARK: - TableViewDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    let  cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCellId", for: indexPath) as! HomeTableViewCell
        
       
        cell.cellView.layer.shadowOpacity = 1
        cell.cellView.layer.cornerRadius = 8
        cell.cellView.layer.shadowColor = UIColor.customlightGray
        cell.cellView.layer.shadowOffset = CGSize(width: 1, height: 1)
      //  cell.cellView.clipsToBounds = false
        cell.cellView.layer.shadowRadius = 2
        cell.cellView.layer.masksToBounds = false
        
        cell.editButton.layer.cornerRadius = 10
        cell.deleteButton.layer.cornerRadius = 10
        
            return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 265
    }
    
    
    // MARK: - ButtonActiones
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addNewOrderBtnAction(_ sender: UIButton) {
        
        self.popUpTransView.isHidden = false
        self.popupView.isHidden = false

    }
    
    @IBAction func editBtnAction(_ sender: UIButton) {
        self.popUpTransView.isHidden = false
        self.popupView.isHidden = false
    }
    
    @IBAction func deleteBtnAction(_ sender: UIButton) {
    }
    
    @IBAction func popUpCloseBtnAction(_ sender: UIButton) {
        self.popUpTransView.isHidden = true
               self.popupView.isHidden = true
    }
    
    @IBAction func popupAddBtnAction(_ sender: UIButton) {
        
        let validaction = self.Validation()
        if validaction == ""
        {
            self.popUpTransView.isHidden = true
            self.popupView.isHidden = true
        }
        else
        {
            Alert.showBasic(titte: "Alert", massage: validaction, vc: self)
        }
    }
    
    
    // MARK: - Validation
       
       func Validation() -> String {
           var successMessage = ""
        if self.orderNumberTf.text?.count == 0
           {
               successMessage = "Please Enter Order Number"
               return successMessage
           }
        if self.orderDueDateTF.text?.count == 0
           {
               successMessage = "Please Enter Order Due date"
               return successMessage
           }
        if self.customerNameTF.text?.count == 0
        {
            successMessage = "Please Enter Customer Name"
            return successMessage
        }
        if self.customerPhoneNumberTf.text?.count == 0
        {
            successMessage = "Please Enter Customer PhoneNumber"
            return successMessage
        }
        if self.totalOrderTF.text?.count == 0
        {
            successMessage = "Please Enter Order Total"
            return successMessage
        }
        if self.customerAddressTF.text?.count == 0
        {
            successMessage = "Please Enter Customer Address"
            return successMessage
        }
           return successMessage
       }
}
