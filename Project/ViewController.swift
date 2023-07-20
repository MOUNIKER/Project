//
//  ViewController.swift
//  Project
//
//  Created by Siva Mouniker  on 25/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var SampleTableView: UITableView!
    
    var namesArray:[String]?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpTableview()
        namesArray = ["a","b","c","Albemarle", "Brane", "Chesapeake","Ben", "Ivy", "Jordell"]
    }
    func setUpTableview() {
        SampleTableView.delegate = self
        self.SampleTableView.dataSource = self
        SampleTableView.register(UINib(nibName : "SampleTableViewCell",bundle: nil), forCellReuseIdentifier: "SampleTableViewCell")
    }

}


extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SampleTableViewCell", for: indexPath) as? SampleTableViewCell{
            cell.nameLabel.text = namesArray?[indexPath.row]
            cell.sampleImageView.image = UIImage(named: "sample")
            return cell
        }
        return UITableViewCell()
    }
            func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                return 500
            }
            
            func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
                return 50
            }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
            
            
            func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
                //return "First"
                
                var secondVc = String()
                switch section {
                case 0:
                    secondVc = "First"
                    return secondVc
                case 1:
                    secondVc = "Second"
                    return secondVc
                default:
                    return "gdsfu"
                }
                //return secondVc
            }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            namesArray?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        
    
    }
            
            
    
}
