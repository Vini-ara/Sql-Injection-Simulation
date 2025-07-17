import { Injectable, Inject } from '@nestjs/common';
import { Pool, QueryResult } from 'pg';
import { constants } from 'src/constants';

type User = {
  id: number;
  email: string;
};

@Injectable()
export class UsersService {
  constructor(@Inject(constants.PG_CONNECTION) private dbConnection: Pool) {}

  async findAll(findEmail?: string) {
    const query = `SELECT * FROM users WHERE email=${findEmail ? `'${findEmail}'` : 'email IS NOT NULL'}`;

    return this.dbConnection
      .query(query)
      .then((result: QueryResult<User>) => result.rows)
      .catch((error: any) => {
        console.error('Database query error:', error);
        throw new Error('Database query failed');
      });
  }
}
