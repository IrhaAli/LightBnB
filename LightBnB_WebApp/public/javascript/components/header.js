$(() => {
  window.header = {};

  // Update page header based on whether a user is logged in or not
  const $pageHeader = $('#page-header');
  let currentUser = null;
  function updateHeader(user) {
    currentUser = user;
    $pageHeader.find("#page-header__user-links").remove();
    let userLinks;

    if (!user) {
      userLinks = `
      <nav id="page-header__user-links" class="page-header__user-links">
        <ul>
          <li class="home">🏠</li>
          <li class="search_button">Search</li>
          <li class="login_button">Log In</li>
          <li class="sign-up_button">Sign Up</li>
        </ul>
      </nav>
      `;
    } else {
      userLinks = `
      <nav id="page-header__user-links" class="page-header__user-links">
        <ul>
          <li class="home">🏠</li>
          <li class="search_button">Search</li>
          <li>${user.name}</li>
          <li class="create_listing_button">Create Listing</li>
          <li class="my_listing_button">My Listings</li>
          <li class="my_reservations_button">My Reservations</li>
          <li class="logout_button">Log Out</li>
        </ul>
      </nav>
      `;
    }

    $pageHeader.append(userLinks);
  }
  // Wherever header.update(user) is used it calls updateHeader(user)
  window.header.update = updateHeader;

  // Once logged in, update the header
  getMyDetails()
    .then(function(json) {
      updateHeader(json.user);
    });

  // What to do when clicked on My Reservations button (user logged in)
  $("header").on("click", '.my_reservations_button', function() {
    propertyListings.clearListings();
    getAllReservations()
      .then(function(json) {
        propertyListings.addProperties(json.reservations, true);
        views_manager.show('listings');
      })
      .catch(error => console.error(error));
  });

  // What to do when clicked on My Listings button (user logged in)
  $("header").on("click", '.my_listing_button', function() {
    propertyListings.clearListings();
    getAllListings(`owner_id=${currentUser.id}`)
      .then(function(json) {
        propertyListings.addProperties(json.properties);
        views_manager.show('listings');
      });
  });

  // What to do when clicked on the home icon
  $("header").on("click", '.home', function() {
    propertyListings.clearListings();
    getAllListings()
      .then(function(json) {
        propertyListings.addProperties(json.properties);
        views_manager.show('listings');
      });
  });

  // What to do when clicked on the Search button
  $('header').on('click', '.search_button', function() {
    views_manager.show('searchProperty');
  });

  // What to do when clicked on the Log In button (no user logged in)
  $("header").on('click', '.login_button', () => {
    views_manager.show('logIn');
  });

  // What to do when clicked on the Sign Up button (no user logged in)
  $("header").on('click', '.sign-up_button', () => {
    views_manager.show('signUp');
  });

  // What to do when clicked on the Log Out button (user logged in)
  $("header").on('click', '.logout_button', () => {
    logOut().then(() => {
      header.update(null);
    });
  });

  // What to do when clicked on Create Listing button (user logged in)
  $('header').on('click', '.create_listing_button', function() {
    views_manager.show('newProperty');
  });

});