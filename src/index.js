const app = require("./app");
const enableWs = require('express-ws');

// enable websockets
enableWs(app);

app.listen(8080, () => console.log('Listening on http://127.0.0.1:8080'));
