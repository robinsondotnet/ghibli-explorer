import UIKit

class FavoritesViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var favoriteCollection: UICollectionView!
     var arrayFilms: NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        callFilmList()
    }
    
    func callFilmList() {
        if(!NetworkManager.isConnectedToNetwork()){
          print("No hay internet")
        }else{
            NetworkServices.sharedInstance.listfilms { (finished, response) in
                if finished{
                     let result: NSMutableArray = NSMutableArray(array: response)
                    self.arrayFilms = result
                    self.favoriteCollection.reloadData()
                }else{
                    print("Error en el servicio")
                }
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension FavoritesViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return  arrayFilms.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoriteCollectionViewCell", for: indexPath) as! favoriteCollectionViewCell
        cell.data = arrayFilms[indexPath.row] as? Dictionary<String,AnyObject>
        cell.setCell()
        cell.layer.cornerRadius = cell.frame.height * 0.1
        cell.clipsToBounds = true
        cell.layer.borderWidth = 0.2
        cell.layer.borderColor = UIColor.gray.cgColor
        return cell
    }
}
