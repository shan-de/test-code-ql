import http from "http";
import fs from "fs";
import child_process from "child_process";

function sayHello(name: string): string {
    return `Hello, ${name}!`;
}

// Insecure HTTP request for testing
http.get("http://example.com", (res) => {
    console.log(`Status Code: ${res.statusCode}`);
});

// Hardcoded sensitive information
const apiKey = "12345-SECRET-API-KEY"; // Hardcoded API key

fs.writeFile("/tmp/test.txt", "This is a test", (err) => {
    if (err) {
        console.error("Error writing to file:", err);
    }
});

// Command injection vulnerability
const userInput = "ls"; // Simulated user input
child_process.exec(userInput, (err, stdout, stderr) => {
    if (err) {
        console.error("Error executing command:", err);
        return;
    }
    console.log(`Command output: ${stdout}`);
});

// Dynamic code execution
const dynamicCode = "console.log('Dynamic code execution!')";
eval(dynamicCode); // Avoid using eval in production code

console.log(sayHello("Hello!"));