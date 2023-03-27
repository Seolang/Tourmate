const searchPw = () => {
  let userName = document.getElementById("name").value;
  let userId = document.getElementById("id").value;
  let userPhone = document.getElementById("phone").value;
  let msg = document.querySelector(".message");

  let userInfo = JSON.parse(localStorage.getItem(userId));

  if (userName && userId && userPhone.length === 11) {
    // 회원 정보 조회
    if (userInfo) {
      userInfo.name === userName && userInfo.phone === userPhone;
      let pw = userInfo.pwd;
      msg.textContent = "비밀번호는 " + pw + "입니다.";
    } else {
      msg.textContent = "회원정보가 존재하지 않습니다.";
    }
  } else {
    msg.textContent = "입력값을 확인해주세요.";
  }
};
