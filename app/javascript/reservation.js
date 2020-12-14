window.addEventListener('load', function addDelete() {
  const addBtn = document.getElementById("add-btn");
  addBtn.addEventListener('click',() => {
   const cloneTable = document.getElementsByClassName("right-Table");
   const cloneBox = cloneTable[0].cloneNode(true);
   document.querySelector('.table').appendChild(cloneBox);  
  });
  const delBtn = document.getElementById("del-btn");
  delBtn.addEventListener('click',() => {
    const allTable = document.querySelector(".table");
    const rightTable = document.getElementsByClassName("right-Table");
    const lastTable = allTable.lastElementChild;
    allTable.removeChild(lastTable);
  });
})
