const http = require("http");
const httpProxy = require("http-proxy");

const TARGET = "http://141.145.215.131:20090";

const proxy = httpProxy.createProxyServer({
  target: TARGET,
  ws: true,
  changeOrigin: true
});

const server = http.createServer((req, res) => {
  proxy.web(req, res, {}, (err) => {
    console.error("HTTP proxy error:", err);
    res.writeHead(502);
    res.end("Bad gateway");
  });
});

server.on("upgrade", (req, socket, head) => {
  proxy.ws(req, socket, head, {}, (err) => {
    console.error("WS proxy error:", err);
    socket.destroy();
  });
});

const PORT = process.env.PORT || 10000;
server.listen(PORT, () => {
  console.log(`Proxy listening on port ${PORT}, targeting ${TARGET}`);
});
