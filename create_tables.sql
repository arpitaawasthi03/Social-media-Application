-- =====================================================
-- SOCIAL MEDIA APPLICATION DATABASE
-- DBMS CAPSTONE PROJECT
-- =====================================================

CREATE DATABASE SocialMediaDB;

USE SocialMediaDB;

-- =====================================================
-- 1. USER TABLE
-- =====================================================

CREATE TABLE User (
user_id INT AUTO_INCREMENT,
username VARCHAR(50) NOT NULL UNIQUE,
email VARCHAR(100) NOT NULL UNIQUE,
password VARCHAR(255) NOT NULL,
phone_no VARCHAR(15) UNIQUE,
dob DATE,
bio TEXT,
join_date DATE DEFAULT (CURRENT_DATE),

```
PRIMARY KEY(user_id)
```

);

-- =====================================================
-- 2. POST TABLE
-- =====================================================

CREATE TABLE Post (
post_id INT AUTO_INCREMENT,
user_id INT NOT NULL,
  
content TEXT,
media_url VARCHAR(255),

visibility ENUM('Public','Private','Friends')
DEFAULT 'Public',

created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

PRIMARY KEY(post_id),

FOREIGN KEY(user_id)
REFERENCES User(user_id)
ON DELETE CASCADE


);

-- =====================================================
-- 3. COMMENT TABLE
-- =====================================================

CREATE TABLE Comment (
comment_id INT AUTO_INCREMENT,

user_id INT NOT NULL,
post_id INT NOT NULL,

comment_text TEXT NOT NULL,

created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

PRIMARY KEY(comment_id),

FOREIGN KEY(user_id)
REFERENCES User(user_id)
ON DELETE CASCADE,

FOREIGN KEY(post_id)
REFERENCES Post(post_id)
ON DELETE CASCADE

);

-- =====================================================
-- 4. MESSAGE TABLE
-- =====================================================

CREATE TABLE Message (
message_id INT AUTO_INCREMENT,


sender_id INT NOT NULL,
receiver_id INT NOT NULL,

message_text TEXT NOT NULL,

sent_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

PRIMARY KEY(message_id),

FOREIGN KEY(sender_id)
REFERENCES User(user_id)
ON DELETE CASCADE,

FOREIGN KEY(receiver_id)
REFERENCES User(user_id)
ON DELETE CASCADE


);

-- =====================================================
-- 5. HASHTAG TABLE
-- =====================================================

CREATE TABLE Hashtag (
hashtag_id INT AUTO_INCREMENT,


tag_name VARCHAR(50) UNIQUE NOT NULL,

PRIMARY KEY(hashtag_id)

);

-- =====================================================
-- 6. USER_GROUP TABLE
-- =====================================================

CREATE TABLE User_Group (
group_id INT AUTO_INCREMENT,


group_name VARCHAR(100) NOT NULL,

description TEXT,

created_on DATE DEFAULT (CURRENT_DATE),

PRIMARY KEY(group_id)


);

-- =====================================================
-- 7. LIKES TABLE
-- =====================================================

CREATE TABLE Likes (
user_id INT,
post_id INT,


liked_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

PRIMARY KEY(user_id, post_id),

FOREIGN KEY(user_id)
REFERENCES User(user_id)
ON DELETE CASCADE,

FOREIGN KEY(post_id)
REFERENCES Post(post_id)
ON DELETE CASCADE


);

-- =====================================================
-- 8. FOLLOWS TABLE
-- =====================================================

CREATE TABLE Follows (
follower_id INT,
followee_id INT,


follow_date DATE DEFAULT (CURRENT_DATE),

PRIMARY KEY(follower_id, followee_id),

FOREIGN KEY(follower_id)
REFERENCES User(user_id)
ON DELETE CASCADE,

FOREIGN KEY(followee_id)
REFERENCES User(user_id)
ON DELETE CASCADE,

CHECK (follower_id <> followee_id)


);

-- =====================================================
-- 9. GROUP_MEMBERSHIP TABLE
-- =====================================================

CREATE TABLE Group_Membership (
user_id INT,
group_id INT,


join_date DATE DEFAULT (CURRENT_DATE),

PRIMARY KEY(user_id, group_id),

FOREIGN KEY(user_id)
REFERENCES User(user_id)
ON DELETE CASCADE,

FOREIGN KEY(group_id)
REFERENCES User_Group(group_id)
ON DELETE CASCADE


);

-- =====================================================
-- 10. POST_HASHTAG TABLE
-- =====================================================

CREATE TABLE Post_Hashtag (
post_id INT,
hashtag_id INT,


PRIMARY KEY(post_id, hashtag_id),

FOREIGN KEY(post_id)
REFERENCES Post(post_id)
ON DELETE CASCADE,

FOREIGN KEY(hashtag_id)
REFERENCES Hashtag(hashtag_id)
ON DELETE CASCADE


);
