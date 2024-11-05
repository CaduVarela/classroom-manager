import { z } from "zod";

export const zodClassroomCreate = z.object({
    body: z.object({
        name: z.string(),
        $connect: z.object({
            students: z.number().array().optional(),
        }).strict().optional(),
    }).strict(),
});

export const zodClassroomUpdate = z.object({
    body: z.object({
        name: z.string().optional(),
        $connect: z.object({
            students: z.number().array().optional(),
        }).strict().optional(),
        $disconnect: z.object({
            students: z.number().array().optional(),
        }).strict().optional(),
    }).strict(),
});