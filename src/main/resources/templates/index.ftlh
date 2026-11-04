<#import "layout.ftlh" as l>
    <@l.page title="My Characters" active="home">

    <div class="container-lg py-5">
            <!--Page header-->
            <div class="page-header text-center mt-3 mb-5 pb-4 pt-4 border-bottom title-text">
                <h1>Detective Conan Gallery</h1>
                <p class="gray-content">Losing track of who's who after hundreds of chapters? Dive into this
                    incredible collection of Detective Conan character cards to refresh your memory!</p>
            </div>

            <!--Search box-->
            <div class="card mb-3" id="filterBox">
                <div class="card-body">
                    <div class="row mb-3">
                        <div class="search-container">
                            <input class="search-bar" type="text" placeholder="Search by character name or role">
                            <button class="clear-btn" type="button" class="btn btn-outline-secondary">Clear</button>
                        </div>
                    </div>
                    <div class="d-flex flex-wrap gap-2">
                        <a href="#" class="btn btn-primary">All Characters</a>
                        <button type="button" class="btn btn-outline-primary">Detective</button>
                        <button type="button" class="btn btn-outline-primary">Civilian</button>
                        <button type="button" class="btn btn-outline-primary">FBI</button>
                        <button type="button" class="btn btn-outline-primary">Black Organization</button>
                        <button type="button" class="btn btn-outline-primary">Police</button>
                    </div>
                </div>
            </div>

            <div class="mb-3" style="color: rgb(165, 167, 168);">
                Showing <span class="count" style="font-weight: bold;">${myChars?size}</span> character(s)
            </div>


            <div class="row">
                <#list myChars as myChar>
                    <div class="col-md-6 col-lg-4 mb-3" id="charactersCard">
                        <div class="card h-100 shadow-sm">
                            <img src="/thumbnails/${(myChar.thumbnailUrl)!'character-placeholder.svg'}" class="card-img-top p-3 rounded-4 custom-fit" alt="${myChar.id?c}">
                            <div class="card-body d-flex flex-column">
                                <h5 class="card-title">${myChar.name}</h5>
                                <p class="text-muted small mb-2 "><strong>Universe:</strong> Detective Conan</p>
                                <p><span class="badge rounded-pill">${myChar.roles}</span></p>
                                <p class="card-text">${myChar.description}</p>
                                <a href="/characters/${myChar.id?c}" class="btn btn-custom w-100">View Details</a>
                            </div>
                        </div>
                    </div>
                    <#else>
                        <p class="empty">No plants found.</p>
                </#list>
            </div>
        </div>
    
    </@l.page>
