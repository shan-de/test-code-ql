import http from "http";
import child_process from "child_process";

// Insecure HTTP request
http.get("https://example.com", (res) => {
    console.log("Insecure HTTP request made.");
});

// Hardcoded secret
const password = "super-secret-password";

// Command injection
const userInput = "ls";
child_process.exec(userInput);

// Dynamic code execution
eval("console.log('This is eval!')");