import http from "http";

function sayHello(name: string): string {
    return `Hello, ${name}!`;
}

// Insecure HTTP request for testing
http.get("http://example.com", (res) => {
    console.log(`Status Code: ${res.statusCode}`);
});

console.log(sayHello("Hello!"));