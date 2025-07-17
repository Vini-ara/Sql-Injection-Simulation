import { Controller, Get, Query } from '@nestjs/common';
import { UsersService } from './users.service';

@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Get()
  findAll(@Query('findEmail') findEmail: string | undefined = undefined) {
    return this.usersService.findAll(findEmail);
  }
}
