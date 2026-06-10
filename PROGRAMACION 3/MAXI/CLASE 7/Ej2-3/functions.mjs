const addTaskBtn = document.getElementById("addTaskBtn");
const newTaskInput = document.getElementById("newTaskInput");
const taskList = document.getElementById("taskList");

addTaskBtn.addEventListener("click", function() {
  // Tomamos el valor del input
  const taskText = newTaskInput.value;

  // Validación por si el input está vacío
  if (taskText.trim() === "") return;

  // Acá se crea el <li>
  const li = document.createElement("li");

  // Creamos un <span> para el texto (facilita tacharlo sin afectar a los botones)
  const textSpan = document.createElement("span");
  textSpan.textContent = taskText;

  // Contenedor <div> para agrupar los botones a la derecha
  const btnContainer = document.createElement("div");

  // Botón para marcar como completada (el tilde)
  const markBtn = document.createElement("button");
  markBtn.textContent = "✓";
  markBtn.classList.add("markBtn");

  markBtn.addEventListener("click", function() {
    // toggle() agrega la clase si no la tiene, y se la quita si ya la tiene
    li.classList.toggle("completed"); 
  });

  // Acá se crea la X para borrar
  const deleteBtn = document.createElement("button");
  deleteBtn.textContent = "X";
  deleteBtn.classList.add("deleteBtn");

  deleteBtn.addEventListener("click", function() {
    li.remove();
  });

  // Metemos los botones en su contenedor
  btnContainer.appendChild(markBtn);
  btnContainer.appendChild(deleteBtn);

  // Metemos el span de texto y el contenedor de botones al <li>
  li.appendChild(textSpan);
  li.appendChild(btnContainer);
  
  // Finalmente, metemos el <li> dentro del <ul> 
  taskList.appendChild(li);

  // Limpiamos el input para que quede listo para la siguiente tarea
  newTaskInput.value = "";
});