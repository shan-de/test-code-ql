const http = require('http');

function fetchData(url) {
    http.get(url, (res) => {
        let data = '';

        // A chunk of data has been received.
        res.on('data', (chunk) => {
            data += chunk;
        });

        // The whole response has been received.
        res.on('end', () => {
            console.log(data);
        });
    }).on('error', (err) => {
        console.log("Error: " + err.message);
    });
}

// Insecure HTTP request
fetchData('https://example.com/api/data');