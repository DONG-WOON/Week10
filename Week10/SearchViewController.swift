
//
//  SearchViewController.swift
//  Week10
//
//  Created by 서동운 on 9/21/23.
//

import UIKit

//final class SearchViewController: UIViewController {
//
//    let scrollView = UIScrollView()
//    let stackView = UIStackView()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        configureHierarchy()
//        configureViews()
//        configureLayout()
//        configureStackView()
//    }
//
//    func configureHierarchy() {
//        view.addSubview(scrollView)
//
//        scrollView.addSubview(stackView)
//    }
//
//    func configureLayout() {
//        scrollView.snp.makeConstraints { make in
//            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
//            make.height.equalTo(70)
//        }
//
//        stackView.snp.makeConstraints { make in
//            make.edges.equalTo(scrollView)
//            make.height.equalTo(70)
////            make.size.equalTo(scrollView)
//        }
//    }
//
//    func configureViews() {
//        view.backgroundColor = .systemBackground
//
//        scrollView.backgroundColor = .lightGray
//
//        stackView.spacing = 10
//        stackView.axis = .horizontal
//    }
//
//    func configureStackView() {
//        let label0 = UILabel()
//        label0.text = "안녕하세요"
//        label0.backgroundColor = .cyan
//        label0.textColor = .white
//        stackView.addArrangedSubview(label0)
//
//        let label1 = UILabel()
//        label1.text = "반갑습니다"
//        label1.textColor = .white
//        stackView.addArrangedSubview(label1)
//
//        let label2 = UILabel()
//        label2.text = "Hello world"
//        label2.textColor = .white
//        stackView.addArrangedSubview(label2)
//
//        let label3 = UILabel()
//        label3.text = "hello new world"
//        label3.textColor = .white
//        stackView.addArrangedSubview(label3)
//
//        let label4 = UILabel()
//        label4.text = "hello swift"
//        label4.textColor = .white
//        stackView.addArrangedSubview(label4)
//    }
//}
