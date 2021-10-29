window.addEventListener("DOMContentLoaded", () => {
  let menuBtn = document.querySelector(".js-menu-btn");
  menuBtn.addEventListener("click", () => {
    menuBtn.classList.toggle("on");
  });
});
