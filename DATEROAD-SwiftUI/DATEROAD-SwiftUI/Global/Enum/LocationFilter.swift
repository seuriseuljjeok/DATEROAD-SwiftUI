//
//  LocationFilter.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 11/26/24.
//

import Foundation

enum LocationFilter {
    
    enum Country: String, CaseIterable {
        
        case seoul = "서울"
        
        case gyeonggi = "경기"
        
        case incheon = "인천"
        
        var cities: [City] {
            return City.allCases.filter { $0.country == self }
        }
        
    }
    
    enum City: String, CaseIterable, Identifiable {
        case seoulEntire = "서울 전체"
        case gangnamSeocho = "강남/서초"
        case jamsilSongpaGangdong = "잠실/송파/강동"
        case kondaeSeongsuSeongdong = "건대/성수/왕십리"
        case jongnoJunggu = "종로/중구"
        case hongdaeHapjeongMapo = "홍대/합정/마포"
        case yeongdeungpoYeouido = "영등포/여의도"
        case yongsanItaewonHannam = "용산/이태원/한남"
        case yangcheonGangseoGuro = "양천/강서"
        case dongdaemunSeongbuk = "동대문/성북"
        case nowonDobongGangbuk = "노원/도봉/강북"
        
        case gyeonggiEntire = "경기 전체"
        case seongnam = "성남"
        case suwon = "수원"
        case goyangPaju = "고양/파주"
        case gimpo = "김포"
        case yonginHwaseong = "용인/화성"
        case anyangGwacheon = "안양/과천"
        case pocheonYangju = "포천/양주"
        case namyangjuUijeongbu = "남양주/의정부"
        case gwangjuIcheonYeoju = "과천/이천/여주"
        case gapyeongYangpyeong = "가평/양평"
        case gunpoUiwang = "군포/의왕"
        case hanamGuri = "하남/구리"
        case siheungGwangmyeong = "시흥/광명"
        case bucheonAnsan = "부천/안산"
        case dongducheonYeoncheon = "동두천/연천"
        case pyeongtaekOsanAnseong = "평택/오산/안성"
        
        case incheonEntire = "인천 전체"
        
        case unknown = "알 수 없음"
        
        // Country association
        var country: Country {
            switch self {
            case .seoulEntire, .gangnamSeocho, .jamsilSongpaGangdong,
                    .kondaeSeongsuSeongdong, .jongnoJunggu, .hongdaeHapjeongMapo,
                    .yeongdeungpoYeouido, .yongsanItaewonHannam, .yangcheonGangseoGuro,
                    .dongdaemunSeongbuk, .nowonDobongGangbuk:
                return .seoul
            case .gyeonggiEntire, .seongnam, .suwon, .goyangPaju, .gimpo,
                    .yonginHwaseong, .anyangGwacheon, .pocheonYangju, .namyangjuUijeongbu,
                    .gwangjuIcheonYeoju, .gapyeongYangpyeong, .gunpoUiwang, .hanamGuri,
                    .siheungGwangmyeong, .bucheonAnsan, .dongducheonYeoncheon,
                    .pyeongtaekOsanAnseong:
                return .gyeonggi
            case .incheonEntire:
                return .incheon
            default:
                return .seoul // Default for unknown cases
            }
        }
        
        // 영어 문자열 형식 반환
        var toEnglish: String {
            switch self {
            case .seoulEntire:
                return "SEOUL_ENTIRE"
            case .gangnamSeocho:
                return "GANGNAM_SEOCHO"
            case .jamsilSongpaGangdong:
                return "JAMSIL_SONGPA_GANGDONG"
            case .kondaeSeongsuSeongdong:
                return "KONDAE_SUNGSOO_WANGSIMNI"
            case .jongnoJunggu:
                return "JONGNO_JUNGRO"
            case .hongdaeHapjeongMapo:
                return "HONGDAE_HAPJEONG_MAPO"
            case .yeongdeungpoYeouido:
                return "YEONGDEUNGPO_YEOUIDO"
            case .yongsanItaewonHannam:
                return "YONGSAN_ITAEWON_HANNAM"
            case .yangcheonGangseoGuro:
                return "YANGCHEON_GANGSEO"
            case .dongdaemunSeongbuk:
                return "DONGDAEMUN_SEONGBUK"
            case .nowonDobongGangbuk:
                return "NOWON_DOBONG_GANGBUK"
            case .gyeonggiEntire:
                return "GYEONGGI_ENTIRE"
            case .seongnam:
                return "SEONGNAM"
            case .suwon:
                return "SUWON"
            case .goyangPaju:
                return "GOYANG_PAJU"
            case .gimpo:
                return "GIMPO"
            case .yonginHwaseong:
                return "YONGIN_HWASEONG"
            case .anyangGwacheon:
                return "ANYANG_GWACHEON"
            case .pocheonYangju:
                return "POCHEON_YANGJU"
            case .namyangjuUijeongbu:
                return "NAMYANGJU_UIJEONGBU"
            case .gwangjuIcheonYeoju:
                return "GWANGJU_ICHEON_YEOJU"
            case .gapyeongYangpyeong:
                return "GAPYEONG_YANGPYEONG"
            case .gunpoUiwang:
                return "GUNPO_UIWANG"
            case .hanamGuri:
                return "HANAM_GURI"
            case .siheungGwangmyeong:
                return "SIHEUNG_GWANGMYEONG"
            case .bucheonAnsan:
                return "BUCHEON_ANSAN"
            case .dongducheonYeoncheon:
                return "DONGDUCHEON_YEONCHEON"
            case .pyeongtaekOsanAnseong:
                return "PYEONGTAEK_OSAN_ANSEONG"
            case .incheonEntire:
                return "INCHEON_ENTIRE"
            default:
                return "UNKNOWN"
            }
            
        }
        
        // English to Korean Mapping
        static func fromEnglish(_ english: String) -> City {
            return City(rawValue: english) ?? .unknown
        }
        
        // Identifiable requirement
        var id: String {
            return self.rawValue
        }
        
    }
    
    static func countryData() -> [Country] {
        return Country.allCases
    }
    
}

struct LocationMapper {
    
    static func getCountryAndCity(from cityName: String) -> (country: LocationFilter.Country, city: LocationFilter.City)? {
        guard let city = LocationFilter.City.allCases.first(where: { $0.rawValue == cityName }) else {
            return nil
        }
        return (city.country, city)
    }
    
}
