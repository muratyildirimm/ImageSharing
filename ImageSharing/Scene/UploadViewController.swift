
import UIKit
import FirebaseStorage
import Firebase

class UploadViewController: UIViewController {
  
  // MARK: IBOutlet
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var uploadButtonOutletl: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // The button will not be active until the picture is selected.
    uploadButtonOutletl.isEnabled = false
    // Table View is clickable
    imageView.isUserInteractionEnabled = true
    let imageGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(goToGallery))
    imageView.addGestureRecognizer(imageGestureRecognizer)
  }
  
  @IBAction func uploadButton(_ sender: Any) {
    // Get a reference to the storage service using the default Firebase App
    let storage = Storage.storage()
    // Create a storage reference from our storage service
    let storageRef = storage.reference()
    // Create a child reference
    // imagesRef now points to "images"
    let mediaFolder = storageRef.child("media")
    let uuid = UUID().uuidString
    if let data = imageView.image?.jpegData(compressionQuality: 0.5) {
      // The id of each image needs to be unique
      var imageRef = mediaFolder.child("\(uuid).jpg")
      // burada da sadece resimleri tutmak için storage kısmına yüklüyoruz
      imageRef.putData(data,metadata: nil) { storageMetaData, error in
        if error != nil {
          self.popupAlert(title: "Title", message: "Message", actionStyle: .default)
        } else {
          // We are catching the url, it may be useful for us in the future.
          imageRef.downloadURL { url, error in
            if error != nil {
              self.popupAlert(title: "Title", message: "Message", actionStyle: .default)
            } else {
              let imageURL = url?.absoluteString
              let firestoreDatabase = Firestore.firestore()
              guard let email = Auth.auth().currentUser?.email else { return }
              guard let comment = self.textField.text else { return }
              guard let imageURL = imageURL else { return }
              // şurada cloud firestora yüklüyoruz
              let firestorePost = ["email": email, "comment": comment, "imageurl": imageURL, "date": FieldValue.serverTimestamp()] as [String : Any]
              firestoreDatabase.collection("Post").addDocument(data: firestorePost) { error in
                if error != nil {
                  self.popupAlert(title: "Error", message: "Firestore Upload Error", actionStyle: .default)
                } else {
                  self.imageView.image = UIImage(named: "select")
                  self.textField.text = ""
                  self.tabBarController?.selectedIndex = 0
                }
              }
            }
          }
        }
      }
    }
  }
}

extension UploadViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  @objc func goToGallery() {
    let pickerController = UIImagePickerController()
    pickerController.delegate = self
    pickerController.sourceType = .savedPhotosAlbum
    present(pickerController, animated: true, completion: nil)
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    self.imageView.image = info[.originalImage] as? UIImage
    uploadButtonOutletl.isEnabled = true
    self.dismiss(animated: true, completion: nil)
  }
}
