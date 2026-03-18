import { createServer } from "node:http";

// Create a local server to receive data from
const server = createServer();

// Listen to the request event
server.on("request", (request, res) => {
  res.writeHead(200, { "Content-Type": "application/json" });
  res.end(
    JSON.stringify({
      data: "Hello World!",
    }),
  );
});

console.log("server listening on port 8000");
server.listen(8000);
