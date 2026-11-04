<#import "layout.ftlh" as l>
    <@l.page title="Character details" active="details">
        <#if successMessage??>
            <div class="alert alert-success alert-dismissible fade show container mt-3" role="alert">
                ${successMessage}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </#if>
        <div class="container-lg py-5">
            <a href="/characters" type="button" class="btn mb-4" id="back-btn">← Back to gallery</a>
            <div class="row">
                <div class="col-md-8">
                    <h3 class="title-text">Background</h3>
                    <p class="gray-content story-detail mb-4">${myChar.background}</p>
                    <h3 class="title-text">Personality</h3>
                    <p class="gray-content story-detail">${myChar.personality}</p>
                </div>
                <div class="col-6 col-md-4">
                    <div class="mb-4">
                        <img src="/thumbnails/${(myChar.thumbnailUrl)!'character-placeholder.svg'}"
                            class="img-fluid rounded mb-5 custom-fit" alt="${myChar.name}">
                        <div class="card">
                            <div class="card-header fw-bold" id="detail-card-header">Quick Info</div>
                            <div class="card-body">
                                <h3 class="mb-2">${myChar.name}</h3>
                                <p class="text-muted mb-2">${myChar.description}</p>
                                <p class="text-muted small mb-4"><strong>Universe:</strong> Detective Conan</p>
                                <p class="mb-2"><strong>Role:</strong><span class="badge rounded-pill text-dark"
                                        id="detail-role">${myChar.roles}</span></p>
                                <p class="mb-2"><strong>Age:</strong> ${myChar.age}</p>
                                <p class="mb-2"><strong>First Appearance:</strong><br>${myChar.firstAppearance}</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="actions">
                    <div class="d-flex gap-3">
                        <a href="/characters/${myChar.id?c}/edit" type="button" class="btn mb-4" id="back-btn"
                            style="width: 120px;">
                            Edit
                        </a>
                        <form method="post" action="/characters/${myChar.id?c}/delete"
                            onsubmit="return confirm('Remove this character?');">
                            <button type="submit" class="btn mb-4 btn-danger" style="width: 120px;">Delete</button>
                        </form>
                    </div>
                </div>

            </div>

        </div>
    </@l.page>