CREATE USER freecodecamp WITH SUPERUSER;
CREATE DATABASE universe OWNER freecodecamp;
\c universe

CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    galaxy_type VARCHAR(30) NOT NULL,
    distance_from_earth NUMERIC(10, 2),
    has_supermassive_black_hole BOOLEAN NOT NULL
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    galaxy_id INT REFERENCES galaxy(galaxy_id) ON DELETE CASCADE NOT NULL,
    name VARCHAR(50) UNIQUE NOT NULL,
    age_in_millions_of_years INT NOT NULL,
    is_spherical BOOLEAN DEFAULT true,
    spectral_class VARCHAR(10)
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    star_id INT REFERENCES star(star_id) ON DELETE CASCADE NOT NULL,
    name VARCHAR(50) UNIQUE NOT NULL,
    planet_type VARCHAR(30) NOT NULL,
    has_life BOOLEAN NOT NULL,
    is_spherical BOOLEAN DEFAULT true,
    distance_from_star INT
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    planet_id INT REFERENCES planet(planet_id) ON DELETE CASCADE NOT NULL,
    name VARCHAR(50) UNIQUE NOT NULL,
    is_spherical BOOLEAN DEFAULT true,
    radius_in_km INT NOT NULL,
    discovery_year INT
);

CREATE TABLE star_type (
    star_type_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    is_common BOOLEAN NOT NULL
);

INSERT INTO galaxy (name, galaxy_type, distance_from_earth, has_supermassive_black_hole, description) VALUES
('Milky Way', 'Barred Spiral', 0.00, true, 'Galaksi Bima Sakti'),
('Andromeda', 'Spiral', 2.53, true, 'Galaksi tetangga'),
('Triangulum', 'Spiral', 2.73, false, 'Galaksi lokal'),
('Sombrero', 'Unbarred Spiral', 31.10, true, 'Galaksi Sombrero'),
('Whirlpool', 'Spiral', 23.00, true, 'Galaksi Whirlpool'),
('Large Magellanic Cloud', 'Spiral', 0.16, false, 'Galaksi satelit');

INSERT INTO star (galaxy_id, name, age_in_millions_of_years, is_spherical, spectral_class) VALUES
(1, 'Sun', 4600, true, 'G2V'),
(1, 'Alpha Centauri A', 6000, true, 'G2V'),
(1, 'Sirius', 242, true, 'A1V'),
(2, 'Andromedae A', 3000, true, 'O6'),
(3, 'Trianguli A', 1500, true, 'B2'),
(4, 'Sombrero Core Star', 8000, true, 'K0');

INSERT INTO planet (star_id, name, planet_type, has_life, is_spherical, distance_from_star) VALUES
(1, 'Mercury', 'Terrestrial', false, true, 58),
(1, 'Venus', 'Terrestrial', false, true, 108),
(1, 'Earth', 'Terrestrial', true, true, 150),
(1, 'Mars', 'Terrestrial', false, true, 228),
(1, 'Jupiter', 'Gas Giant', false, true, 778),
(1, 'Saturn', 'Gas Giant', false, true, 1427),
(1, 'Uranus', 'Ice Giant', false, true, 2871),
(1, 'Neptune', 'Ice Giant', false, true, 4497),
(2, 'Proxima Centauri b', 'Terrestrial', false, true, 7),
(2, 'Proxima Centauri c', 'Super-Earth', false, true, 220),
(3, 'Sirius b Planet I', 'Exoplanet', false, true, 500),
(4, 'Andromeda Alpha 1', 'Exoplanet', false, true, 300);

INSERT INTO moon (planet_id, name, is_spherical, radius_in_km, discovery_year) VALUES
(3, 'Moon', true, 1737, -1000),
(4, 'Phobos', false, 11, 1877),
(4, 'Deimos', false, 6, 1877),
(5, 'Io', true, 1821, 1610),
(5, 'Europa', true, 1560, 1610),
(5, 'Ganymede', true, 2634, 1610),
(5, 'Callisto', true, 2410, 1610),
(6, 'Mimas', true, 198, 1789),
(6, 'Enceladus', true, 252, 1789),
(6, 'Tethys', true, 533, 1684),
(6, 'Dione', true, 561, 1684),
(6, 'Rhea', true, 763, 1672),
(6, 'Titan', true, 2574, 1655),
(6, 'Iapetus', true, 734, 1671),
(7, 'Miranda', true, 235, 1948),
(7, 'Ariel', true, 578, 1851),
(7, 'Umbriel', true, 584, 1851),
(7, 'Titania', true, 788, 1787),
(7, 'Oberon', true, 761, 1787),
(8, 'Triton', true, 1353, 1846);

INSERT INTO star_type (name, description, is_common) VALUES
('Yellow Dwarf', 'Katai kuning', true),
('Red Dwarf', 'Katai merah', true),
('Blue Giant', 'Raksasa biru', false);
