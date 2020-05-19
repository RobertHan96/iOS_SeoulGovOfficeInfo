import Foundation

struct Office {
    var name : String
    var tel : String
    var address : String
    var publicSite : String
    var lat : Double
    var lng : Double
    }

class DatafetchManager {
    static let shared : DatafetchManager = DatafetchManager()

    let guOffice : [Office] = [
        Office(name: "종로", tel: "02-2148-1111", address: "서울특별시 종로구 삼봉로43",
               publicSite: "https://www.jongno.go.kr/portalMain.do",lat: 37.572896, lng: 126.979254 ),
        Office(name: "중구", tel: "02-155-6144", address: "서울특별시 중구 창경궁로 17(예관동)",
               publicSite: "http://www.junggu.seoul.kr/index.jsp",lat: 37.5636204, lng: 126.997976 ),
        Office(name: "성동", tel: "02-2286-5083", address: "서울특별시 중구 창경궁로 17(예관동)",
               publicSite: "http://www.sd.go.kr/sd/newMapInfo.do?mCode=13G030050000&displayId=&op=way",
               lat: 37.563132, lng: 127.036611),
        Office(name: "용산", tel: "02-2199-6114", address: "서울특별시 용산구 녹사평대로 150(이태원동)",
               publicSite: "http://www.yongsan.go.kr/index.htm",lat: 37.532556, lng: 126.990333),
        Office(name: "광진", tel: "02-450-1114", address: "울특별시 광진구 자양1동 자양로 117",
               publicSite: "https://www.gwangjin.go.kr/index1.html",lat: 37.538627, lng: 127.082517 ),
        Office(name: "동대문", tel: "02-2127-5000", address: "서울특별시 동대문구 용두동 천호대로 145",
               publicSite: "http://www.ddm.go.kr/",lat: 37.574220, lng: 127.039603 ),
        Office(name: "중랑", tel: "02-2094-0114", address: "서울특별시 중랑구 신내동 662",
               publicSite: "https://www.jungnang.go.kr/popup_index2.jsp",lat: 37.606534, lng: 127.092544 ),
        Office(name: "성북", tel: "02-2241-3114", address: "서울특별시 성북구 삼선동5가 보문로 168",
               publicSite: "https://www.sb.go.kr/",lat: 37.589332, lng: 127.016689 ),
        Office(name: "강북", tel: "02-901-6114", address: "서울특별시 강북구 수유동 도봉로89길 13",
               publicSite: "http://www.gangbuk.go.kr/intro_gb.jsp",lat: 37.639553, lng: 127.025405 ),
        Office(name: "도봉", tel: "02-2091-2120", address: "서울특별시 도봉구 방학1동 마들로 656",
               publicSite: "http://www.dobong.go.kr/",lat: 37.668684, lng: 127.046882 ),
        Office(name: "노원", tel: "02-155-6144", address: "서울특별시 노원구 상계6.7동 노해로 437)",
               publicSite: "https://www.nowon.kr/www/index.do",lat: 37.654047, lng: 127.056477 ),
        Office(name: "은평", tel: "02-351-6114", address: "서울특별시 은평구 녹번동 은평로 195",
               publicSite: "http://www.eunpyeong.seoul.kr/",lat: 37.602746, lng: 126.929369 ),
        Office(name: "서대문", tel: "02-330-1301", address: "서울특별시 서대문구 연희동 연희로 248",
               publicSite: "http://www.sdm.go.kr/index.do",lat: 37.579083, lng: 126.936790 ),
        Office(name: "마포", tel: "02-3153-8114", address: "서울특별시 마포구 성산2동 월드컵로 212)",
               publicSite: "https://www.mapo.go.kr/site/main/home",lat: 37.566148, lng: 126.901838 ),
        Office(name: "양천", tel: "02-2620-3114", address: "서울특별시 양천구 신정동 목동동로 105",
               publicSite: "http://www.yangcheon.go.kr/site/yangcheon/main.do",lat: 37.516942, lng: 126.866779 ),
        Office(name: "강서", tel: "02-2600-6114", address: "서울특별시 강서구 화곡6동 화곡로 302",
               publicSite: "http://www.gangseo.seoul.kr/new_portal/index.jsp",lat: 37.550853, lng: 126.849463 ),
        Office(name: "구로", tel: "02-860-2114", address: "서울특별시 구로구 구로동 가마산로 245",
               publicSite: "http://www.guro.go.kr/",lat: 37.495368, lng: 126.887146 ),
        Office(name: "금천", tel: "02-2627-2114", address: "서울특별시 금천구 시흥대로73길 70",
               publicSite: "https://www.geumcheon.go.kr/portal/index.do",lat: 37.456560, lng: 126.895360 ),
        Office(name: "영등포", tel: "02-2670-4114", address: "서울특별시 영등포구 당산동3가 당산로 123",
               publicSite: "https://www.ydp.go.kr/www/index.do",lat: 37.526342, lng: 126.896067),
        Office(name: "동작", tel: "02-820-1114", address: "서울특별시 동작구 노량진2동 장승배기로 161",
               publicSite: "https://www.dongjak.go.kr/",lat: 37.512380, lng: 126.939704 ),
        Office(name: "관악", tel: "02-879-5000", address: "서울특별시 관악구 관악로 145)",
               publicSite: "http://www.gwanak.go.kr/",lat: 37.477959, lng: 126.951639 ),
        Office(name: "서초", tel: "02-2155-6114", address: "서울특별시 서초구 서초2동 남부순환로 2584",
               publicSite: "https://www.seocho.go.kr/site/seocho/main.do",lat: 37.483548, lng: 127.032361 ),
        Office(name: "강남", tel: "02-3423-5110", address: "서울특별시 강남구 삼성2동 학동로 426",
               publicSite: "http://www.gangnam.go.kr/index.htm",lat: 37.517268, lng: 127.047662 ),
        Office(name: "송파", tel: "02-2147-2000", address: "서울특별시 송파구 잠실6동 올림픽로 326",
               publicSite: "http://www.songpa.go.kr/index.jsp",lat: 37.514623, lng: 127.105849 ),
        Office(name: "강동", tel: "1577-1188", address: "서울특별시 강동구 성내동 성내로 25",
               publicSite: "https://www.gangdong.go.kr/",lat: 37.530168, lng: 127.123785 )
        ]
    
    let taxOffice : [Office] = [
        Office(name: "종로", tel: "02-760-9200", address: "서울특별시 종로구 낙원동 삼일대로30길 22",
               publicSite: "https://s.nts.go.kr/jn/Default.asp",lat: 37.5738483, lng: 126.9866872 ),
        Office(name: "중부\n(중구 일부)", tel: "02-2260-9200", address: "서울특별시 중구 명동 소공로 70",
               publicSite: "https://s.nts.go.kr/jb/Default.asp",lat: 37.561742, lng: 126.979958 ),
        Office(name: "남대문\n(중구 일부)", tel: "02-2260-0200", address: "서울특별시 중구 저동1가 삼일대로 340",
               publicSite: "https://s.nts.go.kr/ndm/Default.asp",lat: 37.564956, lng: 126.9859743 ),
        Office(name: "용산", tel: "02-748-8200", address: "서울특별시 용산구 한강로3가 서빙고로24길 15",
               publicSite: "https://s.nts.go.kr/yos/Default.asp",lat: 37.5232664, lng: 126.9664774 ),
        Office(name: "성북", tel: "02-760-8200", address: "서울특별시 성북구 삼선동3가 삼선교로16길 13",
               publicSite: "https://s.nts.go.kr/sb/Default.asp",lat: 37.5880115,lng: 127.0086131),
        Office(name: "서대문", tel: "02-2287-4200", address: "서울특별시 서대문구 미근동 충정로 60 KT&G 서대문타워 13층, 14층",
               publicSite: "https://s.nts.go.kr/sdm/Default.asp",lat: 37.5638356,lng: 126.9638821 ),
        Office(name: "도봉", tel: "02-944-0200", address: "서울특별시 강북구 미아동 도봉로 117",
               publicSite: "https://s.nts.go.kr/db/Default.asp",lat: 37.6197001,lng: 127.0260522),
        Office(name: "노원/창동", tel: "02-3499-0200", address: "서울특별시 도봉구 창동 15)",
               publicSite: "https://s.nts.go.kr/nw/Default.asp",lat: 37.6533352,lng: 127.0489933),
        Office(name: "은평", tel: "02-2132-9200", address: "서울특별시 은평구 갈현2동 서오릉로 7",
               publicSite: "https://s.nts.go.kr/ep/Default.asp",lat: 37.6076541,lng: 126.9127749),
        Office(name: "마포", tel: "02-705-7200", address: "서울특별시 마포구 신수동 독막로 234",
               publicSite: "https://s.nts.go.kr/menu/main/main1.asp?tax_code=105",lat: 37.5465131,lng: 126.9372915),
        Office(name: "영등포", tel: "02-2630-9200", address: "서울특별시 영등포구 당산2동 선유동1로 38",
               publicSite: "https://s.nts.go.kr/ydp/Default.asp",lat: 37.525237,lng: 126.8905959),
        Office(name: "강서", tel: "02-2630-4200", address: "서울특별시 강서구 가양1동 마곡서1로 60",
               publicSite: "https://s.nts.go.kr/gs/Default.asp",lat: 37.5621683,lng: 126.819343),
        Office(name: "양천", tel: "02-2650-9200", address: "서울특별시 양천구 신정동 목동동로 165",
               publicSite: "https://s.nts.go.kr/yc/Default.asp",lat: 337.5205149,lng: 126.8677649),
        Office(name: "구로", tel: "02-2630-7200", address: "서울특별시 영등포구 문래동 경인로 778)",
               publicSite: "https://s.nts.go.kr/gr/Default.asp",lat: 37.5134612,lng: 126.8976233),
        Office(name: "동작\n(영등포 일부)", tel: "02-840-9200", address: "서울특별시 영등포구 신길6동 대방천로 259",
               publicSite: "https://s.nts.go.kr/dj/Default.asp",lat: 37.4990382,lng: 126.9176127),
        Office(name: "금천", tel: "02-850-4200", address: "서울특별시 금천구 독산3동 953-9",
               publicSite: "https://s.nts.go.kr/gc/Default.asp",lat: 37.4779929,lng: 126.8975965),
        Office(name: "관악", tel: "02-2173-4200", address: "서울특별시 관악구 신원동 문성로 187",
               publicSite: "https://s.nts.go.kr/ga/Default.asp",lat: 37.4793089,lng: 126.9221223),
        Office(name: "강남\n(강남 일부)", tel: "02-519-4200", address: "서울특별시 강남구 청담동 학동로 425",
               publicSite: "https://s.nts.go.kr/gn/Default.asp",lat: 37.5187631,lng: 127.0447467),
        Office(name: "삼성\n(강남 일부)", tel: "02-3011-7200", address: "서울특별시 강남구 테헤란로 114 1,5,6,9,10층",
               publicSite: "https://s.nts.go.kr/ss/Default.asp",lat: 37.498235,lng: 127.0294308),
        Office(name: "역삼\n(강남 일부)", tel: "02-3011-8200", address: "서울특별시 강남구 테헤란로 114 역삼빌딩 7, 8층 및 9층 일부",
               publicSite: "https://s.nts.go.kr/ys/Default.asp",lat: 37.498235,lng: 127.0294308),
        Office(name: "반포\n(서초 일부)", tel: "02-590-4200", address: "서울특별시 서초구 방배동 방배로 163",
               publicSite: "https://s.nts.go.kr/bp/Default.asp",lat: 37.4880103,lng: 126.9907032),
        Office(name: "서초", tel: "02-3011-6200", address: "서울특별시 강남구 테헤란로 114 3,4층",
               publicSite: "https://s.nts.go.kr/sc/Default.asp",lat: 37.498235,lng: 127.0294308),
        Office(name: "송파\n(송파 일부)", tel: "02-2224-9200", address: "서울특별시 송파구 풍납2동 388-6",
               publicSite: "https://s.nts.go.kr/menu/main/main2.asp?tax_code=215",lat: 37.5266574,lng: 127.1113521),
        Office(name: "잠실\n(송파 일부)", tel: "02-2055-9200", address: "서울특별시 송파구 강동대로 62",
               publicSite: "https://s.nts.go.kr/js/Default.asp",lat: 37.526770, lng: 127.113647),
        Office(name: "성동/광진", tel: "02-460-4200", address: "서울특별시 성동구 광나루로 297(송정동)",
               publicSite: "https://s.nts.go.kr/menu/intro/intro.asp?tax_code=206#map",lat: 37.548497, lng: 127.062846 ),
        Office(name: "동대문", tel: "02-958-0200", address: "서울특별시 동대문구 약령시로 159",
               publicSite: "https://s.nts.go.kr/ddm/Default.asp",lat: 37.5832049,lng: 127.0456347),
        Office(name: "중랑", tel: "02-2170-0200", address: "서울특별시 중랑구 상봉동 137-1",
               publicSite: "https://s.nts.go.kr/jr/Default.asp",lat: 37.5927376,lng: 127.0702408),
        Office(name: "강동", tel: "02-2224-0200", address: "서울특별시 강동구 길동 천호대로 1139",
               publicSite: "https://s.nts.go.kr/gd/Default.asp",lat: 37.5344516,lng: 127.1359535)
        ]
        
                            
    let guList : [String] = ["종로", "중구", "성동", "용산", "광진", "동대문", "중랑", "성북", "강북",
                            "도봉", "노원", "은평", "서대문", "마포", "양천", "강서", "구로", "금천",
                            "영등포", "동작", "관악", "서초", "강남", "송파", "강동"
                            ]
    let taxList : [String] = ["종로", "중구(중구 일부)", "남대문(중구 일부)", "용산", "성북", "서대문",                           "강북", "은평",  "마포", "영등포", "강서", "양천", "구로",
                              "동작(영등포 일부)","금천", "관악", "강남(강남 일부)", "삼성(강남 일부)",
                                "역삼(강남 일부", "반포(서초 일부)", "서초(서초 일부)", "송파(송파 일부)",
                                "잠실(송파 일부)", "성동/광진", "강북", "노원/창동",  "동대문", "중랑", "강동"]
    
    let guItems : [String] = ["여권 발급", "지방세 신고", "차량 등록", "복지 상담", "도로 정비", "폐기물"]
    let taxItems : [String] = ["연말정산", "부가가치세 신고", "상속", "세무 상담"]

    var officeInfo : [Office] = [] {
        didSet {
            print("fetch is completed")
        }
    }

    init() {
        
    }

    func fetchOfficeData(completion : @escaping () -> Void) {
        let junggu : Office = Office(name: "중구", tel: "02-155-6144",
                                     address: "서울시 중구 창경궁로 17 (예관동)", publicSite: "http://www.junggu.seoul.kr/index.jsp", lat: 37.5636204, lng:126.997976 )
        officeInfo.append(junggu)
        completion()
        }
    }
