let input = document.querySelector('#clPriceNorm');
const spanPlus = document.querySelector('.btn-plus-norm');
function addQteSeance(){
    // Incrémentez la valeur de l'input
    input.value++;
}
spanPlus.addEventListener('click', function() {
    // Affiche la valeur actuelle de l'input
    console.log(input.value);
});
