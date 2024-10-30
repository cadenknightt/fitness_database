-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: fitness
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(35) NOT NULL,
  `instructions` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (1,'Bench Press','To perform bench press, lay inclined or flat on a bench. Start at your lower chest with wide grip on barbell or dumbells then push off until there is full arm extension. Then control the weight back down to the starting position.'),(2,'Plate Squeeze','To perform plate squeeze, hold and squeeze the weighted plate between hands at inner chest. Push plate distantly until your arms are fully extended in a controlling motion, focusing on contracting the chest as peak. Slowly bring the weight back to the starting position.'),(3,'Cable Chest Fly','To perform cable chest flyes, use a cable machine while standing center. Grasp the handles with arms extended out to sides at chest height. Bring the handles together in front of your chest in a wide arc, squeezing your chest muscles at peak contraction before returning to the starting position.'),(4,'Dumbbell Chest Fly','To perform dumbbell chest flyes, lie flat on bench with a dumbbell in each hand, start with arms extended above chest and a slight bend in the elbows. Then lower dumbbells out to the sides in a wide arc, providing chest stretch sensation before carrying them back together above chest.'),(5,'Leaning Lateral Raise','To perform leaning lateral raises, slightly lean body to one side holding a dumbbell in the opposite hand. With the other hand resting on a wall or bench, raise dumbbell away from body in controlled manner until arm is parallel to ground. Finally, lower the weight back down with control.'),(6,'Overhead Press','To perform overhead press, stand feet shoulder-width apart holding a barbell or dumbbells at shoulder height. Press weight overhead until your arms are fully extended. Then lower the weight back to the starting position.'),(7,'Tricep Overhead Extension','To perform tricep overhead extension, stand or sit with a dumbbell with both hands above your head, arms fully extended. Keeping your elbows close to your head, slowly lower the weight behind your head until your triceps stretch, then straighten your arms to starting position.'),(8,'Tricep Cable Pushdown','To perform tricep cable pushdowns, grasp a cable attachment like straight bar or rope with both hands, keeping your elbows close to your sides like a chicken. Push the attachment down towards your thighs by extending your arms fully, then slowly return to the starting position.'),(9,'Bicep Curl','To perform bicep curls, stand with a dumbbell horizontally in each hand, arms fully extended at your sides with palms facing forward. Keeping your elbows close to your torso, curl the weights upward by bending your elbows until the dumbbells reach shoulder level. Hold, then slowly lower the weights back to the starting position.'),(10,'Hammer Curl','To perform hammer curls, stand with a dumbbell vertically in each hand with thumbs up, arms fully extended at your sides with palms facing forward. Keeping your elbows close to your torso, curl the weights upward by bending your elbows until the dumbbells reach shoulder level. Hold, then slowly lower the weights back to the starting position.'),(11,'Bent Over Row','To perform bent over rows, stand with feet shoulder-width apart and hold barbell or dumbbells with both hands. Hinge at hips and bend knees slightly, lowering your torso until it is nearly parallel to ground, keeping back straight. Pull weights toward abdomen by bending elbows and squeezing shoulder blades together. Lower weights back to the starting position with control.'),(12,'Face Pulls','To perform face pulls, stand in front of a cable machine and step back with the pulley set at upper chest height. Grasp the rope attachment with both hands, palms facing each other. Pull the rope towards your face, keeping your elbows high and squeezing your shoulder blades together. Slowly return to the starting position.'),(13,'Seated Cable Rows','To perform seated cable rows, sit by cable row machine with your feet placed on the foot platform with knees slightly bent. Grasp handle or bar with both hands and pull it towards your abdomen, keeping your back straight, still, and elbows close to your body. Squeeze your shoulder blades together at the peak of the movement, then slowly extend your arms back to the starting position.'),(14,'Pull Ups','To perform pull-ups, grasp a pull-up bar with an overhand grip, hang with arms fully extended. Then pull your body up until your chin is above the bar. Lower yourself back down with control.'),(15,'Hip Thrust','To perform a hip thrust, sit on the ground with your upper back against a bench and your knees bent, feet flat on the floor. Optionally, place a barbell or weight across your hips. Drive through your heels to lift your hips toward the ceiling, squeezing your glutes at the top until your body forms a straight line from shoulders to knees. Lower your hips back down to the starting position and repeat.'),(16,'Squats','To perform squats, stand with your feet shoulder-width apart while holding a barbell across your upper chest/back or dumbbells at your sides. Lower your body by bending your knees and pushing your hips back, keeping your chest up and back straight. Once your thighs are parallel to the ground or lower, push through your heels to return to the starting position.'),(17,'Leg Press','To perform leg presses, use a leg press machine and sit with your back against the padded support and place your feet shoulder-width apart on the platform. Lower the platform by bending your knees towards your chest, then push it back to the starting position by extending your legs.'),(18,'Deadlifts','To perform deadlifts, stand feet hip-width apart with barbell positioned over the middle of your feet. Bend at the hips and knees to grip the barbell with both hands, keeping your back straight and chest up. Push through your heels to lift the barbell by extending your hips and knees simultaneously to the standing position. Lower the barbell back to the ground with control.'),(19,'Lunges','To perform lunges, stand upright with your feet hip-width apart. Step forward or backward with one leg and lower your body until both knees are bent at approximately 90 degrees, ensuring that your front/back knee does not extend past your toes. Push through your front heel to return to the starting position and repeat on the other leg. This can be done with body weight or added resistance for increased intensity.'),(20,'Calf Raises','To perform calf rasies, stand feet shoulder-width apart with dumbell in each hand, raise heels off ground by pushing through the balls of your feet. Lower back down with control to complete movement.'),(21,'Biking','Biking is performed on any approved trail or park and is alternative to running. You can bike any distance you want while being comfortable, do not overtrain.'),(22,'Running','Running is perfromed at the track, running on dirt roads to prevent injury on your shins, or on treadmills. You can run any distance you want while being comfortable, do not overtrain.'),(23,'Swimming','Swimming can be great for whom prefer cardio that is less stress on the body, thanks to water. This is performed in lap pools or contained bodies of water. Preferably, practice on strokes like freestroke, backstroke. If challenged, try the butterfly.'),(24,'Standing Pec Stretch','Clasp hands behind your back, and push the hands down until you feel a stretch in the chest. Hold this postion for a few seconds.'),(25,'Arm Crossover Stretch','Pull one arm across your chest with the opposite hand pulling the extended arm toward your body. Hold this postion for a few seconds.'),(26,'Overhead Tricep Stretch','Raise one arm over your head, bend the elbow, and press hand on elbow toward the back of head. Hold this postion for a few seconds.'),(27,'Toe Touches','Clasp your hands and push downward to toes with straight legs. Hold this postion for a few seconds.'),(28,'Arm Circles','Extend arms outward to your sides at chest level, continue by creating small or big circles.'),(29,'Leaning Lat Stretch','Reach one arm over your head, lean to opposite side, Hold this position for a few seconds.'),(30,'Neck Rolls','Gently tilt your head in a circular motion going clockwise and counter-clockwise.'),(31,'Standing Quad Stretch','Stand one-legged and then bend the opposite leg to untill it hits glutes. Hold this position for a few seconds.'),(32,'Seated Hamstring Stretch','Sit with one or both legs extended and then reach toward your toes until you feel a stretch. Hold this position for a few seconds.'),(33,'Figure Four','Lie on your back and bring the ankle to the opposite knee. Then pull the knee toward your chest. Hold this position for a few seconds.'),(34,'Leaning Calf Stretch','Stand at one side of a wall then place one foot behind your body and press the heel to floor. Hold this position for a few seconds.'),(35,'Kneeling Hip Flexor Stretch','Step into a deep lunge, with back leg extended, and then lower your back leg until your knee touches the floor. Then push your hips forward and shoulders back. Hold this position for a few seconds.'),(36,'Kneeling Quad Stretch','Kneel on one knee and grab the foot of the opposite back leg. Then gently pull it toward glutes. Hold this position for a few seconds.'),(37,'Pigeon Pose','Get into a plank position and bring the knee forward and place it behind your wrist, extend other leg straight back. Hold this position for a few seconds.'),(38,'Hamstring Scoops','Stand with one foot forward, heel on the ground and toes up. Bend at the hips and \"scoop\" your hands toward the floor as you stretch the hamstring of the extended leg. Stand up and switch legs, repeating the motion.'),(39,'The Karaoke Crossover','Stand with your feet shoulder-width apart. Step with one leg in front of the other and then step the trailing leg behind as you shuffle sideways. Keep rotating legs in a fluid motion as you move laterally.'),(40,'High Knees','Stand tall and alternate driving your knees up toward your chest, aiming for hip height or higher. Keep a fast pace and engage your core. Pump your arms as you lift your knees.'),(41,'Butt Kicks','Stand and jog in place, bringing your heels up toward your glutes with each step. Keep your torso upright and swing your arms naturally as you kick your heels up.'),(42,'Gate Hip Opener','Stand on one leg and lift the other knee up to hip height. Rotate the knee outward, then return to the starting position. Repeat on the other leg to \"open the gate.\"'),(43,'Jumping Jacks','Stand with feet together and arms at your sides. Jump while spreading your feet apart and raising your arms overhead. Jump again to return to the starting position, and repeat at a steady pace and good form.'),(44,'Cobra Stretch','Lie face down with palms on the floor underneath the shoulders. Push your upper body upwards, arching your back while the hips are touching the ground. Hold this position for a few seconds.'),(45,'Cat-Cow Stretch','Get into a tabletop position and slowly alternate between arching your back (cow pose) and rounding your spine (cat pose). Focus on the stretch in your abs and lower back, holding each position for a few seconds.');
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activityStatistics`
--

DROP TABLE IF EXISTS `activityStatistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activityStatistics` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `activityID` smallint unsigned NOT NULL,
  `personID` smallint unsigned NOT NULL,
  `sets` int unsigned NOT NULL,
  `reps` int unsigned NOT NULL,
  `duration` decimal(5,2) NOT NULL,
  `started` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ended` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `activityID` (`activityID`),
  KEY `personID` (`personID`),
  CONSTRAINT `activityStatistics_ibfk_1` FOREIGN KEY (`activityID`) REFERENCES `activity` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `activityStatistics_ibfk_2` FOREIGN KEY (`personID`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activityStatistics`
--

LOCK TABLES `activityStatistics` WRITE;
/*!40000 ALTER TABLE `activityStatistics` DISABLE KEYS */;
INSERT INTO `activityStatistics` VALUES (1,24,2,2,1,0.50,'2024-10-01 07:34:59','2024-10-01 07:35:29'),(2,25,2,1,2,0.25,'2024-10-01 07:36:11','2024-10-01 07:37:26'),(3,28,2,2,30,0.50,'2024-10-01 07:37:40','2024-10-01 07:38:10'),(4,39,2,1,10,0.25,'2024-10-01 07:37:40','2024-10-01 07:38:10'),(5,1,2,4,8,14.00,'2024-10-01 07:42:12','2024-10-01 07:56:12'),(6,3,2,4,25,15.00,'2024-10-01 08:12:15','2024-10-01 08:27:15'),(7,43,1,3,40,1.00,'2024-10-01 14:33:19','2024-10-01 14:34:19'),(8,23,1,8,80,30.00,'2024-10-01 14:33:19','2024-10-01 14:34:19'),(9,41,3,2,20,3.00,'2024-10-02 05:40:35','2024-10-02 05:43:35'),(10,39,3,2,20,2.00,'2024-10-02 05:44:20','2024-10-02 05:47:20'),(11,15,3,4,8,13.00,'2024-10-02 05:55:03','2024-10-02 06:08:03'),(12,16,3,4,12,15.00,'2024-10-02 06:11:34','2024-10-02 06:26:34');
/*!40000 ALTER TABLE `activityStatistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise`
--

DROP TABLE IF EXISTS `exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercise` (
  `activityID` smallint unsigned NOT NULL,
  `category` enum('Strength','Cardio') NOT NULL,
  `target` enum('Chest','Shoulder','Tricep','Bicep','Back','Glute','Hamstring','Calf','Legs','Abs') DEFAULT NULL,
  PRIMARY KEY (`activityID`),
  CONSTRAINT `exercise_ibfk_1` FOREIGN KEY (`activityID`) REFERENCES `activity` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise`
--

LOCK TABLES `exercise` WRITE;
/*!40000 ALTER TABLE `exercise` DISABLE KEYS */;
INSERT INTO `exercise` VALUES (1,'Strength','Chest'),(2,'Strength','Chest'),(3,'Strength','Chest'),(4,'Strength','Chest'),(5,'Strength','Shoulder'),(6,'Strength','Shoulder'),(7,'Strength','Tricep'),(8,'Strength','Tricep'),(9,'Strength','Bicep'),(10,'Strength','Bicep'),(11,'Strength','Back'),(12,'Strength','Back'),(13,'Strength','Back'),(14,'Strength','Back'),(15,'Strength','Glute'),(16,'Strength','Glute'),(17,'Strength','Glute'),(18,'Strength','Hamstring'),(19,'Strength','Hamstring'),(20,'Strength','Calf'),(21,'Cardio','Legs'),(22,'Cardio','Legs'),(23,'Cardio','Abs');
/*!40000 ALTER TABLE `exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exerciseTips`
--

DROP TABLE IF EXISTS `exerciseTips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exerciseTips` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `exerciseID` smallint unsigned NOT NULL,
  `tip` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exerciseID` (`exerciseID`),
  CONSTRAINT `exerciseTips_ibfk_1` FOREIGN KEY (`exerciseID`) REFERENCES `exercise` (`activityID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exerciseTips`
--

LOCK TABLES `exerciseTips` WRITE;
/*!40000 ALTER TABLE `exerciseTips` DISABLE KEYS */;
INSERT INTO `exerciseTips` VALUES (1,1,'Slightly arch your body so the weight load is on your chest rather than the shoulders.'),(2,1,'It should be a count of three until you lower the weight from full arm extension to chest contact to have more time under tension.'),(3,1,'Use a wider than shoulder-width grip if your using a barbell so then you get more stretch in your chest.'),(4,2,'Try using lighter weight to protect your joints from injury.'),(5,2,'Place your hands in center of the plate to target the inner chest while placing hands on the outside of plate targets the outer chest.'),(6,3,'Angling the direction of the movement can target different chest areas: low-to-high targets upper and high-to-low targets lower.'),(7,3,'Grip handles to where palms face each other to reduce shoulder strain.'),(8,4,'Slighty bend elbows to protect joints.'),(9,4,'Stop the movement if there is strain in the shoulders, this could indicate overextending and should be a comfortable performance.'),(10,5,'Do not overlean, but still slight enough to make more space for range of motion.'),(11,5,'Do not lift the dumbbells to high as you are more prone to injury, target being parallel to the floor.'),(12,6,'If you want to protect your spine, limit the amount of times you perform this workout per week because this workout primarily can target your shoulers, but can simultaneously degrade your whole body.'),(13,6,'Slighly move your head and torso forward while you engage your glutes and core to lift heavier.'),(14,7,'Keep your elbows pointed straight and still, additionally ensure you forearms are the only body part moving.'),(15,8,'There are different attachments like straight bar, rope, or the V-bar attachment that targets different types of the tricep.'),(16,8,'If a bar is used, grip it with both hands shoulder-width apart. If a rope is used, grip each end with a neutral grip (palms facing each other) for better engagement.'),(17,9,'If possible, use a mirror to ensure there is correct form and arm alignment.'),(18,9,'You should not be bouncing your upper body throughtout each curl: slow, stiff, and steady.'),(19,10,'Activate your forearms and biceps at the same time to get more performance improvements and muscle growth.'),(20,11,'Overhand, underhand, and neutral grips can provide different emphasis on your back and biceps.'),(21,12,'If your new to lifting, start with lighter weights to focus on form as it is more important than just going off the hook.'),(22,13,'Before you perform, ensure your cable is at eye level to effectively target upper back and rear delts.'),(23,13,'Keep your elbows high and manuever them outward for correct performance.'),(24,14,'Before you perform, ensure the cable is at lower chest level to target mid back.'),(25,15,'Grip placement is important: shoulder-width targets lats, wide grip targets outer lats, and narrower grip for biceps and upper back.'),(26,15,'Before pulling yourself up, retract your lats downward to improve shoulder stability.'),(27,16,'When you are performing, make sure you legs are 90 degrees or you can go even lower to build your glutes more.'),(28,16,'Push your knees out to avoid letting them cave in, which is considered bad form.'),(29,17,'If you want to target the glutes and hamstrings place feet higher on platform and focusing on the quads requires lower foot placement.'),(30,18,'The bar should be placed near the shins before the actual performance occurs to protect the lower back when lifting upward.'),(31,18,'When lifting heavy, use a mixed grip which is where your hands are placed one overhand, one underhand to reduce the bar slipping from hands.'),(32,19,'Many people make the mistake of lowering the their back knee on the floor during the repition, although it should almost touch.'),(33,20,'Toes can be pointed in straight, outward, or inward directions to target different calf muscles.'),(34,20,'Use a step or platform to provide more range of motion.'),(35,21,'Many people forget to drink water before or throughout their ride, this can cause performance issues so avoid that.'),(36,21,'Before you bike, ensure your knee is slightly bent at bottom of each pedal stroke ensuring comfortabilty.'),(37,22,'Set small milestones to keep you motivated and on track to continue using this exercise.'),(38,22,'Your body must be provided essential carbs, protein, and healthy fats after the workout to ensure effective recovery.'),(39,23,'A strong core helps you maintain proper form and balance while swimming.'),(40,23,'Use a snorkel if you want to focus on stroke efficiency wouthout the need to focus on turning the head to breath.'),(41,23,'Incorporate tools like kickboards, pull buoys, or paddles to target specific areas of your swimming technique and build strength.');
/*!40000 ALTER TABLE `exerciseTips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(12) NOT NULL,
  `lastName` varchar(12) NOT NULL,
  `username` varchar(18) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Rodger','Evans','captainevans','sh3ildavenger!99','rodgerevans@gmail.com','2024-09-28 11:11:39'),(2,'Daxton','Knight','daxtonlifts','braveKnight6!','daxtonevans@gmail.com','2024-09-28 15:38:28'),(3,'Brandon','Brandt','whoisbrandon','fearlessRanger5!!','brandonbrandt@gmail.com','2024-09-29 08:34:58'),(4,'Caden','Knight','testusername','testpassword','caden.knight@umontana.edu','2024-10-30 04:32:28'),(5,'Test','XSS','testing','xssattack','<script>alert(Fail?)</script>','2024-10-30 19:36:33');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personStatistics`
--

DROP TABLE IF EXISTS `personStatistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personStatistics` (
  `personID` smallint unsigned NOT NULL,
  `gender` varchar(6) NOT NULL,
  `age` smallint unsigned NOT NULL,
  `heightFeet` smallint unsigned NOT NULL,
  `heightInches` smallint unsigned NOT NULL,
  `weight` smallint unsigned NOT NULL,
  `BMI` decimal(3,1) NOT NULL,
  `intensityLevel` enum('Light','Moderate','Heavy') NOT NULL,
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`personID`),
  CONSTRAINT `personStatistics_ibfk_1` FOREIGN KEY (`personID`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personStatistics`
--

LOCK TABLES `personStatistics` WRITE;
/*!40000 ALTER TABLE `personStatistics` DISABLE KEYS */;
INSERT INTO `personStatistics` VALUES (1,'Male',25,5,9,172,21.5,'Moderate','2024-09-28 11:11:39'),(2,'Male',22,5,10,185,22.1,'Moderate','2024-09-28 15:38:28'),(3,'Male',24,5,7,176,22.2,'Heavy','2024-09-29 08:34:58');
/*!40000 ALTER TABLE `personStatistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stretch`
--

DROP TABLE IF EXISTS `stretch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stretch` (
  `activityID` smallint unsigned NOT NULL,
  `category` enum('Static','Dynamic') NOT NULL,
  `target` enum('Chest','Shoulder','Tricep','Neck','Back','Glute','Hamstring','Calf','Quadricep','Abs','Legs') DEFAULT NULL,
  PRIMARY KEY (`activityID`),
  CONSTRAINT `stretch_ibfk_1` FOREIGN KEY (`activityID`) REFERENCES `activity` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stretch`
--

LOCK TABLES `stretch` WRITE;
/*!40000 ALTER TABLE `stretch` DISABLE KEYS */;
INSERT INTO `stretch` VALUES (24,'Static','Chest'),(25,'Static','Shoulder'),(26,'Static','Tricep'),(27,'Static','Hamstring'),(28,'Dynamic','Shoulder'),(29,'Static','Back'),(30,'Dynamic','Neck'),(31,'Static','Quadricep'),(32,'Static','Hamstring'),(33,'Static','Glute'),(34,'Static','Calf'),(35,'Static','Quadricep'),(36,'Static','Glute'),(37,'Static','Hamstring'),(38,'Dynamic','Glute'),(39,'Dynamic','Glute'),(40,'Dynamic','Quadricep'),(41,'Dynamic','Hamstring'),(42,'Dynamic','Glute'),(43,'Dynamic','Legs'),(44,'Static','Abs'),(45,'Static','Abs');
/*!40000 ALTER TABLE `stretch` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-30 20:53:04
