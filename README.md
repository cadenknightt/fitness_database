
# Fitness Tracking Database
The Fitness Tracking Database prioritizes the analysis and management of stretching and exercise activities, including tracking when each activity was last performed by a user. It is designed to provide structured records of fitness-related data points, such as performed stretches, exercises, their repetitions and sets, and the recorded information about who performed these activities and when.

# Database Information

## 1. Users Table:
- **Description:** This table mandates there be attributes including User ID, First Name, Last Name, and Email.
- **Entity type:** Users
- **Users:** Sam Evans, Maverick Zackman
<br/>

## 2. Stretches Table:
- **Description:** This table mandates there be attributes including Stretch ID, User ID **(foreign key)**, Stretch Name, Target Area, Description.
- **Entity type:** Stretches
- **Stretches:** Calf Stretch, Shoulder Stretch
<br/>

## 3. Exercises Table:
- **Description:** This table mandates there be attributes including Exercise ID, Exercise Name, Muscle Group, Reps, and Sets.
- **Entity type:** Exercises
- **Exercies:** Bench Press, Deadlift
<br/>

## 4. Workouts Table:
- **Description:** This table mandates there be attributes including Workout ID, User ID **(foreign key)**, Stretch ID **(foreign key)**, Workout Date, and Duration.
- **Entity type:** Workouts
- **Workouts:** 2024-03-25, 2024-05-13
<br/>

#  Common use-cases
**1.** To examine which users have had history with a exercise.<br/>

**2.** To determine time period since a user completed a workout.<br/>

**3.** To monitor progress of reps and sets performed by a user.

