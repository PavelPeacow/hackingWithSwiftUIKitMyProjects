//
//  AddImageViewController.swift
//  PhotoChallenge
//
//  Created by Павел Кай on 14.08.2022.
//

import UIKit

class AddImageViewController: UIViewController, UIImagePickerControllerDelegate, UITextFieldDelegate, UINavigationControllerDelegate {
    
    var imageName = ""
    
    var images = [imageItem]()
    
    var completionHandler: (([imageItem]) -> Void)?
    
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter image title here"
        textField.textAlignment = .center
        textField.textColor = .black
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 10
        textField.delegate = self
        return textField
    }()
    
    lazy var imagePicture: UIImageView = {
        let imagePicture = UIImageView()
        imagePicture.translatesAutoresizingMaskIntoConstraints = false
        return imagePicture
    }()
    
    lazy var rectange: UIView = {
        let rectange = UIView()
        rectange.translatesAutoresizingMaskIntoConstraints = false
        rectange.backgroundColor = .orange
        rectange.layer.borderColor = UIColor.black.cgColor
        rectange.layer.borderWidth = 2
        return rectange
    }()
    
    lazy var submitButton: UIButton = {
        let submitButton = UIButton()
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(UIColor.black, for: .normal)
        submitButton.addTarget(self, action: #selector(submitImage), for: .touchUpInside)
        
        return submitButton
    }()
    
    lazy var takePhotoButton: UIButton = {
        let takePhotoButton = UIButton()
        takePhotoButton.translatesAutoresizingMaskIntoConstraints = false
        takePhotoButton.setTitle("Take photo", for: .normal)
        takePhotoButton.setTitleColor(UIColor.black, for: .normal)
        takePhotoButton.addTarget(self, action: #selector(takePicture), for: .touchUpInside)
        
        return takePhotoButton
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .orange
        
        view.addSubview(rectange)
        rectange.addSubview(imagePicture)
        
        view.addSubview(takePhotoButton)
        
        view.addSubview(textField)
        view.addSubview(submitButton)
        
        setConstraints()
    }
    
}

extension AddImageViewController {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.editedImage] as? UIImage else {
            print("Image Error")
            return
        }
        
        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
        
        self.imageName = imageName
        imagePicture.image = image
        
        dismiss(animated: true)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    @objc func takePicture() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
        
    @objc func submitImage() {
        let imageItem = imageItem(imageName: imageName, captionString: textField.text ?? "")
        images.append(imageItem)
        print(images)
        completionHandler?(images)
        
        dismiss(animated: true)
        print("all set")
    }
    
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            imagePicture.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imagePicture.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            imagePicture.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            imagePicture.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            
            rectange.centerXAnchor.constraint(equalTo: imagePicture.centerXAnchor),
            rectange.centerYAnchor.constraint(equalTo: imagePicture.centerYAnchor),
            rectange.heightAnchor.constraint(equalTo: imagePicture.heightAnchor),
            rectange.widthAnchor.constraint(equalTo: imagePicture.widthAnchor),
            
            takePhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            takePhotoButton.topAnchor.constraint(equalTo: imagePicture.bottomAnchor),
            
            textField.bottomAnchor.constraint(equalTo: submitButton.topAnchor, constant: -30),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.widthAnchor.constraint(equalToConstant: 300),
            
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -50)
           
        ])
    }
}
