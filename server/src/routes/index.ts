import { Router } from 'express'

import studentRouter from './student'
import classroomRouter from './classroom'

const router = Router()

router.use('/student', studentRouter)
router.use('/classroom', classroomRouter)

export { router }