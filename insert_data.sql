-- =====================================================
--  SAMPLE DATASET
-- SOCIAL MEDIA APPLICATION
-- =====================================================

USE SocialMediaDB;

-- =====================================================
-- USERS 
-- =====================================================

INSERT INTO User
(username,email,password,phone_no,dob,bio,join_date)
VALUES
('arpita','[arpita@gmail.com](mailto:arpita@gmail.com)','pass123','9876543210','2004-05-12','Tech Enthusiast','2024-01-05'),
('rahul','[rahul@gmail.com](mailto:rahul@gmail.com)','pass123','9876543211','2003-08-14','Football Lover','2024-01-06'),
('priya','[priya@gmail.com](mailto:priya@gmail.com)','pass123','9876543212','2004-02-18','Content Creator','2024-01-08'),
('aman','[aman@gmail.com](mailto:aman@gmail.com)','pass123','9876543213','2003-11-25','Software Developer','2024-01-10'),
('sneha','[sneha@gmail.com](mailto:sneha@gmail.com)','pass123','9876543214','2004-03-15','Traveler','2024-01-15'),
('rohit','[rohit@gmail.com](mailto:rohit@gmail.com)','pass123','9876543215','2002-09-10','Gamer','2024-01-20'),
('kavya','[kavya@gmail.com](mailto:kavya@gmail.com)','pass123','9876543216','2004-06-30','Photographer','2024-01-22'),
('vikas','[vikas@gmail.com](mailto:vikas@gmail.com)','pass123','9876543217','2003-07-11','Fitness Freak','2024-01-25'),
('neha','[neha@gmail.com](mailto:neha@gmail.com)','pass123','9876543218','2004-01-20','Student','2024-01-28'),
('aditya','[aditya@gmail.com](mailto:aditya@gmail.com)','pass123','9876543219','2003-04-09','Music Lover','2024-02-01'),
('ananya','[ananya@gmail.com](mailto:ananya@gmail.com)','pass123','9876543220','2004-07-12','Book Reader','2024-02-02'),
('yash','[yash@gmail.com](mailto:yash@gmail.com)','pass123','9876543221','2003-10-04','Cricket Fan','2024-02-03'),
('simran','[simran@gmail.com](mailto:simran@gmail.com)','pass123','9876543222','2004-09-08','Artist','2024-02-05'),
('karan','[karan@gmail.com](mailto:karan@gmail.com)','pass123','9876543223','2003-12-17','Entrepreneur','2024-02-06'),
('pooja','[pooja@gmail.com](mailto:pooja@gmail.com)','pass123','9876543224','2004-06-22','Food Blogger','2024-02-08'),
('rishi','[rishi@gmail.com](mailto:rishi@gmail.com)','pass123','9876543225','2003-03-18','Tech Geek','2024-02-10'),
('meera','[meera@gmail.com](mailto:meera@gmail.com)','pass123','9876543226','2004-04-14','Designer','2024-02-12'),
('arjun','[arjun@gmail.com](mailto:arjun@gmail.com)','pass123','9876543227','2003-05-05','Runner','2024-02-15'),
('nidhi','[nidhi@gmail.com](mailto:nidhi@gmail.com)','pass123','9876543228','2004-11-21','Nature Lover','2024-02-18'),
('dev','[dev@gmail.com](mailto:dev@gmail.com)','pass123','9876543229','2003-01-09','AI Enthusiast','2024-02-20');

-- =====================================================
-- HASHTAGS (15)
-- =====================================================

INSERT INTO Hashtag(tag_name)
VALUES
('#DBMS'),
('#SQL'),
('#Coding'),
('#Java'),
('#Technology'),
('#Travel'),
('#Fitness'),
('#Photography'),
('#Gaming'),
('#Music'),
('#AI'),
('#Food'),
('#CollegeLife'),
('#Startup'),
('#WebDevelopment');

-- =====================================================
-- GROUPS (8)
-- =====================================================

INSERT INTO User_Group(group_name,description)
VALUES
('DBMS Learners','Database discussions'),
('Java Developers','Java programming'),
('Travel Community','Travel stories'),
('Photography Club','Photography sharing'),
('Gaming Zone','Gaming discussions'),
('Fitness Hub','Workout enthusiasts'),
('Music Lovers','Music sharing'),
('Startup Network','Business ideas');

-- =====================================================
-- POSTS (30)
-- =====================================================

INSERT INTO Post(user_id,content,visibility)
VALUES
(1,'Working on DBMS capstone project','Public'),
(2,'Football finals tonight','Public'),
(3,'Uploaded a new vlog today','Public'),
(4,'Learning advanced Java concepts','Friends'),
(5,'Trip to Manali was amazing','Public'),
(6,'Reached level 100 in my game','Public'),
(7,'Captured sunset at beach','Public'),
(8,'Completed morning workout','Public'),
(9,'Preparing for end semester exams','Friends'),
(10,'Listening to old songs','Public'),
(11,'Finished reading a great novel','Public'),
(12,'India won the cricket match','Public'),
(13,'New digital artwork completed','Public'),
(14,'Launching my startup soon','Public'),
(15,'Reviewing best street food','Public'),
(16,'Building a web application','Public'),
(17,'Created a new UI design','Public'),
(18,'10 km run completed today','Public'),
(19,'Nature photography session','Public'),
(20,'Exploring artificial intelligence','Public'),
(1,'Normalization is interesting','Public'),
(4,'Java collections framework','Friends'),
(8,'Fitness challenge day 20','Public'),
(5,'Travel memories from Shimla','Public'),
(15,'Best cafe in Lucknow','Public'),
(20,'Machine learning basics','Public'),
(3,'Editing videos all day','Public'),
(7,'Golden hour photography','Public'),
(10,'Favorite playlist updated','Public'),
(12,'Cricket practice session','Public');

-- =====================================================
-- COMMENTS (50)
-- =====================================================

INSERT INTO Comment(user_id,post_id,comment_text)
VALUES
(2,1,'Great project'),
(3,1,'Best of luck'),
(4,1,'Looks interesting'),
(5,2,'Excited for match'),
(6,2,'Who will win?'),
(7,3,'Nice content'),
(8,3,'Keep posting'),
(9,4,'Java is fun'),
(10,4,'Helpful post'),
(11,5,'Beautiful place'),
(12,5,'Want to visit'),
(13,6,'Awesome achievement'),
(14,6,'Congratulations'),
(15,7,'Amazing shot'),
(16,7,'Nice click'),
(17,8,'Stay consistent'),
(18,8,'Good job'),
(19,9,'All the best'),
(20,9,'Study hard'),
(1,10,'Nice songs'),
(2,11,'Interesting book'),
(3,12,'Great match'),
(4,13,'Wonderful art'),
(5,14,'Good luck'),
(6,15,'Looks delicious'),
(7,16,'Nice project'),
(8,17,'Beautiful design'),
(9,18,'Impressive run'),
(10,19,'Lovely nature'),
(11,20,'AI is future'),
(12,21,'Very useful'),
(13,22,'Collections are powerful'),
(14,23,'Keep it up'),
(15,24,'Shimla is beautiful'),
(16,25,'Must visit'),
(17,26,'Great topic'),
(18,27,'Nice editing'),
(19,28,'Excellent picture'),
(20,29,'Love this playlist'),
(1,30,'Practice makes perfect'),
(2,5,'Looks fantastic'),
(3,5,'Amazing view'),
(4,7,'Professional shot'),
(5,1,'Helpful content'),
(6,20,'Interesting field'),
(7,21,'Good explanation'),
(8,23,'Stay fit'),
(9,26,'AI rocks'),
(10,28,'Outstanding'),
(11,29,'Nice choice');
