////
////  SearchViewController_ContentLayoutGuide.swift
////  Week10
////
////  Created by 서동운 on 9/21/23.
////
//
//import Foundation
//
//class SearchViewController: UIViewController {
//
//    let scrollView = UIScrollView()
//    let contentView = UIView()
//
//    let imageView = UIImageView()
//    let textLabel = UILabel()
//    let button = UIButton()
//    private let refresh = UIRefreshControl()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        configureHierarchy()
//        configureViews()
//        configureLayout()
//
//    }
//
//    @objc func reload() {
//        refresh.endRefreshing()
//    }
//
//    func configureHierarchy() {
//        view.addSubview(scrollView)
//        scrollView.addSubview(contentView)
//
//
//        contentView.addSubview(imageView)
//        contentView.addSubview(textLabel)
//        contentView.addSubview(button)
//    }
//
//    func configureLayout() {
//        scrollView.snp.makeConstraints { make in
//            make.edges.equalTo(view.safeAreaLayoutGuide)
//            make.width.equalTo(view)
//        }
//
//        contentView.snp.makeConstraints { make in
//            make.edges.equalTo(scrollView.contentLayoutGuide)
////            make.width.equalTo(scrollView.frameLayoutGuide) // or
//            make.width.equalTo(scrollView.snp.width)
//        }
//
//        imageView.snp.makeConstraints { make in
//            make.top.horizontalEdges.equalTo(contentView)
//            make.height.equalTo(300)
//        }
//
//        textLabel.snp.makeConstraints { make in
//            make.top.equalTo(imageView.snp.bottom).offset(50)
//            make.horizontalEdges.equalTo(contentView)
//        }
//
//        button.snp.makeConstraints { make in
//            make.top.equalTo(textLabel.snp.bottom)
//            make.height.equalTo(80)
//            make.horizontalEdges.bottom.equalTo(contentView)
//        }
//    }
//
//    func configureViews() {
//        view.backgroundColor = .systemBackground
//        refresh.addTarget(self, action: #selector(reload), for: .valueChanged)
//        scrollView.refreshControl = refresh
//
//        contentView.backgroundColor = .lightGray
//
//        imageView.backgroundColor = .red
//
//        textLabel.backgroundColor = .magenta
//        textLabel.text = String(repeating: "hello world ", count: 500)
//        textLabel.numberOfLines = 0
//
//        button.setTitle("new", for: .normal)
//        button.backgroundColor = .systemIndigo
//    }
//}
