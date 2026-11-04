<#import "layout.ftlh" as l>
    <@l.page title=formTitle active=(myChar.id??)?then('','new')>
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
                                    <label for="name" class="form-label fw-bold">Character name*</label>
                                    <input type="text" class="form-control" name="name" value="${(myChar.name)!''}" required id="name"
                                        placeholder="eg., Kaitou Kid">
                                    <small class="form-text text-muted">The name of your character</small>
                                </div>
                                <div class="mb-3">
                                    <label for="age" class="form-label fw-bold">Character Age</label>
                                    <input type="number" class="form-control" name="age" value="${(myChar.age)!''}" id="age">
                                    <small class="form-text text-muted">Age of character if they still alive in
                                        manga</small>
                                </div>
                                <div class="mb-3">
                                    <label for="roles" class="form-label fw-bold">Roles*</label>
                                    <#assign current=(myChar.roles?string)!''>
                                    <select id="roles" name="roles" class="form-select" required>
                                        <option value="">-- Select a role --</option>
                                        <option value="DETECTIVE" <#if current=='Detective'>selected</#if>>Detective</option>
                                        <option value="POLICE" <#if current=='Police'>selected</#if>>Police</option>
                                        <option value="CIVILIAN" <#if current=='Civilian'>selected</#if>>Civilian</option>
                                        <option value="BLACK_ORGANIZATION" <#if current=='Black Organization'>selected</#if>>Black Organization</option>
                                        <option value="FBI" <#if current=='FBI'>selected</#if>>FBI</option>
                                        <option value="OTHER" <#if current=='Other'>selected</#if>>Other</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="imageFile" class="form-label fw-bold">Image URL*</label><br>
                                    <#if myChar.id??>
                                        <img class="img-fluid rounded mb-3 custom-fit" style="width: 200px; height: 200px;" src="/characters/${myChar.id?c}/image" alt="Current picture">
                                    </#if>
                                    <br><input id="imageFile" name="imageFile" type="file" accept="image/jpeg,image/png,image/webp">
                                    <br><small class="form-text text-muted">Link to a character image (Accepted: JPG,
                                        PNG)</small>
                                </div>
                                <div class="mb-3">
                                    <label for="description" class="form-label fw-bold">Short description*</label>
                                    <textarea class="form-control" id="description" name="description"
                                        rows="3" required
                                        placeholder="Describe the character in 1-2 sentences...">${(myChar.description)!''}</textarea>
                                    <small class="form-text text-muted">A brief summary of the character</small>
                                </div>
                                <div class="mb-3">
                                    <label for="firstAppearance" class="form-label fw-bold">First
                                        Apperance</label>
                                    <input type="text" class="form-control" name="firstAppearance" id="firstAppearance"
                                        placeholder="eg., Manga: File 287, Anime: Episode 230">
                                    <small class="form-text text-muted">When/where did this character first
                                        appear?</small>
                                </div>
                                <div class="mb-3">
                                    <label for="background" class="form-label fw-bold">Background</label>
                                    <textarea class="form-control" name="background" id="background" rows="3">${(myChar.background)!''}</textarea>
                                    <small class="form-text text-muted">A little bit about character background: family, career...</small>
                                </div>
                                <div class="mb-3">
                                    <label for="personality" class="form-label fw-bold">Personality</label>
                                    <textarea class="form-control" name="personality" id="personality" rows="3">${(myChar.personality)!''}</textarea>
                                    <small class="form-text text-muted">Character personality</small>
                                </div>
                                <div class="actions">
                                    <button id="form-submit-btn" type="submit" class="btn mb-2">Save</button>
                                    <#if myChar.id??>
                                        <a href="/characters/${myChar.id?c}" id="form-cancel-btn" type="button"
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