import { readFile } from 'fs/promises';
import { Pool } from 'pg';
import 'dotenv/config';

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
});

async function seedDatabase() {
  const sqlData = await readFile('sql/seed.sql', 'utf8');

  try {
    const client = await pool.connect();

    // Insert sample data
    await client.query(sqlData);

    client.release();
  } catch (error) {
    console.error('Error seeding database:', error);
  } finally {
    await pool.end();
  }
}

seedDatabase()
  .then(() => {
    console.log('Seeding completed successfully');
  })
  .catch((error) => {
    console.error('Error in seed script:', error);
  });
