# 대전 5반 Team_5 - Back-End PJT

## 👪 팀 구성

👨 **Teammate_01** : **우승빈** (Woo Seungbeen)

👩 **Teammate_02** : **조해린** (Cho Haerin)

<br/>


## 📺 주요 화면

### 1. 메인 화면
<img width="80%" src="https://user-images.githubusercontent.com/104357560/225957297-abb13927-fa39-4cf7-90f7-1483c2801ebf.png">

<img width="80%" src="https://user-images.githubusercontent.com/104357560/225957696-99c3cc8c-8342-4ef6-8242-3a04543a4771.png">


- 설명 : 관광지 검색하러가기 버튼을 누르면 지역별 관광지 정보를 검색할 수 있는 페이지로 이동한다. 아래는 추천 장소 3곳을 표시했다.
추천 장소의 상세보기 버튼을 클릭하면, 검색창으로 이동하여 자동적으로 해당 장소의 정보와 지도상의 위치를 표시하도록 하였다.

### 2. 지역별 관광지 정보 수집 - 관광지, 숙박, 음식점, 문화시설, 공연, 여행코스, 쇼핑 조회
<img width="80%" src="https://user-images.githubusercontent.com/104357560/225958402-a96be9bb-21ac-473c-bb98-30b7a723f8a2.png">
<img width="80%" src="https://user-images.githubusercontent.com/104357560/225958460-875f481d-d51e-4be1-b58f-77defdb79fb6.png">
<img width="80%" src="https://user-images.githubusercontent.com/104357560/225958475-3d2e5af5-2617-4fb4-b57b-a27cbcad6e7e.png">
<img width="80%" src="https://user-images.githubusercontent.com/104357560/225958495-2099e86f-947a-4db4-8674-85f85d09966e.png">

- 설명 : 검색 페이지 로드 시 데이터베이스로부터 지역별 코드를 불러와 검색창의 지역 Select 버튼을 구성하고 이를 통해, 관광지 정보를 지역별 원하는 컨텐츠 별로 조회할 수 있다.
지역, 관광지 유형, 검색어를 입력 후 검색 버튼을 누르면 해당 검색 쿼리와 관련된 내용을 데이터베이스로부터 검색하고, 결과 목록을 그리드 형태로 나타낸다. 또한 상세보기 버튼을 누를 시
상단의 지도가 해당 관광지의 위치로 이동하며 지도 위의 아이콘에 마우스를 가져가면 관광지 이름, 주소와 썸네일이 나타난다.

### 3. 회원가입 화면
<img width="80%" src="https://user-images.githubusercontent.com/104357560/225958887-36c5fa5b-3824-4387-82f1-d8c2190fe3f7.png">
<img width="80%" src="https://user-images.githubusercontent.com/104357560/225958943-b96d1bd4-37a5-4f23-a331-3218e5e669c6.png">
<img width="80%" src="https://user-images.githubusercontent.com/104357560/225958979-5649723a-e4c9-4a5a-8226-54af9ce05438.png">

- 설명 : 회원가입 시, localStorage에 id를 key값으로, 나머지 정보를 value값으로 저장한다. 만약 이미 존재하는 id로 회원가입을 시도한다면 경고 메시지를 표시하도록 구현했다.

### 4. 비밀번호 찾기 화면
<img width="80%" src="https://user-images.githubusercontent.com/104357560/225959543-c36b5353-94c2-45d8-944c-a9d1f599a128.png">
<img width="80%" src="https://user-images.githubusercontent.com/104357560/225959572-a02e7010-7ab0-475a-b3ee-17a3e12d612f.png">
<img width="80%" src="https://user-images.githubusercontent.com/104357560/225959587-c7bef410-abd7-4995-9975-6e497ddc9576.png">

- 설명 : 입력값이 존재하지 않거나, 존재하지 않는 회원정보면 해당하는 경고 메시지를 표시하도록 하고, 존재하는 회원정보인 경우 id를 key값으로 해당 비밀번호를 표시해주도록 했다.

### 5. 로그인 화면
<img width="80%" src="https://user-images.githubusercontent.com/104357560/225960187-3cc4b8e8-019f-4286-924c-683d99532b42.png">
<img width="80%" src="https://user-images.githubusercontent.com/104357560/225960243-f4d208cd-2bdc-4ece-8254-fd32021badf3.png">


- 설명 : 로그인 시, 존재하지 않는 회원정보이면 경고 메시지를 보이고 로그인을 성공하면 메인페이지로 바로 이동한다.
