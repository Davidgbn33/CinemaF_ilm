const apiKey = '7edec4eb';
const apiUrl = `https://www.omdbapi.com/?apikey=${apiKey}&s=les&y=2023`;
const movieListDiv = document.querySelector('.movie-list');
const movieFilters = document.querySelector('.filters');



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
                    <img src="${movie.Poster}" alt="${movie.Title}">
                </figure>
                <div class="movie-title">
                    <a href="#">${movie.Title}</a>
                </div>
                    <p>Année de sortie: ${movie.Year}</p>
                    <a href="https://www.imdb.com/title/${movie.imdbID}/" target="_blank">Voir la fiche sur IMDB</a>
            </div>
                `;
            }
        })
}
getMovies()
