<#import "layout.ftlh" as l>
    <@l.page title="About" active="about">
        <div class="page-header text-center mt-3 mb-5 pb-4 pt-4 border-bottom">
            <h1 class="title-text">About this app</h1>
            <p class="gray-content">Detective Conan Character Gallery demo. This app use FreeMarker MVC with Thymleaf
                template to render pages from server by calling service layer directly, every template use the shared resource <code>layout.ftlh</code></p>
        </div>
        <div class="container-lg py-5">
            <div class="row mb-5">
                <div class="col-lg-8 mb-4 mb-lg-0">
                    <h2 class="mb-4 title-text" style="text-align: center;">How a page request flows</h2>
                    <div class="story-detail light-content">
                        <ol>
                            <li>The browser requests a URL, for example <code>/characters/1</code>.</li>
                            <li>A <code>@Controller</code> method runs, asks the service for data, and puts it in the
                                <code>Model</code>.</li>
                            <li>The controller returns a view name. Spring renders the matching FreeMarker template.</li>
                            <li>The browser receives HTML.</li>
                        </ol>
                    </div>
                </div>
                <div class="col-lg-4">
                    <img class="about-thumbnail-img" src="/thumbnails/character-placeholder.svg"
                        alt="Illustration of a character">
                </div>
            </div>
            <div class="text-white p-5 rounded mt-5 text-center" style="background-color: rgb(134 239 172);">
                <a href="/characters" class="btn" id="view-gallery-btn">View gallery</a>
            </div>
        </div>
    </@l.page>