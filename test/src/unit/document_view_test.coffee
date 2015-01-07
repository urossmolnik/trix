module "Trix.DocumentView"

eachFixture (name, details) ->
  test name, ->
    expectHTML details.document, details.html


module "Trix.DocumentView with paragraphs",
  setup: ->
    window.originalDefaultBlockAttributes = Trix.blockAttributes.default
    Trix.blockAttributes.default = tagName: "p"

  teardown: ->
    Trix.blockAttributes.default = window.originalDefaultBlockAttributes
    delete window.originalDefaultBlockAttributes

eachFixture (name, details) ->
  test name, ->
    htmlWithParagraphsNotDivs = details.html.replace(/<div>/g, "<p>").replace(/<\/div>/g, "</p>")
    expectHTML details.document, htmlWithParagraphsNotDivs
