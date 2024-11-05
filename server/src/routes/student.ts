import { Router } from 'express'

import { zodValidate } from '../utils/zodValidate'
import { PrismaClient } from '@prisma/client'
import { prismaCreate, prismaDelete, prismaFindMany, prismaFindUnique, prismaUpdate } from '../utils/factoriesRoute'

import { zodStudentCreate, zodStudentUpdate } from '../zodSchemas/zodStudent'

const prisma = new PrismaClient()
const model = prisma.student

const route = Router()

route.post('/',
  zodValidate(zodStudentCreate),
  prismaCreate(model))

route.get('/',
  prismaFindMany(model, { classrooms: true }))

route.get('/:id',
  prismaFindUnique(model, { classrooms: true }))

route.put('/:id',
  zodValidate(zodStudentUpdate),
  prismaUpdate(model))

route.delete('/:id',
  prismaDelete(model))

export default route