
# Fitness Tracking Database
The Fitness Tracking Database prioritizes the analysis and management of stretching and exercise activities, including tracking when each activity was last performed by a user. It is designed to provide structured records of fitness-related data points, such as available or performed stretches, exercises, their repetitions and sets, and the recorded information about who performed these activities and when.

# Database Information

## 1. Person Table:
- **Description:** This table lists attributes of User ID, First Name, Last Name, Username, Password, Email and Updated Timestamp. NOTE: The username and password are invalid credentials.
- **Entity name:** person
- **Users:** Rodger Evans, Daxton Knight, Brandon Brandt
<br/>

## 2. Person Statistics Table:
- **Description:** This table lists attributes of Person ID **(foreign key)**, Gender, Age, and Height in Feet, Height in Inches, Weight, BMI, Intensity Level, and Updated Timestamp.
- **Entity name:** personStatistics
- **Age:** 25, 22, 24
<br/>

## 3. Activity Table:
- **Description:** This table lists attributes of Activity ID, Name, and Instructions.
- **Entity name:** activity
- **Activities:** Bench Press, Plate Squeeze, Cable Chest Fly, Dumbbell Chest Fly, Leaning Lateral Raise, Overhead Press, Tricep Overhead Extension, Tricep Cable Pushdown, Bicep Curl, Hammer Curl, Bent Over Row, Face Pulls, Seated Cable Rows, Pull Ups, Hip Thrust, Squats, Leg Press, Deadlifts, Lunges, Calf Raises, Biking, Running, Swimming, Standing Pec Stretch, Arm Crossover Stretch, Overhead Tricep Stretch, Toe Touches, Arm Circles, Leaning Lat Stretch, Neck Rolls, Standing Quad Stretch, Seated Hamstring Stretch, Figure Four, Leaning Calf Stretch, Kneeling Quad Stretch, Pigeon Pose, Hamstring Scoops, The Karaoke Crossover, High Knees, Butt Kicks, Gate Hip Opener, Jumping Jacks, Cobra Stretch, Cat-Cow Stretch.
<br/>

## 4. Activity Statistics Table:
- **Description:** This table lists attributes of Activity ID, Person ID **(foreign key)**, Sets, Reps, Duration, Started Timestamp, and Ended Timestamp.
- **Entity name:** activityStatistics
- **Duration:** 0.50, 0.25, 0.50, 0.25, 14.00, 15.00, 1.00, 30.00, 3.00, 2.00, 13.00, 15.00.
<br/>

## 5. Stretch Table:
- **Description:** This table lists attributes of Activity ID **(foreign key)**, Category, Target.
- **Entity name:** stretches
- **Target:** Chest, Shoulder, Tricep, Hamstring, Shoulder, Back, Neck, Quadricep, Hamstring, Glute, Calf, Quadricep, Glute, Hamstring, Glute, Glute, Quadricep, Hamstring, Glute, Legs, Abs, Abs.    
<br/>

## 6. Exercise Table:
- **Description:** This table lists attributes of Activity ID **(foreign key)**, Category, Target.
- **Entity name:** exercises
- **Target:** Chest, Chest, Chest, Chest, Shoulder, Shoulder, Tricep, Tricep, Bicep, Bicep, Back, Back, Back, Back, Glute, Glute, Glute, Hamstring, Hamstring, Calf, Legs, Legs, Abs.    
<br/>

## 7. Exercise Tips Table:
- **Description:** This table lists attributes of Exercise ID **(foreign key)**, Tip.
- **Entity name:** exerciseTips
- **Exercise ID:** 1, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 8, 9, 9, 10, 11, 12, 13, 14, 15, 15, 16, 16, 17, 18, 18, 19, 20, 20, 21, 21, 22, 23, 23, 23.  
<br/>

#  Common use-cases
**1.** To examine which users have had history with a exercise.<br/>

**2.** To determine time period since a user completed a workout.<br/>

**3.** To monitor progress of reps and sets performed by a user.

