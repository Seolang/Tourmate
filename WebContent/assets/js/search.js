// 검색 버튼을 누르면..
// 지역, 유형, 검색어 얻기.
// 위 데이터를 가지고 공공데이터에 요청.
// 받은 데이터를 이용하여 화면 구성.
const search = () => {
  let searchUrl = `https://apis.data.go.kr/B551011/KorService1/searchKeyword1?serviceKey=${serviceKey}&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=A`;

  searchUrl += `&keyword=${keyword}`;

  fetch(searchUrl)
    .then((response) => response.json())
    .then((data) => makeList(data));
};

function makeList(data) {
  let trips = data.response.body.items.item;
  let tripList = ``;
  trips.forEach((area) => {
    tripList += `
          <div class="col-lg-4 col-md-6 col-sm-12">
            <div class="card mt-5 mb-5 ms-2 me-2 p-2 text-center">
              <img src="${area.firstimage}" class="card-img-top" alt="..." />
              <div class="card-body p-3">
                <h5 class="card-title">${area.title}</h5>
                <p class="card-text">${area.addr1} ${area.addr2}</p>
                <a href="#" class="btn btn-primary">상세보기</a>
              </div>
            </div>
          </div>`;
  });
  document.getElementById("tour-list-grid").innerHTML = tripList;
}
