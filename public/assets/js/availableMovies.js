
console.log('Clé API:', apiKey);

let apiUrl = `https://www.omdbapi.com/?apikey=${apiKey}&s=les&y=2023&type=movie`;
const movieListDiv = document.querySelector('.movie-list');


// Afficher les films
const getMovies = () => {
    fetch(apiUrl)
        .then(function (res) {
            return res.json()
        })
        .then(function (data) {
            for(movie of data.Search)     {
                movieListDiv.innerHTML += `
            <div class="movie" style="margin-bottom:80px;">
                <figure class="movie-poster">
                    <img src="${movie.Poster}" alt="${movie.Title}" style="height:300px;object-fit:cover">
                </figure>
                <div class="movie-title" style="height:70px;">
                    <a style="font-size:20px;font-weight:bold">${movie.Title}</a>
                </div>
                <div class="movie-information">
                    <p>Année de sortie: ${movie.Year}</p>
                    <a href="https://www.imdb.com/title/${movie.imdbID}/" target="_blank">Voir la fiche sur IMDB</a>
                    <button class="button addMovie w-100 mt-3">Ajouter aux projections</button>
                </div>
            </div>
                `;
            }
        })
}
getMovies()


// Rechercher un film

const searchInput = document.querySelector('#searchInput');
const searchForm = document.querySelector('#searchForm'); // Sélectionnez le formulaire, pas seulement l'input

searchForm.addEventListener('submit', function(e) {
        e.preventDefault();
        let searchValue = searchInput.value
        movieListDiv.innerHTML = ''
        fetch(`https://www.omdbapi.com/?apikey=${apiKey}&s=${searchValue}&type=movie`)
            .then(function (res) {
                return res.json()
            })
            .then(function (data) {
            if (data.Search != null) {
                for(movie of data.Search) {
                    movieListDiv.innerHTML += `
            <div class="movie" style="margin-bottom:80px;">
                <figure class="movie-poster">
                    <img src="${movie.Poster}" alt="${movie.Title}" style="height:300px;object-fit:cover">
                </figure>
                <div class="movie-title" style="height:70px;">
                    <a style="font-size:20px;font-weight:bold">${movie.Title}</a>
                </div>
                <div class="movie-information">
                    <p>Année de sortie: ${movie.Year}</p>
                    <a href="https://www.imdb.com/title/${movie.imdbID}/" target="_blank">Voir la fiche sur IMDB</a>
                    <button class="button addMovie w-100">Ajouter aux projections</button>
                </div>
            </div>
                `
                }
            } else {
                    movieListDiv.innerHTML += `
            <div><h2>Aucun film trouvé !</h2></div>
                `
                }
            })
});
