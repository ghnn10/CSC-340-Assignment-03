<#-- Shared page layout. Every page calls this macro, so the head and the navigation exist in ONE place. Usage in a
    page: <#import "layout.ftlh" as l>
    <@l.page title="Home" active="home"> ...page content... </@l.page> -->
    <#macro page title active="">
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0" ;>
            <title>${title} | Detective Conan Character Gallery</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
                crossorigin="anonymous">
            <link rel="stylesheet" href="/css/styles.css">
            <link rel="icon" type="image/svg+xml" href="/thumbnails/gpu-card.svg">
        </head>

        <body class="content">

            <!-- Navigation Bar -->
            <nav class="navbar navbar-expand-lg sticky-top">
                <div class="container-fluid">
                    <a class="navbar-brand" href="/characters">Detective Conan Gallery</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link ${(active == 'home')?then('active', '')}" href="/characters">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link ${(active == 'about')?then('active', '')}" href="/characters/about">About</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link ${(active == 'new')?then('active', '')}" href="/characters/new">Add a Character</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <main class="flex-grow-1 mx-5">
                <#-- A flash message survives exactly one redirect (see RedirectAttributes in the controller). -->
                    <#if message??>
                        <p class="alert">${message}</p>
                    </#if>
                    <#nested>
            </main>

            <footer class="text-center py-4 mt-5">
                <div class="mb-0">
                    © 2026 Detective Conan Gallery
                </div>
            </footer>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
                crossorigin="anonymous">
                </script>
        </body>
        </html>
    </#macro>