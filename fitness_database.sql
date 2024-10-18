CREATE TABLE person (
	id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
    firstName VARCHAR(12) NOT NULL,
    lastName VARCHAR(12) NOT NULL,
    username VARCHAR(18) NOT NULL,
    password VARCHAR(30) NOT NULL,
    email VARCHAR(50) NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE TABLE personStatistics (
	personID SMALLINT UNSIGNED NOT NULL,
    gender VARCHAR(6) NOT NULL,
    age SMALLINT UNSIGNED NOT NULL,
    heightFeet SMALLINT UNSIGNED NOT NULL,
    heightInches SMALLINT UNSIGNED NOT NULL,
    weight SMALLINT UNSIGNED NOT NULL,
    BMI DECIMAL(3,1) NOT NULL,
    intensityLevel ENUM('Light', 'Moderate', 'Heavy') NOT NULL,
    updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (personID),
    FOREIGN KEY (personID) REFERENCES person(id)
		ON DELETE CASCADE -- When ID is deleted in the parent table, it occurs also in this table.
        ON UPDATE CASCADE -- When ID in the parent table is updated, the value in this table also updates.
);

CREATE TABLE activity (
	id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
    name VARCHAR(35) NOT NULL,
    instructions TEXT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE activityStatistics (
	id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
    activityID SMALLINT UNSIGNED NOT NULL,
    personID SMALLINT UNSIGNED NOT NULL,
    sets INT UNSIGNED NOT NULL,
    reps INT UNSIGNED NOT NULL,
    duration DECIMAL(5,2) NOT NULL,
    started TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ended TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (activityID) REFERENCES activity(id)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (personID) REFERENCES person(id)
		ON DELETE CASCADE 
        ON UPDATE CASCADE
);

CREATE TABLE stretch (
	activityID SMALLINT UNSIGNED NOT NULL,
    category ENUM('Static', 'Dynamic') NOT NULL,
    target ENUM('Chest', 'Shoulder', 'Tricep', 'Neck', 'Back', 'Glute', 'Hamstring', 'Calf', 'Quadricep', 'Abs', 'Legs'),
    PRIMARY KEY (activityID),
    FOREIGN KEY (activityID) REFERENCES activity(id)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE exercise (
	activityID SMALLINT UNSIGNED NOT NULL,
    category ENUM('Strength', 'Cardio') NOT NULL,
    target ENUM('Chest', 'Shoulder', 'Tricep', 'Bicep', 'Back', 'Glute', 'Hamstring', 'Calf', 'Legs', 'Abs'),
    PRIMARY KEY (activityID),
    FOREIGN KEY (activityID) REFERENCES activity(id)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE exerciseTips  (
	id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    exerciseID SMALLINT UNSIGNED NOT NULL,
    tip TEXT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (exerciseID) REFERENCES exercise(activityID)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO person (firstName, lastName, username, password, email, created)
VALUES ('Rodger', 'Evans', 'captainevans', 'sh3ildavenger!99', 'rodgerevans@gmail.com', '2024-09-28 11:11:39'),
	('Daxton', 'Knight', 'daxtonlifts', 'braveKnight6!', 'daxtonevans@gmail.com', '2024-09-28 15:38:28'),
	('Brandon', 'Brandt', 'whoisbrandon', 'fearlessRanger5!!', 'brandonbrandt@gmail.com', '2024-09-29 08:34:58');
    
INSERT INTO personStatistics (personID, gender, age, heightFeet, heightInches, weight, BMI, intensityLevel, updated)
VALUES (1, 'Male', 25, 5, 9, 172, 21.5, 'Moderate', '2024-09-28 11:11:39'),
	(2, 'Male', 22, 5, 10, 185, 22.1, 'Moderate', '2024-09-28 15:38:28'),
    (3, 'Male', 24, 5, 7, 176, 22.2, 'Heavy', '2024-09-29 08:34:58');
    
INSERT INTO activity (name, instructions)
VALUES ('Bench Press', 'To perform bench press, lay inclined or flat on a bench. Start at your lower chest with wide grip on barbell or dumbells then push off until there is full arm extension. Then control the weight back down to the starting position.'),
	('Plate Squeeze', 'To perform plate squeeze, hold and squeeze the weighted plate between hands at inner chest. Push plate distantly until your arms are fully extended in a controlling motion, focusing on contracting the chest as peak. Slowly bring the weight back to the starting position.'),
    ('Cable Chest Fly', 'To perform cable chest flyes, use a cable machine while standing center. Grasp the handles with arms extended out to sides at chest height. Bring the handles together in front of your chest in a wide arc, squeezing your chest muscles at peak contraction before returning to the starting position.'),
    ('Dumbbell Chest Fly', 'To perform dumbbell chest flyes, lie flat on bench with a dumbbell in each hand, start with arms extended above chest and a slight bend in the elbows. Then lower dumbbells out to the sides in a wide arc, providing chest stretch sensation before carrying them back together above chest.'),
    ('Leaning Lateral Raise', 'To perform leaning lateral raises, slightly lean body to one side holding a dumbbell in the opposite hand. With the other hand resting on a wall or bench, raise dumbbell away from body in controlled manner until arm is parallel to ground. Finally, lower the weight back down with control.'),
    ('Overhead Press', 'To perform overhead press, stand feet shoulder-width apart holding a barbell or dumbbells at shoulder height. Press weight overhead until your arms are fully extended. Then lower the weight back to the starting position.'),
    ('Tricep Overhead Extension', 'To perform tricep overhead extension, stand or sit with a dumbbell with both hands above your head, arms fully extended. Keeping your elbows close to your head, slowly lower the weight behind your head until your triceps stretch, then straighten your arms to starting position.'),
    ('Tricep Cable Pushdown', 'To perform tricep cable pushdowns, grasp a cable attachment like straight bar or rope with both hands, keeping your elbows close to your sides like a chicken. Push the attachment down towards your thighs by extending your arms fully, then slowly return to the starting position.'),
    ('Bicep Curl', 'To perform bicep curls, stand with a dumbbell horizontally in each hand, arms fully extended at your sides with palms facing forward. Keeping your elbows close to your torso, curl the weights upward by bending your elbows until the dumbbells reach shoulder level. Hold, then slowly lower the weights back to the starting position.'),
    ('Hammer Curl', 'To perform hammer curls, stand with a dumbbell vertically in each hand with thumbs up, arms fully extended at your sides with palms facing forward. Keeping your elbows close to your torso, curl the weights upward by bending your elbows until the dumbbells reach shoulder level. Hold, then slowly lower the weights back to the starting position.'),
    ('Bent Over Row', 'To perform bent over rows, stand with feet shoulder-width apart and hold barbell or dumbbells with both hands. Hinge at hips and bend knees slightly, lowering your torso until it is nearly parallel to ground, keeping back straight. Pull weights toward abdomen by bending elbows and squeezing shoulder blades together. Lower weights back to the starting position with control.'),
    ('Face Pulls', 'To perform face pulls, stand in front of a cable machine and step back with the pulley set at upper chest height. Grasp the rope attachment with both hands, palms facing each other. Pull the rope towards your face, keeping your elbows high and squeezing your shoulder blades together. Slowly return to the starting position.'),
    ('Seated Cable Rows', 'To perform seated cable rows, sit by cable row machine with your feet placed on the foot platform with knees slightly bent. Grasp handle or bar with both hands and pull it towards your abdomen, keeping your back straight, still, and elbows close to your body. Squeeze your shoulder blades together at the peak of the movement, then slowly extend your arms back to the starting position.'),
    ('Pull Ups', 'To perform pull-ups, grasp a pull-up bar with an overhand grip, hang with arms fully extended. Then pull your body up until your chin is above the bar. Lower yourself back down with control.'),
    ('Hip Thrust', 'To perform a hip thrust, sit on the ground with your upper back against a bench and your knees bent, feet flat on the floor. Optionally, place a barbell or weight across your hips. Drive through your heels to lift your hips toward the ceiling, squeezing your glutes at the top until your body forms a straight line from shoulders to knees. Lower your hips back down to the starting position and repeat.'),
    ('Squats', 'To perform squats, stand with your feet shoulder-width apart while holding a barbell across your upper chest/back or dumbbells at your sides. Lower your body by bending your knees and pushing your hips back, keeping your chest up and back straight. Once your thighs are parallel to the ground or lower, push through your heels to return to the starting position.'),
    ('Leg Press', 'To perform leg presses, use a leg press machine and sit with your back against the padded support and place your feet shoulder-width apart on the platform. Lower the platform by bending your knees towards your chest, then push it back to the starting position by extending your legs.'),
    ('Deadlifts', 'To perform deadlifts, stand feet hip-width apart with barbell positioned over the middle of your feet. Bend at the hips and knees to grip the barbell with both hands, keeping your back straight and chest up. Push through your heels to lift the barbell by extending your hips and knees simultaneously to the standing position. Lower the barbell back to the ground with control.'),
    ('Lunges', 'To perform lunges, stand upright with your feet hip-width apart. Step forward or backward with one leg and lower your body until both knees are bent at approximately 90 degrees, ensuring that your front/back knee does not extend past your toes. Push through your front heel to return to the starting position and repeat on the other leg. This can be done with body weight or added resistance for increased intensity.'),
    ('Calf Raises', 'To perform calf rasies, stand feet shoulder-width apart with dumbell in each hand, raise heels off ground by pushing through the balls of your feet. Lower back down with control to complete movement.'),
    ('Biking', 'Biking is performed on any approved trail or park and is alternative to running. You can bike any distance you want while being comfortable, do not overtrain.'),
    ('Running', 'Running is perfromed at the track, running on dirt roads to prevent injury on your shins, or on treadmills. You can run any distance you want while being comfortable, do not overtrain.'),
    ('Swimming', 'Swimming can be great for whom prefer cardio that is less stress on the body, thanks to water. This is performed in lap pools or contained bodies of water. Preferably, practice on strokes like freestroke, backstroke. If challenged, try the butterfly.'),
    ('Standing Pec Stretch', 'Clasp hands behind your back, and push the hands down until you feel a stretch in the chest. Hold this postion for a few seconds.'),
    ('Arm Crossover Stretch', 'Pull one arm across your chest with the opposite hand pulling the extended arm toward your body. Hold this postion for a few seconds.'),
    ('Overhead Tricep Stretch', 'Raise one arm over your head, bend the elbow, and press hand on elbow toward the back of head. Hold this postion for a few seconds.'),
    ('Toe Touches', 'Clasp your hands and push downward to toes with straight legs. Hold this postion for a few seconds.'),
    ('Arm Circles', 'Extend arms outward to your sides at chest level, continue by creating small or big circles.'),
    ('Leaning Lat Stretch', 'Reach one arm over your head, lean to opposite side, Hold this position for a few seconds.'),
    ('Neck Rolls', 'Gently tilt your head in a circular motion going clockwise and counter-clockwise.'),
    ('Standing Quad Stretch', 'Stand one-legged and then bend the opposite leg to untill it hits glutes. Hold this position for a few seconds.'),
    ('Seated Hamstring Stretch', 'Sit with one or both legs extended and then reach toward your toes until you feel a stretch. Hold this position for a few seconds.'),
    ('Figure Four', 'Lie on your back and bring the ankle to the opposite knee. Then pull the knee toward your chest. Hold this position for a few seconds.'),
    ('Leaning Calf Stretch', 'Stand at one side of a wall then place one foot behind your body and press the heel to floor. Hold this position for a few seconds.'),
    ('Kneeling Hip Flexor Stretch', 'Step into a deep lunge, with back leg extended, and then lower your back leg until your knee touches the floor. Then push your hips forward and shoulders back. Hold this position for a few seconds.'),
    ('Kneeling Quad Stretch', 'Kneel on one knee and grab the foot of the opposite back leg. Then gently pull it toward glutes. Hold this position for a few seconds.'),
    ('Pigeon Pose', 'Get into a plank position and bring the knee forward and place it behind your wrist, extend other leg straight back. Hold this position for a few seconds.'),
    ('Hamstring Scoops', 'Stand with one foot forward, heel on the ground and toes up. Bend at the hips and "scoop" your hands toward the floor as you stretch the hamstring of the extended leg. Stand up and switch legs, repeating the motion.'),
    ('The Karaoke Crossover', 'Stand with your feet shoulder-width apart. Step with one leg in front of the other and then step the trailing leg behind as you shuffle sideways. Keep rotating legs in a fluid motion as you move laterally.'),
    ('High Knees', 'Stand tall and alternate driving your knees up toward your chest, aiming for hip height or higher. Keep a fast pace and engage your core. Pump your arms as you lift your knees.'),
    ('Butt Kicks', 'Stand and jog in place, bringing your heels up toward your glutes with each step. Keep your torso upright and swing your arms naturally as you kick your heels up.'),
    ('Gate Hip Opener', 'Stand on one leg and lift the other knee up to hip height. Rotate the knee outward, then return to the starting position. Repeat on the other leg to "open the gate."'),
    ('Jumping Jacks', 'Stand with feet together and arms at your sides. Jump while spreading your feet apart and raising your arms overhead. Jump again to return to the starting position, and repeat at a steady pace and good form.'),
    ('Cobra Stretch', 'Lie face down with palms on the floor underneath the shoulders. Push your upper body upwards, arching your back while the hips are touching the ground. Hold this position for a few seconds.'),
    ('Cat-Cow Stretch', 'Get into a tabletop position and slowly alternate between arching your back (cow pose) and rounding your spine (cat pose). Focus on the stretch in your abs and lower back, holding each position for a few seconds.');
    
INSERT INTO activityStatistics (activityID, personID, sets, reps, duration, started, ended)
VALUES (24, 2, 2, 1, 0.50, '2024-10-01 07:34:59', '2024-10-01 07:35:29'),
	(25, 2, 1, 2, 0.25, '2024-10-01 07:36:11', '2024-10-01 07:37:26'),
    (28, 2, 2, 30, 0.50, '2024-10-01 07:37:40', '2024-10-01 07:38:10'),
    (39, 2, 1, 10, 0.25, '2024-10-01 07:37:40', '2024-10-01 07:38:10'),
    (1, 2, 4, 8, 14.00, '2024-10-01 07:42:12', '2024-10-01 07:56:12'),
    (3, 2, 4, 25, 15.00, '2024-10-01 08:12:15', '2024-10-01 08:27:15'),
    (43, 1, 3, 40, 1.00, '2024-10-01 14:33:19', '2024-10-01 14:34:19'),
    (23, 1, 8, 80, 30.00, '2024-10-01 14:33:19', '2024-10-01 14:34:19'),
    (41, 3, 2, 20, 3.00, '2024-10-02 05:40:35', '2024-10-02 05:43:35'),
    (39, 3, 2, 20, 2.00, '2024-10-02 05:44:20', '2024-10-02 05:47:20'),
    (15, 3, 4, 8, 13.00, '2024-10-02 05:55:03', '2024-10-02 06:08:03'),
    (16, 3, 4, 12, 15.00, '2024-10-02 06:11:34', '2024-10-02 06:26:34');
    
INSERT INTO stretch (activityID, category, target)
VALUES (24, 'Static', 'Chest'),
	(25, 'Static', 'Shoulder'),
    (26, 'Static', 'Tricep'),
    (27, 'Static', 'Hamstring'),
    (28, 'Dynamic', 'Shoulder'),
    (29, 'Static', 'Back'),
    (30, 'Dynamic', 'Neck'),
    (31, 'Static', 'Quadricep'),
    (32, 'Static', 'Hamstring'),
    (33, 'Static', 'Glute'),
    (34, 'Static', 'Calf'),
    (35, 'Static', 'Quadricep'),
    (36, 'Static', 'Glute'),
    (37, 'Static', 'Hamstring'),
    (38, 'Dynamic', 'Glute'),
    (39, 'Dynamic', 'Glute'),
    (40, 'Dynamic', 'Quadricep'),
    (41, 'Dynamic', 'Hamstring'),
    (42, 'Dynamic', 'Glute'),
    (43, 'Dynamic', 'Legs'),
    (44, 'Static', 'Abs'),
    (45, 'Static', 'Abs');
    
INSERT INTO exercise (activityID, category, target)
VALUES (1, 'Strength', 'Chest'),
	(2, 'Strength', 'Chest'),
    (3, 'Strength', 'Chest'),
    (4, 'Strength', 'Chest'),
    (5, 'Strength', 'Shoulder'),
    (6, 'Strength', 'Shoulder'),
    (7, 'Strength', 'Tricep'),
    (8, 'Strength', 'Tricep'),
    (9, 'Strength', 'Bicep'),
    (10, 'Strength', 'Bicep'),
    (11, 'Strength', 'Back'),
    (12, 'Strength', 'Back'),
    (13, 'Strength', 'Back'),
    (14, 'Strength', 'Back'),
    (15, 'Strength', 'Glute'),
    (16, 'Strength', 'Glute'),
    (17, 'Strength', 'Glute'),
    (18, 'Strength', 'Hamstring'),
    (19, 'Strength', 'Hamstring'),
    (20, 'Strength', 'Calf'),
    (21, 'Cardio', 'Legs'),
    (22, 'Cardio', 'Legs'),
    (23, 'Cardio', 'Abs');

INSERT INTO exerciseTips (exerciseID, tip)
VALUES (1, 'Slightly arch your body so the weight load is on your chest rather than the shoulders.'),
	(1, 'It should be a count of three until you lower the weight from full arm extension to chest contact to have more time under tension.'),
    (1, 'Use a wider than shoulder-width grip if your using a barbell so then you get more stretch in your chest.'),
    (2, 'Try using lighter weight to protect your joints from injury.'),
    (2, 'Place your hands in center of the plate to target the inner chest while placing hands on the outside of plate targets the outer chest.'),
    (3, 'Angling the direction of the movement can target different chest areas: low-to-high targets upper and high-to-low targets lower.'),
    (3, 'Grip handles to where palms face each other to reduce shoulder strain.'),
    (4, 'Slighty bend elbows to protect joints.'),
    (4, 'Stop the movement if there is strain in the shoulders, this could indicate overextending and should be a comfortable performance.'),
    (5, 'Do not overlean, but still slight enough to make more space for range of motion.'),
    (5, 'Do not lift the dumbbells to high as you are more prone to injury, target being parallel to the floor.'),
    (6, 'If you want to protect your spine, limit the amount of times you perform this workout per week because this workout primarily can target your shoulers, but can simultaneously degrade your whole body.'),
    (6, 'Slighly move your head and torso forward while you engage your glutes and core to lift heavier.'),
    (7, 'Keep your elbows pointed straight and still, additionally ensure you forearms are the only body part moving.'),
    (8, 'There are different attachments like straight bar, rope, or the V-bar attachment that targets different types of the tricep.'),
    (8, 'If a bar is used, grip it with both hands shoulder-width apart. If a rope is used, grip each end with a neutral grip (palms facing each other) for better engagement.'),
    (9, 'If possible, use a mirror to ensure there is correct form and arm alignment.'),
    (9, 'You should not be bouncing your upper body throughtout each curl: slow, stiff, and steady.'),
    (10, 'Activate your forearms and biceps at the same time to get more performance improvements and muscle growth.'),
    (11, 'Overhand, underhand, and neutral grips can provide different emphasis on your back and biceps.'),
    (12, 'If your new to lifting, start with lighter weights to focus on form as it is more important than just going off the hook.'),
    (13, 'Before you perform, ensure your cable is at eye level to effectively target upper back and rear delts.'),
    (13, 'Keep your elbows high and manuever them outward for correct performance.'),
    (14, 'Before you perform, ensure the cable is at lower chest level to target mid back.'),
    (15, 'Grip placement is important: shoulder-width targets lats, wide grip targets outer lats, and narrower grip for biceps and upper back.'),
    (15, 'Before pulling yourself up, retract your lats downward to improve shoulder stability.'),
    (16, 'When you are performing, make sure you legs are 90 degrees or you can go even lower to build your glutes more.'),
    (16, 'Push your knees out to avoid letting them cave in, which is considered bad form.'),
    (17, 'If you want to target the glutes and hamstrings place feet higher on platform and focusing on the quads requires lower foot placement.'),
    (18, 'The bar should be placed near the shins before the actual performance occurs to protect the lower back when lifting upward.'),
    (18, 'When lifting heavy, use a mixed grip which is where your hands are placed one overhand, one underhand to reduce the bar slipping from hands.'),
    (19, 'Many people make the mistake of lowering the their back knee on the floor during the repition, although it should almost touch.'),
    (20, 'Toes can be pointed in straight, outward, or inward directions to target different calf muscles.'),
    (20, 'Use a step or platform to provide more range of motion.'),
    (21, 'Many people forget to drink water before or throughout their ride, this can cause performance issues so avoid that.'),
    (21, 'Before you bike, ensure your knee is slightly bent at bottom of each pedal stroke ensuring comfortabilty.'),
    (22, 'Set small milestones to keep you motivated and on track to continue using this exercise.'),
    (22, 'Your body must be provided essential carbs, protein, and healthy fats after the workout to ensure effective recovery.'),
    (23, 'A strong core helps you maintain proper form and balance while swimming.'),
    (23, 'Use a snorkel if you want to focus on stroke efficiency wouthout the need to focus on turning the head to breath.'),
    (23, 'Incorporate tools like kickboards, pull buoys, or paddles to target specific areas of your swimming technique and build strength.');