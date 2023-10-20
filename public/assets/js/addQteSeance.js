const input = document.querySelector('#clPriceNorm');
const spanPlus = document.querySelector('.btn-plus-norm');
console.log(input)
console.log(spanPlus)
function addQteSeance(){
    spanPlus.addEventListener('click', function() {
        // Incrémentez la valeur de l'input
        input.value++;
    });
}
