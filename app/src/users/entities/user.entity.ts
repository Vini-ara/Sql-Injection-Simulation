import { IsNumber, IsString } from 'class-validator';

export class User {
  @IsNumber()
  id: number;

  @IsString()
  email: string;
}
