$(() => {
  // Login form HTML
  const $logInForm = $(`
  <form id="login-form" class="login-form">
      <p>Login</p>
      <div class="login-form__field-wrapper">
        <input type="email" name="email" placeholder="Email">
      </div>

      <div class="login-form__field-wrapper">
          <input type="password" name="password" placeholder="Password">
        </div>

      <div class="login-form__field-wrapper">
          <button>Login</button>
          <a id="login-form__cancel" href="#">Cancel</a>
      </div>
    </form>
  `);
  window.$logInForm = $logInForm;

  // What to do once login form is submitted
  $logInForm.on('submit', function(event) {
    event.preventDefault();
    const data = $(this).serialize();
    logIn(data)
      .then(json => {
        if (!json.user) {
          views_manager.show('error', `Failed to login`);
          return;
        }
        // Update the header to the user logged in and show their listings
        header.update(json.user);
        views_manager.show('listings');
      });
  });

  // What to do when Cancel button login form is pressed
  $('body').on('click', '#login-form__cancel', function() {
    views_manager.show('listings');
    return false;
  });
});