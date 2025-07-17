import { readFile } from 'fs/promises';
import { Pool } from 'pg';
import 'dotenv/config';

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
});

async function schemaDatabase() {
  const sqlData = await readFile('sql/schema.sql', 'utf8');

  try {
    const client = await pool.connect();

    // Create tables
    await client.query(sqlData);

    client.release();
  } catch (error) {
    console.error('Error creating tables:', error);
  } finally {
    await pool.end();
  }
}

schemaDatabase()
  .then(() => {
    console.log('Schema creation completed successfully');
  })
  .catch((error) => {
    console.error('Error in schema script:', error);
  });
