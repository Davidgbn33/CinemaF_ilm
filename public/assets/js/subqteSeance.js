const input = document.querySelector('#clPriceNorm');
const spanMinus = document.querySelector('.btn-minus-norm');
function subQteSeance() {
    spanMinus.addEventListener('click', function () {
        // Incrémentez la valeur de l'input
        if (input.value > 0) {
            input.value--;
        }
    });
}
