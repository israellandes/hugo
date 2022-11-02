const params = new URLSearchParams(window.location.search)
const query = params.get('q')

const idx = lunr(function () {
    // Search these fields
    this.ref('id')
    this.field('title', {
        boost: 15
    })
    this.field('tags')
    this.field('content', {
        boost: 10
    })

    // Add the documents from your search index to
    // provide the data to idx
    for (const key in window.store) {
        this.add({
        id: key,
        title: window.store[key].title,
        tags: window.store[key].category,
        content: window.store[key].content
        })
    }
})

const results = idx.search(query)

const searchResults = document.getElementById('results')

if (results.length) { // Length greater than 0 is truthy
    let resultList = ''
    for (const n in results) {
      // Use the unique ref from the results list to get the full item
      // so you can build its <li>
      const item = store[results[n].ref]
      resultList += '<li><p><a href="' + item.url + '">' + item.title + '</a></p>'
      // Add a short clip of the content
      resultList += '<p>' + item.content.substring(0, 150) + '...</p></li>'
    }
    searchResults.innerHTML = resultList
}

<li>
    <p>
        <a href=".../blog/add-search-to-hugo-with-lunr/">
        Add search to Hugo static sites with Lunr
        </a>
    </p>
    <p>Yes, you can have an interactive search feature on your static site!...</p>
</li>

else {
    searchResults.innerHTML = 'No results found.'
}
