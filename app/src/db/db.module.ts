import { Module } from '@nestjs/common';
import { Pool } from 'pg';
import { constants } from 'src/constants';
import 'dotenv/config';

const dbProvider = {
  provide: constants.PG_CONNECTION,
  useValue: new Pool({
    connectionString: process.env.DATABASE_URL,
  }),
};

@Module({
  providers: [dbProvider],
  exports: [dbProvider],
})
export class DbModule {}
