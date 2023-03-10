-- Users Table
INSERT INTO users (
    name, email, password) 
    VALUES (
    'Irha Ali', 'irhaali@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');
INSERT INTO users (
    name, email, password) 
    VALUES (
    'Pablo Escobar', 'pabloescobar@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');
INSERT INTO users (
    name, email, password) 
    VALUES (
    'Carmelo Anthony', 'canthony@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');

-- Properties table
INSERT INTO properties (
    title, description, owner_id, cover_photo_url, thumbnail_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, active, province, city, country, street, post_code) 
    VALUES (
    'Irha''s Property', 'Hello, my name is Jamal. Every sixty seconds in Africa, a minute passes. Together we can stop this. Thank you for your attention', (SELECT id FROM users WHERE email = 'irhaali@gmail.com'), 'https://images.pexels.com/photos/2088258/table-dining-room-chair-dining-area-2088258.jpeg', 'https://images.pexels.com/photos/2088258/table-dining-room-chair-dining-area-2088258.jpeg?auto=compress&cs=tinysrgb&h=350', 2438, 8, 2, 1, true, 'Prince Edward Island', 'Charlottetown', 'Canada', '1716 Misih Highway', '48752');
INSERT INTO properties (
    title, description, owner_id, cover_photo_url, thumbnail_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, active, province, city, country, street, post_code) 
    VALUES (
    'Irha''s Property', 'Hello, my name is Jamal. Every sixty seconds in Africa, a minute passes. Together we can stop this. Thank you for your attention', (SELECT id FROM users WHERE email = 'irhaali@gmail.com'), 'https://images.pexels.com/photos/2088258/table-dining-room-chair-dining-area-2088258.jpeg', 'https://images.pexels.com/photos/2088258/table-dining-room-chair-dining-area-2088258.jpeg?auto=compress&cs=tinysrgb&h=350', 2438, 8, 2, 1, true, 'Prince Edward Island', 'Charlottetown', 'Canada', '1716 Misih Highway', '48752');
INSERT INTO properties (
    title, description, owner_id, cover_photo_url, thumbnail_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, active, province, city, country, street, post_code) 
    VALUES (
    'Irha''s Property', 'Hello, my name is Jamal. Every sixty seconds in Africa, a minute passes. Together we can stop this. Thank you for your attention', (SELECT id FROM users WHERE email = 'irhaali@gmail.com'), 'https://images.pexels.com/photos/2088258/table-dining-room-chair-dining-area-2088258.jpeg', 'https://images.pexels.com/photos/2088258/table-dining-room-chair-dining-area-2088258.jpeg?auto=compress&cs=tinysrgb&h=350', 2438, 8, 2, 1, true, 'Prince Edward Island', 'Charlottetown', 'Canada', '1716 Misih Highway', '48752');

-- Reservations
INSERT INTO reservations (
    guest_id, property_id, start_date, end_date) 
    VALUES (
    (SELECT id FROM users WHERE email = 'irhaali@gmail.com'), 114, '2026-09-30', '2026-10-15');

INSERT INTO reservations (
    guest_id, property_id, start_date, end_date) 
    VALUES (
    (SELECT id FROM users WHERE email = 'pabloescobar@gmail.com'), 114, '2027-09-30', '2027-10-15');

INSERT INTO reservations (
    guest_id, property_id, start_date, end_date) 
    VALUES (
    (SELECT id FROM users WHERE email = 'canthony@gmail.com'), 114, '2028-09-30', '2028-10-15');

-- Property Reviews
INSERT INTO property_reviews (
    guest_id, property_id, reservation_id, rating, message) 
    VALUES (
    (SELECT id FROM users WHERE email = 'irhaali@gmail.com'), 114, (SELECT reservations.id FROM reservations JOIN users ON guest_id = users.id WHERE email = 'irhaali@gmail.com'), 4, 'Sigkez amafozuz zidak cirazke giikeak lazup cefumzeb ohefcob vugsi vudavi ahevi awogi tagjowos.');
INSERT INTO property_reviews (
    guest_id, property_id, reservation_id, rating, message) 
    VALUES (
    (SELECT id FROM users WHERE email = 'pabloescobar@gmail.com'), 114, (SELECT reservations.id FROM reservations JOIN users ON guest_id = users.id WHERE email = 'pabloescobar@gmail.com'), 4, 'Sigkez amafozuz zidak cirazke giikeak lazup cefumzeb ohefcob vugsi vudavi ahevi awogi tagjowos.');
INSERT INTO property_reviews (
    guest_id, property_id, reservation_id, rating, message) 
    VALUES (
    (SELECT id FROM users WHERE email = 'canthony@gmail.com'), 114, (SELECT reservations.id FROM reservations JOIN users ON guest_id = users.id WHERE email = 'canthony@gmail.com'), 4, 'Sigkez amafozuz zidak cirazke giikeak lazup cefumzeb ohefcob vugsi vudavi ahevi awogi tagjowos.');