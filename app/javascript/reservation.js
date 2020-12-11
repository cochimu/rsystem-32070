function addDelete() {
  const addClone = document.getElementById("add-btn");
  addClone.addEventListener('click',() => {
   const cloneLanes = document.getElementsByClassName("right-Table");
   const cloneBox = cloneLanes[0].cloneNode(true);
   document.body.appendChild(cloneBox);  
  });
}
window.addEventListener('load', addDelete)