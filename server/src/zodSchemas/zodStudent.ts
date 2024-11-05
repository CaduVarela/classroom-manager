import { z } from "zod";

export const zodStudentCreate = z.object({
    body: z.object({
        name: z.string(),
        email: z.string().email(),
        classrooms: z.number().array().optional(),
    }).strict(),
});

export const zodStudentUpdate = z.object({
    body: z.object({
        name: z.string().optional(),
        email: z.string().email().optional(),
        $connect: z
            .object({
                classrooms: z.number().array().optional(),
            })
            .strict()
            .optional(),
        $disconnect: z
            .object({
                classrooms: z.number().array().optional(),
            })
            .strict()
            .optional(),
    }).strict(),
});