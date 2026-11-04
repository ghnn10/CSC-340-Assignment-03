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
            <form method="get" action="/characters">
                <div class="card mb-3" id="filterBox">
                    <div class="card-body p-4">
                        <div class="d-flex flex-wrap gap-2">
                            <input class="search-bar" name="name" type="text" value="${name!''}" placeholder="Search by character name or role">
                            <select name="role" style="border-radius: 5px;">
                                <option value="">Any role</option>
                                <option value="DETECTIVE" <#if selectedRole=='DETECTIVE'>selected</#if>>Detective</option>
                                <option value="POLICE" <#if selectedRole=='POLICE'>selected</#if>>Police</option>
                                <option value="CIVILIAN" <#if selectedRole=='CIVILIAN'>selected</#if>>Civilian</option>
                                <option value="BLACK_ORGANIZATION" <#if selectedRole=='BLACK_ORGANIZATION'>selected</#if>>Black Organization</option>
                                <option value="FBI" <#if selectedRole=='FBI'>selected</#if>>FBI</option>
                                <option value="OTHER" <#if selectedRole=='OTHER'>selected</#if>>Other</option>
                            </select>
                            <button type="submit" class="clear-btn" type="button" class="btn btn-outline-secondary">Search</button>
                            <#if name?has_content || selectedRole?has_content>
                                <a href="/characters">
                                    <button class="clear-btn" type="button" class="btn btn-outline-secondary">Clear</button>
                                </a>
                            </#if>
                        </div>
                        
                    </div>
                </div>
                
            </form>


            <div class="mb-3" style="color: rgb(165, 167, 168);">
                Showing <span class="count" style="font-weight: bold;">${myChars?size}</span> character(s)
            </div>


            <div class="row">
                <#list myChars as myChar>
                    <div class="col-md-6 col-lg-4 mb-3" id="charactersCard">
                        <div class="card h-100 shadow-sm">
                            <img src="/thumbnails/${(myChar.thumbnailUrl)!'character-placeholder.svg'}"
                                class="card-img-top p-3 rounded-4 custom-fit" alt="${myChar.id?c}">
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
                        <p class="gray-content">No characters found.</p>
                </#list>
            </div>
        </div>

    </@l.page>