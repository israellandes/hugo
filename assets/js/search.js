var httpRequest = new XMLHttpRequest();
httpRequest.onreadystatechange = function() {
    if (httpRequest.readyState === 4 && httpRequest.status === 200) {
        const index = JSON.parse(httpRequest.responseText);
        // Search `index` for your search query
    }
};

httpRequest.open("GET", "/index.json");
httpRequest.send();

// XMLHttpRequest boilerplate from above
// ...
const index = JSON.parse(httpRequest.responseText);
const keys = ["title", "permalink", "tags", "contents"];
const pattern = new RegExp(query);  // See below for how we get the query
const results = index.filter(item => {
    for (var i = 0; i < keys.length; i++) {
        const key = keys[i];
        if (!item[key]) {
            continue;
        }

        if (key === "tags") {
            if (item[key].some(tag => pattern.test(tag.toLowerCase()))) {
                return true;
            }
        } else if (pattern.test(item[key].toLowerCase())) {
            return true;
        }
    }

    return false;
});
// ...

const match = window.location.href.match(/\?q=([^&]+)/);
if (!match) {
    return;
}

const query = decodeURIComponent(match[1].replace(/\+/g, " "));
const pattern = new RegExp(query.toLowerCase().replace(/[.*+\-?^${}()|[\]\\]/g, '\\$&'));

// Generate `results` as in the code block above
// ...
var html = "";
for (var i = 0; i < results.length; i++) {
    html += '<li><a href="' + results[i].permalink + '">' + results[i].title + '</a></li>'
}

document.getElementById("search-results").innerHTML = html;
