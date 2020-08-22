
import routes from './routes.js';
import Nav from './components/Nav.js';

// Render main route and static navbar
m.mount(document.getElementById("nav"), Nav);
m.route(document.getElementById("app"), "/", routes);
