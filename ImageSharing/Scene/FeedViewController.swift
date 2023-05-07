
import UIKit
import Firebase

class FeedViewController: UIViewController {

  // MARK: IBOutlet
  @IBOutlet weak var tableView: UITableView!
  // MARK: Variables
  var emailList = [String]()
  var commentList = [String]()
  var imageList = [String]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      getDataFromFirestore()
    }
    

  func getDataFromFirestore() {
    let db = Firestore.firestore()
    let dbRef = db.collection("Post")
    dbRef.addSnapshotListener { snapshot, error in
      if error != nil {
        self.popupAlert(title: "Title", message: "Message", actionStyle: .default)
      } else {
        if snapshot?.isEmpty != true && snapshot != nil {
          for document in snapshot!.documents {
           // let documentID = document.documentID
            if let imageURL = document.get("imageurl") as? String {
              self.imageList.append(imageURL)
            }
            if let comment = document.get("comment") as? String {
              self.commentList.append(comment)
            }
            if let email = document.get("email") as? String {
              self.emailList.append(email)
            }
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
     emailList.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
    cell.emailLabel.text = emailList[indexPath.row]
    cell.commentLabel.text = commentList[indexPath.row]
    cell.postImageView.image = UIImage(named: "select")
    return cell
  }
  
  
}
