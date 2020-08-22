const app = require("./app");
const enableWs = require('express-ws');

console.log(`Instance name: ${process.env.INSTANCE_NAME}`);
console.log(`Data directory: ${process.env.HOST_DATA_DIR}`);

// enable websockets
enableWs(app);

app.listen(8080, () => console.log('Listening on http://127.0.0.1:8080'));

var Docker = require('dockerode');
var docker = new Docker({socketPath: '/var/run/docker.sock'});

docker.listContainers()
.then(list => console.log(list))
.catch(e => console.error(e));
