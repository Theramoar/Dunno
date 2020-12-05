//
//  ChatViewController.swift
//  Dunno
//
//  Created by Misha Kuznecov on 30/11/2020.
//

import UIKit


enum Direction: String {
    case outbound = "outbound"
    case inbound = "inbound"
}


class MessageCellViewModel: CellViewModelType {
    private let message: SavedMessage

    var messageText: String {
        message.body ?? ""
    }

    var messageDirection: Direction {
        message.getDirection()
    }

    var messageTime: String {
        message.getTime()
    }

    var image: UIImage? {
        guard let string = message.body,
              let data = Data(base64Encoded: string, options: .ignoreUnknownCharacters)
        else { return nil }
        return UIImage(data: data)
    }

    init(message: SavedMessage) {
        self.message = message
    }
}

class MessageCell: UITableViewCell {
    var messageViewRightAnchor: NSLayoutConstraint!
    var messageViewLeftAnchor: NSLayoutConstraint!
    var messageViewFloatingRightAnchor: NSLayoutConstraint!
    var messageViewFloatingLeftAnchor: NSLayoutConstraint!

    var messageViewHeightAnchor: NSLayoutConstraint?

    var viewModel: MessageCellViewModel! {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            processViewModel(viewModel)
        }
    }
    @IBOutlet private var messageStackView: UIStackView!
    @IBOutlet private var messageTextView: UITextView!
    @IBOutlet private var messageView: UIView!
    @IBOutlet private var timeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.messageView.layer.cornerRadius = messageView.frame.height / 5
        messageTextView.translatesAutoresizingMaskIntoConstraints = false
        messageView.translatesAutoresizingMaskIntoConstraints = false
//        messageImageView.translatesAutoresizingMaskIntoConstraints = false
        messageStackView.translatesAutoresizingMaskIntoConstraints = false

        messageViewLeftAnchor = messageStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
        messageViewRightAnchor = messageStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)

        messageViewFloatingLeftAnchor = messageStackView.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 100)
        messageViewFloatingRightAnchor = messageStackView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -100)
    }

    private func processViewModel(_ viewModel: MessageCellViewModel) {
        timeLabel.text = viewModel.messageTime
        displayDirection(viewModel)
        displayType(viewModel)
    }

    private func displayDirection(_ viewModel: MessageCellViewModel) {
        switch viewModel.messageDirection {
        case .inbound:
            messageView.backgroundColor = .lightGray
            messageTextView.textColor = .black
            messageViewRightAnchor.isActive = false
            messageViewFloatingLeftAnchor.isActive = false
            messageViewLeftAnchor.isActive = true
            messageViewFloatingRightAnchor.isActive = true
            messageViewHeightAnchor?.isActive = false
            timeLabel.textAlignment = .left
        case .outbound:
            messageView.backgroundColor = .systemTeal
            messageTextView.textColor = .white
            messageViewLeftAnchor.isActive = false
            messageViewFloatingRightAnchor.isActive = false
            messageViewRightAnchor.isActive = true
            messageViewFloatingLeftAnchor.isActive = true
            messageViewHeightAnchor?.isActive = false
            timeLabel.textAlignment = .right
        }
    }

    private func displayType(_ viewModel: MessageCellViewModel) {
//        switch viewModel.messageType {
//        case .mms:
//            if let image = viewModel.image {
//                messageTextView.isHidden = true
//                messageImageView.isHidden = false
//                messageImageView.image = image
//                calculateImageHeightConstraint(image: image)
//                messageViewHeightAnchor?.isActive = true
//            } else {
//                messageImageView.isHidden = true
//                messageImageView.image = nil
//                messageTextView.isHidden = false
//                messageTextView.text = "MMS with previously sent image. Sent images are not fetched from the server"
//                messageTextView.textColor = .red
//                messageViewHeightAnchor?.isActive = false
//            }
//        case .sms:
//            messageImageView.isHidden = true
//            messageImageView.image = nil
            messageTextView.isHidden = false
            messageTextView.text = viewModel.messageText
            messageTextView.textColor = .white
            messageViewHeightAnchor?.isActive = false
//        }
    }

    private func calculateImageHeightConstraint(image: UIImage) {
        //Message View Maximum width = Screen Width - Maximum Size of Left Anchor (100) - Size of Right anchor (10)
        let leftAnchor = abs(messageViewFloatingLeftAnchor.constant)
        let rightAnchor = abs(messageViewRightAnchor.constant)
        let maximumWidth = UIScreen.main.bounds.width - leftAnchor - rightAnchor
        var contentViewHeight = image.size.height * maximumWidth / image.size.width
        contentViewHeight.round()
        messageViewHeightAnchor = messageView.heightAnchor.constraint(lessThanOrEqualToConstant: contentViewHeight)
    }
}
