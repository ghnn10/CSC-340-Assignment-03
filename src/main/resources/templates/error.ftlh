<#import "layout.ftlh" as l>
  <@l.page title="Error" active="home">
    <h1 class="title-text">Error</h1>
    <p class="gray-content">${errorMessage!'An error occurred.'} </p>
    <a href="/characters" type="button" class="btn mb-4" id="back-btn">← Back to gallery</a>
  </@l.page>