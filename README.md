# 대전 5반 Team_5 - Back-End PJT

## 👪 팀 구성

👨 **Teammate_01** : **우승빈** (Woo Seungbeen)

👩 **Teammate_02** : **조해린** (Cho Haerin)

<br/>


## 📺 주요 화면

### 1. 메인 화면
<img width="80%" src="https://user-images.githubusercontent.com/104357560/225957297-abb13927-fa39-4cf7-90f7-1483c2801ebf.png">

<img width="80%" src="https://user-images.githubusercontent.com/104357560/225957696-99c3cc8c-8342-4ef6-8242-3a04543a4771.png">


- 관광지 검색하러가기 버튼을 누르면 지역별 관광지 정보를 검색할 수 있는 페이지로 이동한다. 아래는 추천 장소 3곳을 표시했다.
- 추천 장소의 상세보기 버튼을 클릭하면, 검색창으로 이동하여 자동적으로 해당 장소의 정보와 지도상의 위치를 표시하도록 하였다.

### 2. 지역별 관광지 정보 수집 - 관광지, 숙박, 음식점, 문화시설, 공연, 여행코스, 쇼핑 조회
<img width="80%" src="https://user-images.githubusercontent.com/26866109/229038864-603bb1b8-2115-416a-8338-c8866135b0d1.png">
<img width="80%" src="https://user-images.githubusercontent.com/26866109/229039799-9c338770-4ccc-41c2-a80c-ec5559d823c3.png">
<img width="80%" src="https://user-images.githubusercontent.com/26866109/229039850-ed86a43e-1b73-4b04-b56b-065992b299be.png">
<img width="80%" src="https://user-images.githubusercontent.com/26866109/229039113-96467970-e1ea-471a-b3e4-4eb8c3e8bfe0.png"><br>

- 검색 페이지 로드 시 데이터베이스로부터 지역별 코드를 불러와 검색창의 지역 Select 버튼을 구성하고 이를 통해, 관광지 정보를 지역별 원하는 컨텐츠 별로 조회할 수 있다.
- 지역, 관광지 유형, 검색어를 입력 후 검색 버튼을 누르면 해당 검색 쿼리와 관련된 내용을 데이터베이스로부터 검색하고, 결과 목록을 그리드 형태로 나타낸다.<br>

<img width="80%" src="https://user-images.githubusercontent.com/26866109/229039076-6f095ad3-e513-40eb-b824-43cedda923d9.png"><br>
- 또한 상세보기 버튼을 누를 시 상단의 지도가 해당 관광지의 위치로 이동하며 지도 위의 아이콘에 마우스를 가져가면 관광지 이름, 주소와 썸네일이 나타난다.<br>

<img width="80%" src="https://user-images.githubusercontent.com/26866109/229040112-206d8102-7a43-409e-99c9-944f6479e411.png"><br>
- 지역, 관광지 유형, 검색어를 입력하지 않을 시 선택을 하라는 Alert 창을 띄운다.<br>

### 3. 로그인 화면
<img width="80%" src="https://user-images.githubusercontent.com/26866109/229049679-236a854e-2090-471c-86b9-f57445cc6e5e.png">
<img width="80%" src="https://user-images.githubusercontent.com/26866109/229050025-062e00ff-955d-433e-b8b3-429ad4b9d50c.png">
<img width="80%" src="https://user-images.githubusercontent.com/26866109/229050302-ca368802-7f88-41b3-8c84-481f118bc299.png">


- 상단 왼쪽의 로그인 클릭시 로그인 화면으로 넘어가며, 존재하지 않는 회원정보, 혹은 아이디나 비밀번호가 틀리면 경고 메시지를 보이고 로그인을 성공하면 메인페이지로 바로 이동한다.
- 로그인에 성공하면 화면 왼쪽 상단에 로그인 중인 유저의 이름과 아이디를 표시하고, 로그아웃과 메인페이지로 가는 링크가 생성된다.

### 4. 회원가입 화면
<img width="80%" src="https://user-images.githubusercontent.com/104357560/225958887-36c5fa5b-3824-4387-82f1-d8c2190fe3f7.png">
<img width="80%" src="https://user-images.githubusercontent.com/26866109/229052477-25b99299-e493-4622-8281-85ff8831f0bf.png">
<img width="80%" src="https://user-images.githubusercontent.com/26866109/229053763-192e3107-3439-440a-934b-11ee24f0e99e.png">

- 회원가입 시, DB로 아이디 및 회원 정보를 전달한다. 아이디와 비밀번호, 전화번호등의 요구조건을 만족하지 않으면 등록하기 버튼 상단에 경고메세지를 띄운다.
- 만약 이미 존재하는 id로 회원가입을 시도한다면 에러페이지로 이동시킨다.
- 회원가입에 성공하면 회원가입 성공 Alert메세지를 띄우고, 로그인 창으로 돌아간다.

### 5. 비밀번호 찾기 화면
<img width="80%" src="https://user-images.githubusercontent.com/26866109/229054587-f3551a06-ae5e-443e-a8d9-218e07b60d79.png">
<img width="80%" src="https://user-images.githubusercontent.com/26866109/229054673-12acdc3e-d7ad-4529-ac49-3dd0184e6c18.png">

- 이름과 아이디, 전화번호를 입력하여 일치하는 회원이 존재하면 Alert으로 해당하는 유저의 아이디와 비밀번호를 표시한다.


### 6. 마이페이지
<img width="80%" src="https://user-images.githubusercontent.com/26866109/229062415-63394cc8-175d-4ea3-bf8b-f4a2e709c141.png">
<img width="80%" src="https://user-images.githubusercontent.com/26866109/229062480-d5f04891-a366-4b9b-aa6e-1d4c91d7fa5d.png">
<img width="80%" src="https://user-images.githubusercontent.com/26866109/229062509-88e27dd6-d7d1-44ab-8702-660e5937eddb.png"><br>

- 마이페이지에서는 비밀번호를 변경하고, 회원탈퇴를 진행할 수 있다.
- 현재 사용중인 아이디와 비밀번호를 입력하고, 새로운 비밀번호를 입력하고서 정보수정 버튼을 누르면 비밀번호 변경 메세지를 띄우며 메인화면으로 돌아간다.

<img width="80%" src="https://user-images.githubusercontent.com/26866109/229062543-09a7d454-8285-4c9a-b832-b6f21c1d2a99.png">
<img width="80%" src="https://user-images.githubusercontent.com/26866109/229062583-90d46d77-47aa-4680-8f63-69a571144a5b.png">


- 회원 탈퇴 버튼을 누를 경우 정말로 회원을 탈퇴할 것이냐는 메세지를 한번 더 띄우고, 이를 수락하면 회원을 탈퇴한 후 메인화면으로 돌아간다.


