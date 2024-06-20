const btnmyDay = document.querySelector(".btnMyDay");
const btnImportant = document.querySelector(".btnImportant");
const btnPlanned = document.querySelector(".btnPlanned");
const btnAssign = document.querySelector(".btnAssign");
const btnTask = document.querySelector(".btnTask");
const sample = document.querySelector(".sample");
const myday = document.querySelector(".myday");
const important = document.querySelector(".important");
const planned = document.querySelector(".planned");
const assign = document.querySelector(".assign");
const task = document.querySelector(".task");
const fetchObject = document.querySelectorAll(".fetch");
const result = myday.classList.contains("d-none");
console.log(result);

btnmyDay.addEventListener("click", ()=>{
        planned.classList.remove("one");
        important.classList.remove("one");
        assign.classList.remove("one");
        task.classList.remove("one");
        sample.classList.remove("one");
        myday.classList.remove("d-none");
        myday.classList.add("one");
        important.classList.add("d-none");
        planned.classList.add("d-none");
        assign.classList.add("d-none");
        task.classList.add("d-none");
})

btnImportant.addEventListener("click", ()=>{
        planned.classList.remove("one");
        assign.classList.remove("one");
        task.classList.remove("one");
        sample.classList.remove("one");
        myday.classList.remove("one");
        myday.classList.add("d-none");
        important.classList.remove("d-none");
        important.classList.add("one");
        planned.classList.add("d-none");
        assign.classList.add("d-none");
        task.classList.add("d-none");
})
btnPlanned.addEventListener("click", ()=>{
        myday.classList.remove("one");
        important.classList.remove("one");
        assign.classList.remove("one");
        task.classList.remove("one");
        sample.classList.remove("one");
        planned.classList.remove("d-none");
        planned.classList.add("one");
        myday.classList.add("d-none");
        important.classList.add("d-none");
        assign.classList.add("d-none");
        task.classList.add("d-none");
})

btnAssign.addEventListener("click", ()=>{
        myday.classList.remove("one");
        important.classList.remove("one");
        planned.classList.remove("one");
        task.classList.remove("one");
        sample.classList.remove("one");
        assign.classList.remove("d-none");
        assign.classList.add("one");
        myday.classList.add("d-none");
        important.classList.add("d-none");
        planned.classList.add("d-none");
        task.classList.add("d-none");
});

btnTask.addEventListener("click", ()=>{

        myday.classList.remove("one");
        important.classList.remove("one");
        assign.classList.remove("one");
        planned.classList.remove("one");
        sample.classList.remove("one");
        task.classList.remove("d-none");
        task.classList.add("one");
        myday.classList.add("d-none");
        important.classList.add("d-none");
        assign.classList.add("d-none");
        planned.classList.add("d-none");
});