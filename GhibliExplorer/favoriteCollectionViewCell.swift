import UIKit

class favoriteCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgFilm: UIImageView!
    @IBOutlet weak var lblTittle: UILabel!
    @IBOutlet weak var lblDirector: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    
    var data: Dictionary<String,AnyObject>!
    
    func setCell(){
        let tittle = self.data["title"] as! String
        let director = self.data["director"] as! String
        let releaseDate = self.data["release_date"] as! String
        
        lblTittle.text = tittle
        lblDirector.text = director
        lblReleaseDate.text = releaseDate
        
    }
}
