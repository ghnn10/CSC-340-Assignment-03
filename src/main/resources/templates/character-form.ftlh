<#import "layout.ftlh" as l>
    <@l.page title=formTitle active=(myChar.id??)?then('', 'new' )>
        <div class="container-lg py-5">
            <!--Page header-->
            <div class="page-header text-center mt-3 mb-5 pb-4 pt-4 border-bottom">
                <h1 class="title-text">${formTitle}</h1>
                <p class="gray-content">Share your favorite Detective Conan character</p>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="card mb-4" id="new-character-form">
                        <div class="card-body">
                            <h5 class="card-title fw-bold mb-4 text-center">Character information</h5>
                            <form method="post" action="${formAction}" enctype="multipart/form-data" class="form">
                                <div class="mb-3">
                                    <label for="characterName" class="form-label fw-bold">Character name*</label>
                                    <input type="text" class="form-control" required id="characterName"
                                        placeholder="eg., Kaitou Kid">
                                    <small class="form-text text-muted">The name of your character</small>
                                </div>
                                <div class="mb-3">
                                    <label for="characterAge" class="form-label fw-bold">Character Age</label>
                                    <input type="number" class="form-control" required id="characterAge">
                                    <small class="form-text text-muted">Age of character if they still alive in
                                        manga</small>
                                </div>
                                <div class="mb-3">
                                    <label for="characterRole" class="form-label fw-bold">Role*</label>
                                    <select name="characterRole" id="characterRole" class="form-select" required>
                                        <option value>-- Select a role --</option>
                                        <option value="Detective">Detective</option>
                                        <option value="Police">Police</option>
                                        <option value="Civilan">Civilan</option>
                                        <option value="Black Organization">Black Organization</option>
                                        <option value="FBI">FBI</option>
                                        <option value="Others">Others...</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="characterImg" class="form-label fw-bold">Image URL*</label>
                                    <input class="form-control" type="file" id="characterImg" required>
                                    <small class="form-text text-muted">Link to a character image (Accepted: JPG,
                                        PNG)</small>
                                </div>
                                <div class="mb-3">
                                    <label for="characterDescription" class="form-label fw-bold">Short
                                        description*</label>
                                    <textarea class="form-control" id="characterDescription" name="characterDescription"
                                        rows="3" required
                                        placeholder="Describe the character in 1-2 sentences..."></textarea>
                                    <small class="form-text text-muted">A brief summary of the character</small>
                                </div>
                                <div class="mb-3">
                                    <label for="characterFirstAppearance" class="form-label fw-bold">First
                                        Apperance</label>
                                    <input type="text" class="form-control" required id="characterName"
                                        placeholder="eg., Manga: File 287, Anime: Episode 230">
                                    <small class="form-text text-muted">When/where did this character first
                                        appear?</small>
                                </div>
                                <div class="actions">
                                    <button id="form-submit-btn" type="submit" class="btn mb-2">Save</button>
                                    <#if myChar.id??>
                                        <a href="/characters/myCharId?c" id="form-cancel-btn" type="button"
                                            class="btn btn-outline-secondary">Cancel</a>
                                        <#else>
                                        <a href="/characters" id="form-cancel-btn" type="button"
                                            class="btn btn-outline-secondary">Cancel</a>
                                    </#if>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </@l.page>