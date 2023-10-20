const apiKey = '7edec4eb';
let apiUrl = `https://www.omdbapi.com/?apikey=${apiKey}&s=les&y=2023&type=movie`;
const movieListDiv = document.querySelector('.movie-list');



// Afficher les films
const getMovies = () => {
    fetch(apiUrl)
        .then(function (res) {
            return res.json()
        })
        .then(function (data) {
            console.log(data.Search)

            for(movie of data.Search)     {
                movieListDiv.innerHTML += `
            <div class="movie">
                <figure class="movie-poster">
                    <img src="${movie.Poster}" alt="${movie.Title}" style="height:300px;object-fit:cover">
                </figure>
                <div class="movie-title">
                    <a href="#">${movie.Title}</a>
                </div>
                    <p>Année de sortie: ${movie.Year}</p>
                    <a href="https://www.imdb.com/title/${movie.imdbID}/" target="_blank">Voir la fiche sur IMDB</a>
                    <button>Ajouter aux projections</button>
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
                console.log(data.Search)
            if (data.Search != null) {
                for(movie of data.Search) {
                    movieListDiv.innerHTML += `
            <div class="movie">
                <figure class="movie-poster">
                    <img src="${movie.Poster}" alt="${movie.Title}" style="height:300px;object-fit:cover">
                </figure>
                <div class="movie-title">
                    <a href="#">${movie.Title}</a>
                </div>
                    <p>Année de sortie: ${movie.Year}</p>
                    <a href="https://www.imdb.com/title/${movie.imdbID}/" target="_blank">Voir la fiche sur IMDB</a>
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
