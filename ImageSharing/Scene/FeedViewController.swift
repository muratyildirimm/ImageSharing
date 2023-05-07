
import UIKit
import Firebase
import SDWebImage

class FeedViewController: UIViewController {

  // MARK: IBOutlet
  @IBOutlet weak var tableView: UITableView!
  // MARK: Variables
  //var emailList = [String]()
  //var commentList = [String]()
  //var imageList = [String]()
  var postList = [Post]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      getDataFromFirestore()
    }
    

  func getDataFromFirestore() {
    let db = Firestore.firestore()
    // db.collection("Post).whereField("email", isEqualTo: "murat123" yaparsan sadece o hesabın paylaşımlarını getirir
    let dbRef = db.collection("Post").order(by: "date", descending: true)
    dbRef.addSnapshotListener { snapshot, error in
      if error != nil {
        self.popupAlert(title: "Title", message: "Message", actionStyle: .default)
      } else {
        if snapshot?.isEmpty != true && snapshot != nil {
         // self.imageList.removeAll(keepingCapacity: false)
         // self.emailList.removeAll(keepingCapacity: false)
         // self.commentList.removeAll(keepingCapacity: false)
          self.postList.removeAll(keepingCapacity: false)
          for document in snapshot!.documents {
           // let documentID = document.documentID
            guard let imageURL = document.get("imageurl") as? String else { return }
            guard let comment = document.get("comment") as? String else { return }
            guard let email = document.get("email") as? String else { return }
            var post = Post(email: email, comment: comment, imageUrl: imageURL)
            self.postList.append(post)
           /* if let imageURL = document.get("imageurl") as? String {
              self.imageList.append(imageURL)
            }
            if let comment = document.get("comment") as? String {
              self.commentList.append(comment)
            }
            if let email = document.get("email") as? String {
              self.emailList.append(email)
            }*/
           }
          self.tableView.reloadData()
        } else {
          self.popupAlert(title: "Title", message: "Message", actionStyle: .default)
        }
      }
    }
    
    
  }

}


extension FeedViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    postList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
    cell.emailLabel.text = postList[indexPath.row].email
    cell.commentLabel.text = postList[indexPath.row].comment
    cell.postImageView.sd_setImage(with: URL(string: postList[indexPath.row].imageUrl))
    return cell
  }
  
  
}
