// let input = document.querySelector('#clPriceNorm');
const spanMinus = document.querySelector('.btn-minus-norm');
function subQteSeance(){
    // Incrémentez la valeur de l'input
        if (input.value > 0) {
            input.value--;
        }
}
spanMinus.addEventListener('click', function() {
    // Affiche la valeur actuelle de l'input
    console.log(input.value);
});

