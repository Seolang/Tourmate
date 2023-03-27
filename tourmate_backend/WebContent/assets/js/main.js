window.onload = () => {
  checkLogin();
};

const checkLogin = () => {
  let loginStatus = localStorage.getItem("loginStatus");

  if (loginStatus) {
    setLogin();
  }
};

const setLogin = () => {
  // 로그인 시 바뀌는 nav 설정
  document.getElementById("before-login").style.display = "none";
  document.getElementById("after-login").style.display = "flex";
};

const setLogout = () => {
  document.getElementById("before-login").style.display = "flex";
  document.getElementById("after-login").style.display = "none";
  localStorage.removeItem("loginStatus");
  window.location.reload();
};

const setLocalStorage = (name) => {
  localStorage.setItem("localArea", name);
};
