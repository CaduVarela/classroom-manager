import { Router } from 'express'

import { zodValidate } from '../utils/zodValidate'
import { PrismaClient } from '@prisma/client'
import { prismaCreate, prismaDelete, prismaFindMany, prismaFindUnique, prismaUpdate } from '../utils/factoriesRoute'

import { zodClassroomCreate, zodClassroomUpdate } from '../zodSchemas/zodClassroom'

const prisma = new PrismaClient()
const model = prisma.classroom

const route = Router()

route.post('/',
  zodValidate(zodClassroomCreate),
  prismaCreate(model))

route.get('/',
  prismaFindMany(model, { students: true }))

route.get('/:id',
  prismaFindUnique(model, { students: true }))

route.put('/:id',
  zodValidate(zodClassroomUpdate),
  prismaUpdate(model))

route.delete('/:id',
  prismaDelete(model))

export default route