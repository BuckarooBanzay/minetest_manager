
import html from './html.js';


export default {
  view: () => html`
    <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
      <a class="navbar-brand" href="#!/">Minetest manager</a>
      <div class="navbar-collapse collapse">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item">
            <a class="nav-link" href="#!/">
              <i class="fa fa-home"></i> Home
            </a>
          </li>
        </ul>
      </div>
    </nav>
  `
};
