let btn = document.querySelector("button");
let section = document.querySelector("section");
btn.addEventListener("click", () => {
  if (section.style.display === "none") {
    section.style.display = "block";
  } else {
    section.style.display = "none";
  }
});