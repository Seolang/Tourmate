const tryLogin = () => {
  let id = document.querySelector("#id").value;
  let pwd = document.querySelector("#password").value;
  let msg = document.querySelector(".message");

  let loginfo = JSON.parse(localStorage.getItem(id));

  if (loginfo && id === loginfo.id && pwd === loginfo.pwd) {
    setLoginStatus(id);
    window.location.href = "main.html";
  } else {
    msg.innerHTML = "아이디 혹은 비밀번호가 틀렸습니다";
  }
};

const setLoginStatus = (id) => {
  localStorage.setItem("loginStatus", id);
};
