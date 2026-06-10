const box = document.getElementById("box");
const btn = document.getElementById("toggleBtn");

btn.addEventListener("click", function() {
  if (box.style.display === "none") {
    box.style.display = "block";
    btn.textContent = "Ocultar Caja";
  } else {
    box.style.display = "none";
    btn.textContent = "Mostrar Caja";
  }
});