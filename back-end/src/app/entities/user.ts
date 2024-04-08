import { Car } from "./Car";
import { City } from "./City";
import { Course } from "./Course";
import { Passenger } from "./Passenger";
import { Trip } from "./Trip";

export interface NotificationProps {
    name: string;
    email: string;
    image?: string;
    cars: Car[];
    course?: Course;
    courseId?: string;
    city?: City;
    cityId?: number;
    drivenTrips: Trip[];
    secondaryTrips: Trip[];
    passengerAt: Passenger[];
    finishedRegister: boolean;
    description?: string;
}

export class User {
    private _id: string;
    private _registrationNumber: number;
}