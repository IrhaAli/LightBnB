$(() => {
  // Begin on the property listings HTML while all the properties are loading.
  const $propertyListings = $(`
  <section class="property-listings" id="property-listings">
      <p>Loading...</p>
    </section>
  `);
  window.$propertyListings = $propertyListings;
  window.propertyListings = {};

  // Append a property to the property listings container
  function addListing(listing) {
    $propertyListings.append(listing);
  }

  // DON'T KNOW YET
  function clearListings() {
    $propertyListings.empty();
  }
  window.propertyListings.clearListings = clearListings;

  // Add properties one by one
  function addProperties(properties, isReservation = false) {
    clearListings();
    for (const propertyId in properties) {
      const property = properties[propertyId];
      const listing = propertyListing.createListing(property, isReservation);
      addListing(listing);
    }
  }
  window.propertyListings.addProperties = addProperties;
});