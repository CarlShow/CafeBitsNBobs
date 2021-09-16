//
//  ViewController.swift
//  CafeBitsNBobs
//
//  Created by CARL SHOW on 9/13/21.
//

import UIKit

class ViewController: UIViewController {
    var storefront: [String: Double] = ["apple": 3, "banana": 2, "meat": 16, "pear": 2, "orange": 3, "brandname foods" : 6, "offbrand foods": 4, "mystery box": 777]
    var buyerAccount: [String: Double] = [:]
    var dOA = false
    var aA = false
    var lT = false
    @IBOutlet weak var itemName: UITextField!
    @IBOutlet weak var swapper: UIButton!
    @IBOutlet weak var quantity: UITextField!
    @IBOutlet weak var commitment: UIButton!
    @IBOutlet weak var session: UIButton!
    @IBOutlet weak var response: UILabel!
    @IBOutlet weak var viewAll: UIButton!
    @IBOutlet weak var listType: UIButton!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        itemName.textColor = UIColor.white
        itemName.attributedPlaceholder = NSAttributedString( string: "Item You Wish To Get", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        itemName.layer.cornerRadius = 5
        swapper.layer.cornerRadius = 5
        quantity.layer.cornerRadius = 5
        commitment.layer.cornerRadius = 5
        response.layer.cornerRadius = 5
        viewAll.layer.cornerRadius = 5
        listType.layer.cornerRadius = 5
    }
    @IBAction func onSwap(_ sender: Any)
    {
        commitment.isEnabled = true
        if dOA
        {
            if storefront.isEmpty
            {
                commitment.backgroundColor = #colorLiteral(red: 0.941067338, green: 0, blue: 0, alpha: 1)
                commitment.setTitle("OH GOD THE STORE'S EMPTY", for: .normal)
                commitment.isEnabled = false
            }
            else
            {
                dOA = false
                swapper.backgroundColor = #colorLiteral(red: 0.5490924716, green: 0.6702829003, blue: 0.6506639719, alpha: 1)
                swapper.setTitle("( Add )", for: .normal)
                commitment.backgroundColor = #colorLiteral(red: 0.5017309785, green: 0.6074313521, blue: 0.8275647759, alpha: 1)
                commitment.setTitle("Add Selected Item", for: .normal)
            }
        }
        else
        {
            dOA = true
            swapper.backgroundColor = #colorLiteral(red: 0.7023971081, green: 0.4525722861, blue: 0.4183613062, alpha: 1)
            swapper.setTitle("( Remove )", for: .normal)
            if buyerAccount.isEmpty && aA != true
            {
                commitment.backgroundColor = #colorLiteral(red: 0.8647086024, green: 0.3794241846, blue: 0.3809884489, alpha: 0.2467477558)
                commitment.setTitle("No Items in Cart", for: .normal)
                commitment.isEnabled = false
            }
            else if storefront.isEmpty
            {
                commitment.backgroundColor = #colorLiteral(red: 0.8647086024, green: 0.3794241846, blue: 0.3809884489, alpha: 0.2467477558)
                commitment.setTitle("Storefront is Empty :[", for: .normal)
                commitment.isEnabled = false
            }
            else
            {
                commitment.backgroundColor = #colorLiteral(red: 0.8647086024, green: 0.3794241846, blue: 0.3809884489, alpha: 1)
                commitment.setTitle("Remove Selected Item", for: .normal)
            }
        }
    }
    @IBAction func onAdd(_ sender: Any)
    {
        if aA
        {
            if let e = itemName.text?.lowercased()
            {
                if dOA
                {
                    storefront[e] = nil
                    response.text = "Sucesfully removed \(e)"
                    if storefront.isEmpty
                    {
                        commitment.backgroundColor = #colorLiteral(red: 0.8647086024, green: 0.3794241846, blue: 0.3809884489, alpha: 0.2467477558)
                        commitment.setTitle("Storefront is Empty :[", for: .normal)
                        commitment.isEnabled = false
                    }
                }
                else
                {
                    storefront[e] = Double(quantity.text!)
                    response.text = "Sucessfully added \(e)"
                }
            }
        }
        else
        {
            if dOA
            {
                if let e = itemName.text?.lowercased()
                {
                    for key in buyerAccount.keys
                    {
                        if key == e
                        {
                            buyerAccount[e] = nil
                            response.text = "Removed \(e)s..."
                        }
                        print(buyerAccount)
                        if buyerAccount.isEmpty
                        {
                        commitment.backgroundColor = #colorLiteral(red: 0.8647086024, green: 0.3794241846, blue: 0.3809884489, alpha: 0.2467477558)
                        commitment.setTitle("No Items in Cart", for: .normal)
                        commitment.isEnabled = false
                        }
                    }
                }
                else
                {
                    response.text = "Invalid input!"
                }
            }
            else
            {
                if let e = itemName.text?.lowercased()
                {
                    for key in storefront.keys
                    {
                        if key == e
                        {
                            if let u = Double(quantity.text!)
                            {
                                buyerAccount[e] = storefront[key]
                                buyerAccount[e]! *= u
                                response.text = "Added \(u) \(e)s"
                            }
                            else
                            {
                                buyerAccount[e] = storefront[key]
                                response.text = "Added \(e)s"
                            }
                        }
                    }
                }
                else
                {
                    response.text = "Invalid input!"
                }
            }
        }
    }
    @IBAction func adminKey(_ sender: Any)
    {
        session.isHidden = false
        aA = true
    }
    @IBAction func onEndmin(_ sender: Any)
    {
        session.isHidden = true
        aA = false
    }
    @IBAction func quickSwappo(_ sender: Any)
    {
        if lT
        {
            lT = false
            listType.backgroundColor = #colorLiteral(red: 0.5490924716, green: 0.6702829003, blue: 0.6506639719, alpha: 1)
            viewAll.backgroundColor = #colorLiteral(red: 0.5017309785, green: 0.6074313521, blue: 0.8275647759, alpha: 1)
            listType.setTitle("Your List", for: .normal)
            viewAll.setTitle("Show Your Shopping List", for: .normal)
        }
        else
        {
            lT = true
            listType.backgroundColor = #colorLiteral(red: 0.7023971081, green: 0.4525722861, blue: 0.4183613062, alpha: 1)
            viewAll.backgroundColor = #colorLiteral(red: 0.8647086024, green: 0.3794241846, blue: 0.3809884489, alpha: 1)
            listType.setTitle("Store List", for: .normal)
            viewAll.setTitle("Show The Storefront List", for: .normal)
        }
    }
    @IBAction func viewList(_ sender: Any)
    {
        if lT
        {
            var finTable = ""
            for (key, val) in storefront
            {
                finTable += "\(key): \(val)\n"
            }
        response.text = finTable
        }
        else
        {
            var finTable = ""
            for (key, val) in buyerAccount
            {
                if val == storefront[key]
                {
                    finTable += "\(key): \(val)\n"
                }
                else
                {
                    finTable += "Multiple  \(key)s: \(val)\n"
                }
            }
        response.text = finTable
        }
    }
}
