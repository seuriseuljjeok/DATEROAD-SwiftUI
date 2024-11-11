//
//  StringLiterals.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 10/18/24.
//

import Foundation

enum LOGIN {
        
    static let KAKAO_LOGIN = "카카오 로그인"
    
    static let APPLE_LOGIN = "Apple ID로 로그인"
    
    static let PRIVACY_POLICY = "개인정보처리방침"
    
}

enum MYPAGE {
    
    static let GO_TO_POINTS_DETAIL = "포인트 내역 보기"
    
    static let MYCOURSE = "내가 등록한 코스"
    
    static let POINTSYSTEM = "포인트 제도 소개"
    
    static let INQUIRY = "문의하기"
    
    static let LOGOUT = "로그아웃"
    
    static let WITHDRAWAL = "탈퇴하기"
    
    static let ALERT_WITHDRAWAL = "탈퇴"
    
}

enum NAVBAR {
    
    static let MYPAGE = "마이페이지"
    
}

enum POINTSYSTEM {
    
    static let POINTSYSTEM = "포인트 제도 소개"
    
    static let MAINTITLE = "데이트로드는 포인트로\n데이트 코스를 열람할 수 있어요."
    
    static let SUBTITLE = "포인트는 데이트 코스를 등록하면 얻을 수 있어요."
    
    static let FIRSTMAINSYSTEM = "데이트 코스를 등록하면\n포인트를 얻을 수 있어요"
    
    static let FIRSTSUBSYSTEM = "데이트 코스를 자랑하고 포인트를 받아보세요."
    
    static let SECONDMAINSYSTEM = "처음 3번은 무료로\n데이트 코스를 열람할 수 있어요"
    
    static let SECONDSUBSYSTEM = "무료 찬스를 사용해 다른 데이트를 열람하세요."
    
    static let THIRDMAINSYSTEM = "쌓인 포인트로\n다양한 데이트 코스를 둘러보세요"
    
    static let THIRDSUBSYSTEM = "다른 커플들의 데이트, 궁금하지 않으신가요?"
    
    static let FOURTHMAINSYSTEM = "모인 포인트는 데이트 장소를\n예약할 때 현금처럼 사용 가능해요"
    
    static let FOURTHSUBSYSTEM = "추후 만들어질 기능을 기대해주세요!"
    
    static let POINT = "포인트"

    static let DATECOURSE = "데이트 코스"
    
}

enum MYCOURSE {
    
    static let MYREGISTEREDCOURSE = "내가 등록한 코스"
    
}

enum EMPTY {
    
    static let MYREGISTEREDCOURSE = "아직 등록한 코스가 없어요!"
    
}

enum WEBVIEW {
    
    static let INQUIRY_URL = "https://dateroad.notion.site/1055d2f7bfe94b3fa6c03709448def21?pvs=4"
    
}

enum ALERT {
    
    static let CONFIRM = "확인했어요"
    
    static let CANCEL = "취소"
    
    static let LOGOUT = "로그아웃"
    
    static let LOGOUT_PRIMARY_TITLE = "로그아웃 하시겠어요?"

    static let WITHDRAWAL_PRIMARY_TITLE = "정말로 탈퇴하시겠어요?"

    static let WITHDRAWAL_SECONDARY_TITLE = "삭제된 계정은 복구하실 수 없어요"

    static let WITHDRAWAL = "탈퇴"

}

enum PROFILE {
    
    static let MY_PROFILE = "내 프로필"
    
    static let EDIT_PROFILE = "프로필 변경"
    
    static let NICKNAME = "닉네임"
    
    static let NICKNAME_CONDITION = "(한글, 영문, 숫자만 가능)"
    
    static let DOUBLE_CHECK = "중복확인"
    
    static let MY_TENDENCY = "나의 데이트 성향"
    
    static let REGISTER_PROFILE = "프로필 등록하기"
    
    static let TAG_COUNT_ERROR = "최소 1개, 최대 3개를 선택해주세요."
    
    static let NICKNAME_COUNT_ERROR = "최소 2글자를 입력해야 해요"

    static let NICKNAME_USED_ERROR = "이미 사용 중인 닉네임이에요"
    
    static let VALID_NICKNAME = "사용 가능한 닉네임이에요"

}

enum PLACEHOLDER {
    
    static let NICKNAME = "닉네임을 입력해 주세요"
    
}

enum HOME {
    
    static let EMPTY_TICKET_TITLE = "다가오는 데이트 일정이 없어요"
    
    static let EMPTY_TICKET_SUBTITLE = "일정을 등록하러 가볼까요?"
    
    static let HOT_DATE_TITLE = " 오늘은\n이런 데이트 어떠세요?"
    
    static let HOT_DATE_SUB_TITLE = "후기 보장 HOT 데이트 코스 둘러보기"
    
    static let GO_TO_DATE = "더보기"
        
}

enum PRICETAG {
    
    static let UNDER30K = "3만원 이하"
    
    static let UNDER50K = "5만원 이하"

    static let UNDER100K = "10만원 이하"

    static let OVER100K = "10만원 초과"

}
