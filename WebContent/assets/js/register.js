const checkRegist = () => {
  let id = document.querySelector("#id").value;
  let pwd = document.querySelector("#pwd").value;
  let pwdConfirm = document.querySelector("#pwdConfirm").value;
  let name = document.querySelector("#name").value;
  let tel = document.querySelector("#tel").value;
  let msg = document.querySelector(".message");

  let checkDuple = localStorage.getItem(id);

  if (id.length === 0) {
    msg.innerHTML = "ID를 입력해주세요";
  } else if (id.length < 4) {
    msg.innerHTML = "ID 길이가 너무 짧습니다";
  } else if (checkDuple) {
    msg.innerHTML = "이미 사용중인 ID 입니다";
  } else if (pwd.length === 0) {
    msg.innerHTML = "비밀번호를 입력해 주세요";
  } else if (pwd !== pwdConfirm) {
    msg.innerHTML = "비밀번호를 다시 확인해 주세요";
  } else if (name.length === 0) {
    msg.innerHTML = "이름을 입력해 주세요";
  } else if (tel.length === 0) {
    msg.innerHTML = "휴대폰번호를 입력해 주세요";
  } else if (isNaN(tel) || tel.length !== 11) {
    msg.innerHTML = "휴대폰번호를 정확히 입력해 주세요";
  } else {
    registUser(id, pwd, name, tel);
    msg.innerHTML = "";
  }
};

const registUser = (id, pwd, name, tel) => {
  let obj = {
    id: id,
    pwd: pwd,
    name: name,
    tel: tel,
  };

  localStorage.setItem(id, JSON.stringify(obj));
  window.location.href = "login.html";
};
