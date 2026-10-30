<!DOCTYPE html>

<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" ;>
    <title>Detective Conan Character Gallery</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="styles.css">
    <link rel="icon" type="image/svg+xml" href="./img/gpu-card.svg">
</head>

<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg sticky-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.html">Detective Conan Gallery</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="index.html">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="details.html">Details</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"  href="/characters/about">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="new-character-form.html">Add a Character</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!--Content-->
    <main class="felx-grow-1 mx-5">
        <div class="container-lg py-5">
            <a href="index.html" type="button" class="btn mb-4" id="back-btn">← Back to gallery</a>
            <div class="row">
                <div class="col-md-8">
                    <h3 class="title-text">Background</h3>
                    <p class="gray-content story-detail mb-4">Shuichi Akai is a British American of Japanese descent, originally from England, and is a member of the American Federal Bureau of Investigation, on special assignment in Japan to capture Gin. His superior is James Black and his partner is Jodie Starling. He had infiltrated the Black Organization under the name Dai Moroboshi - and the codename "Rye" - as a mole and dated Akemi Miyano, one of their low-ranking members, to feed information to the FBI. In order to facilitate the latter, and later because he had genuinely developed feelings for Akemi, Shuichi saw himself forced to break up his then on-going relationship with Jodie. Later on, his cover in the Black Organization was accidentally blown by his colleague Andre Camel, and when Akemi was killed, he declared her murderer, Gin (with whom he seems to have had some tensions even before his exposure), his personal enemy.</p>
                    <h3 class="title-text">Personality</h3>
                    <p class="gray-content story-detail">Shuichi is a tenacious but stoic agent. Even in personal matters, he remains cool, even detached, from anyone, but his redeeming value is a great sense of loyalty to anyone he knows. He is a skilled and relentless pursuer and detective, qualities which have labeled him the number one enemy of the Black Organization and earned him the nickname "Silver Bullet". He looks forward to opportunities to hunt the Black Organization down and get revenge for Akemi. While usually professional, he often acts independently of the FBI, and even his boss James Black has trouble getting ahold of him. Shuichi gets along well with Conan, who share many personality traits. Despite that he has American citizenship, he still considers England as his home country.</p>
                </div>
                <div class="col-6 col-md-4">
                    <div class="mb-4">
                        <img src="img/akai.jpg" class="img-fluid rounded mb-5" alt="Akai Shuichi">
                        <div class="card">
                            <div class="card-header fw-bold" id="detail-card-header">Quick Info</div>
                            <div class="card-body">
                                <h3 class="mb-2">${myChar.name}</h3>
                                <p class="text-muted mb-2">${myChar.description}</p>
                                <p class="text-muted small mb-4"><strong>Universe:</strong> Detective Conan</p>
                                <p class="mb-2"><strong>Role:</strong><span class="badge rounded-pill text-dark" id="detail-role">${myChar.roles}</span></p>
                                <p class="mb-2"><strong>Age:</strong> ${myChar.age}</p>
                                <p class="mb-2"><strong>First Appearance:</strong><br>Manga: File 287<br>Anime: Episode 230</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </main>

    <footer class="text-center py-4 mt-5">
        <div class="mb-0">
            © 2026 Detective Conan Gallery
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous">
        </script>

</body>

</html>