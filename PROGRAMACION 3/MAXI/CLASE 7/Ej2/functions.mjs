const addTaskBtn = document.getElementById("addTaskBtn");
const newTaskInput = document.getElementById("newTaskInput");
const taskList = document.getElementById("taskList");

addTaskBtn.addEventListener("click", function() {
  // Tomamos el valor del input y lo metemos dentro de taskText
  const taskText = newTaskInput.value;

  // Validacion por si el input esta vacio
  if (taskText.trim() === "") return;

  // Aca se crea el <li>
  const li = document.createElement("li");

  // Aca se crea la X para borrar
  const deleteBtn = document.createElement("button");
  deleteBtn.textContent = "X";
  deleteBtn.classList.add("deleteBtn");

  deleteBtn.addEventListener("click", function() {
    li.remove();
  });

  // Le ponemos el texto de la tarea al <li>
  li.textContent = taskText;

  // Metemos el boton X dentro del <li>, y luego metemos el <li> dentro del <ul> 
  li.appendChild(deleteBtn);
  taskList.appendChild(li);

  // Limpiamos el input para que quede listo para la siguiente tarea
  newTaskInput.value = "";

});