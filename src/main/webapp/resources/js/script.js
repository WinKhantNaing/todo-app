const btnmyDay = document.querySelector(".btnMyDay");
const btnImportant = document.querySelector(".btnImportant");
const btnPlanned = document.querySelector(".btnPlanned");
const btnAssign = document.querySelector(".btnAssign");
const sample = document.querySelector(".sample");
const myday = document.querySelector(".myday");
const important = document.querySelector(".important");
const planned = document.querySelector(".planned");
const assign = document.querySelector(".assign");
const fetchObject = document.querySelectorAll(".fetch");
const result = myday.classList.contains("d-none");
console.log(result);

function activateMyDay() {
    planned.classList.remove("one");
    important.classList.remove("one");
    assign.classList.remove("one");
    sample.classList.remove("one");
    myday.classList.remove("d-none");
    myday.classList.add("one");
    important.classList.add("d-none");
    planned.classList.add("d-none");
    assign.classList.add("d-none");
}

// Execute when the DOM is fully loaded
document.addEventListener("DOMContentLoaded", activateMyDay);

// Execute when the button is clicked
btnmyDay.addEventListener("click", activateMyDay);


btnImportant.addEventListener("click", ()=>{
        planned.classList.remove("one");
        assign.classList.remove("one");
        sample.classList.remove("one");
        myday.classList.remove("one");
        myday.classList.add("d-none");
        important.classList.remove("d-none");
        important.classList.add("one");
        planned.classList.add("d-none");
        assign.classList.add("d-none");
})
btnPlanned.addEventListener("click", ()=>{
        myday.classList.remove("one");
        important.classList.remove("one");
        assign.classList.remove("one");
        sample.classList.remove("one");
        planned.classList.remove("d-none");
        planned.classList.add("one");
        myday.classList.add("d-none");
        important.classList.add("d-none");
        assign.classList.add("d-none");
})

btnAssign.addEventListener("click", ()=>{
        myday.classList.remove("one");
        important.classList.remove("one");
        planned.classList.remove("one");
        sample.classList.remove("one");
        assign.classList.remove("d-none");
        assign.classList.add("one");
        myday.classList.add("d-none");
        important.classList.add("d-none");
        planned.classList.add("d-none");
});


document.addEventListener('DOMContentLoaded', () => {
    const starCheckbox = document.getElementById('star');
    starCheckbox.addEventListener('change', () => {
        if (starCheckbox.checked) {
            console.log('Star checkbox is checked');
        } else {
            console.log('Star checkbox is unchecked');
        }
    });
});