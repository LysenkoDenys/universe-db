# Universe Database Project

## Overview

This project is a PostgreSQL database that models a fictional universe.  
It includes galaxies, stars, planets, moons, spaceships, and their relationships.  
The project was built to practice database design, normalization, and SQL queries.

## Database Structure

The database contains **five main tables** and **one join table**:

1. **galaxy** – Stores information about galaxies.
2. **star** – Stores stars, each linked to a galaxy.
3. **planet** – Stores planets, each linked to a star.
4. **moon** – Stores moons, each linked to a planet.
5. **spaceship** – Stores spaceships with various capacities.
6. **spaceship_planet** – Many-to-many relationship between spaceships and planets.

### Relationships

- **Galaxy → Star**: One-to-many
- **Star → Planet**: One-to-many
- **Planet → Moon**: One-to-many
- **Spaceship ↔ Planet**: Many-to-many (via `spaceship_planet`)

### Visualization

<img width="1531" height="902" alt="Image" src="https://github.com/user-attachments/assets/0134b437-871b-4886-b8d4-98bd40db299a" />

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/<your-username>/universe-db.git
   cd universe-db
   ```

## Import the database:

<code>
  bash
  psql -U <your-username> -d universe -f universe.sql
</code>

## Usage

Once imported, you can explore the data:

<code>
  sql
-- List all galaxies
SELECT * FROM galaxy;

-- Find all planets for a given star
SELECT p.name
FROM planet p
JOIN star s ON p.star_id = s.star_id
WHERE s.name = 'Sun';
</code>

## Files

universe.sql – Contains schema and data for the database.
README.md – Project description.

## License

This project is released under the MIT License.
