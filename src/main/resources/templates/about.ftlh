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

<body class="content">
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
                        <a class="nav-link" href="details.html">Details</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="about.html">About</a>
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
        <!--Page header-->
        <div class="page-header text-center mt-3 mb-5 pb-4 pt-4 border-bottom">
            <h1 class="title-text">Welcome to Detective Conan Gallery</h1>
            <p class="gray-content">With over a thousand manga chapters and dozens of movies, the Case Closed universe is massive. Explore these quick, easy-to-read profiles covering everyone from genius high school detectives to elusive Black Organization members, ensuring you never miss a beat in the ongoing mystery.</p>
        </div>
        <div class="container-lg py-5">
            <div class="row mb-5">
                <div class="col-lg-8 mb-4 mb-lg-0">
                    <h2 class="mb-4 title-text" style="text-align: center;">The story</h2>
                    <p class="story-detail light-content">The plot of Detective Conan follows Shinichi Kudo, a brilliant high school detective who is transformed into a young child after a brush with a dangerous criminal syndicate. While investigating a pair of suspicious men in black, Shinichi is ambushed and forced to ingest an experimental, untested poison called APTX 4869. Instead of killing him, the drug has a rare side effect that de-ages his body to the size of a seven-year-old while leaving his intellect fully intact. 
                    <br>To protect those around him from the syndicate, he adopts the alias Conan Edogawa and moves in with his childhood friend, Ran Mouri, and her bumbling private investigator father, Kogoro Mouri. Conan continues to solve crimes behind the scenes to avoid detection. At school, he forms a group, the Detective Boys, with several classmates to solve smaller mysteries, later joined by Ai Haibara, a former member of the syndicate who also shrunk herself to escape.
                    <br>The overarching narrative focuses on Conan's hunt for the Black Organization. He works to intercept their operations and gather intelligence on their hierarchy, often collaborating with law enforcement institutions, in the hopes of finding a permanent cure to regain his original body.</p>
                </div>
                <div class="col-lg-4">
                    <img class="about-thumbnail-img" src="./img/thumbnail.jpg">
                </div>
            </div>
            <div class="text-white p-5 rounded mt-5 text-center" style="background-color: rgb(134 239 172);">
                <a href="index.html" class="btn" id="view-gallery-btn">View gallery</a>
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