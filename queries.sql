-- =====================================================
-- PHASE 4 : SQL QUERIES
-- SOCIAL MEDIA APPLICATION
-- =====================================================

USE SocialMediaDB;

-- =====================================================
-- BASIC QUERIES
-- =====================================================


SELECT * FROM User;

SELECT * FROM Post;

SELECT username,email
FROM User;

SELECT content,visibility
FROM Post;

-- =====================================================
-- WHERE CLAUSE
-- =====================================================

SELECT *
FROM User
WHERE username='arpita';

SELECT *
FROM Post
WHERE visibility='Public';

SELECT *
FROM User
WHERE join_date > '2024-02-01';

SELECT *
FROM Post
WHERE user_id=1;

-- =====================================================
-- ORDER BY
-- =====================================================

SELECT *
FROM User
ORDER BY username ASC;

SELECT *
FROM User
ORDER BY join_date DESC;

SELECT *
FROM Post
ORDER BY created_at DESC;

-- =====================================================
-- AGGREGATE FUNCTIONS
-- =====================================================

SELECT COUNT(*) AS TotalUsers
FROM User;

SELECT COUNT(*) AS TotalPosts
FROM Post;

SELECT COUNT(*) AS TotalComments
FROM Comment;

SELECT COUNT(*) AS TotalLikes
FROM Likes;

-- =====================================================
-- GROUP BY
-- =====================================================

SELECT user_id,
COUNT(*) AS TotalPosts
FROM Post
GROUP BY user_id;

SELECT post_id,
COUNT(*) AS TotalComments
FROM Comment
GROUP BY post_id;

SELECT post_id,
COUNT(*) AS TotalLikes
FROM Likes
GROUP BY post_id;

-- =====================================================
-- HAVING
-- =====================================================

SELECT user_id,
COUNT(*) AS TotalPosts
FROM Post
GROUP BY user_id
HAVING COUNT(*) > 1;

SELECT post_id,
COUNT(*) AS TotalLikes
FROM Likes
GROUP BY post_id
HAVING COUNT(*) >= 3;

-- =====================================================
-- INNER JOINS
-- =====================================================

SELECT U.username,
P.content
FROM User U
INNER JOIN Post P
ON U.user_id=P.user_id;

SELECT U.username,
C.comment_text
FROM User U
INNER JOIN Comment C
ON U.user_id=C.user_id;

SELECT P.post_id,
C.comment_text
FROM Post P
INNER JOIN Comment C
ON P.post_id=C.post_id;

SELECT U.username,
P.content,
C.comment_text
FROM User U
JOIN Post P
ON U.user_id=P.user_id
JOIN Comment C
ON P.post_id=C.post_id;

-- =====================================================
-- LEFT JOIN
-- =====================================================

SELECT U.username,
P.content
FROM User U
LEFT JOIN Post P
ON U.user_id=P.user_id;

-- =====================================================
-- MULTI TABLE JOIN
-- =====================================================

SELECT U.username,
G.group_name
FROM User U
JOIN Group_Membership GM
ON U.user_id=GM.user_id
JOIN User_Group G
ON GM.group_id=G.group_id;

SELECT U.username,
P.content
FROM User U
JOIN Likes L
ON U.user_id=L.user_id
JOIN Post P
ON P.post_id=L.post_id;

-- =====================================================
-- UPDATE OPERATIONS
-- =====================================================

UPDATE User
SET bio='Database Enthusiast'
WHERE user_id=1;

UPDATE Post
SET visibility='Friends'
WHERE post_id=5;

UPDATE User_Group
SET description='Advanced Java Programming Community'
WHERE group_id=2;

UPDATE Hashtag
SET tag_name='#AdvancedSQL'
WHERE hashtag_id=2;
-- =====================================================
-- ALTER OPERATIONS
-- =====================================================

-- Add new column

ALTER TABLE User
ADD gender VARCHAR(10);

-- Modify column datatype

ALTER TABLE User
MODIFY phone_no VARCHAR(20);

-- Rename column

ALTER TABLE User
RENAME COLUMN gender TO user_gender;

-- Drop column

ALTER TABLE User
DROP COLUMN user_gender;

-- =====================================================
-- NESTED QUERIES
-- =====================================================

SELECT username
FROM User
WHERE user_id IN
(
SELECT user_id
FROM Post
);

SELECT content
FROM Post
WHERE post_id IN
(
SELECT post_id
FROM Likes
WHERE user_id=1
);

SELECT username
FROM User
WHERE user_id IN
(
SELECT followee_id
FROM Follows
WHERE follower_id=1
);


-- =====================================================
-- CORRELATED SUBQUERY
-- =====================================================

SELECT U.username
FROM User U
WHERE
(
SELECT COUNT(*)
FROM Post P
WHERE P.user_id=U.user_id
) > 1;

-- =====================================================
-- DELETE OPERATIONS
-- =====================================================

DELETE FROM Likes
WHERE user_id=2
AND post_id=1;

DELETE FROM Comment
WHERE comment_id=5;

DELETE FROM Message
WHERE message_id=10;

DELETE FROM Group_Membership
WHERE user_id=10
AND group_id=5;

-- =====================================================
-- TOP POSTS BY LIKES
-- =====================================================

SELECT post_id,
COUNT(*) AS LikeCount
FROM Likes
GROUP BY post_id
ORDER BY LikeCount DESC;

-- =====================================================
-- FOLLOWER COUNT
-- =====================================================

SELECT followee_id,
COUNT(*) AS Followers
FROM Follows
GROUP BY followee_id
ORDER BY Followers DESC;

-- =====================================================
-- VIEW
-- =====================================================

CREATE VIEW UserPostsView AS
SELECT
U.user_id,
U.username,
P.post_id,
P.content
FROM User U
JOIN Post P
ON U.user_id=P.user_id;

SELECT *
FROM UserPostsView;

-- =====================================================
-- SECOND VIEW
-- =====================================================

CREATE VIEW PostLikesView AS
SELECT
P.post_id,
P.content,
COUNT(L.user_id) AS TotalLikes
FROM Post P
LEFT JOIN Likes L
ON P.post_id=L.post_id
GROUP BY P.post_id,P.content;

SELECT *
FROM PostLikesView;

-- =====================================================
-- INDEXES
-- =====================================================

CREATE INDEX idx_username
ON User(username);

CREATE INDEX idx_email
ON User(email);

CREATE INDEX idx_post_user
ON Post(user_id);

CREATE INDEX idx_comment_post
ON Comment(post_id);

CREATE INDEX idx_followee
ON Follows(followee_id);

CREATE INDEX idx_hashtag
ON Hashtag(tag_name);


-- =====================================================
-- ADVANCED QUERY
-- =====================================================

SELECT U.username,
COUNT(P.post_id) AS TotalPosts
FROM User U
LEFT JOIN Post P
ON U.user_id=P.user_id
GROUP BY U.user_id
ORDER BY TotalPosts DESC;

SELECT G.group_name,
COUNT(GM.user_id) AS Members
FROM User_Group G
LEFT JOIN Group_Membership GM
ON G.group_id=GM.group_id
GROUP BY G.group_id;

SELECT H.tag_name,
COUNT(PH.post_id) AS UsageCount
FROM Hashtag H
LEFT JOIN Post_Hashtag PH
ON H.hashtag_id=PH.hashtag_id
GROUP BY H.hashtag_id
ORDER BY UsageCount DESC;

SELECT username
FROM User
WHERE user_id NOT IN
(
SELECT DISTINCT user_id
FROM Post
);

SELECT content
FROM Post
WHERE post_id =
(
SELECT post_id
FROM Likes
GROUP BY post_id
ORDER BY COUNT(*) DESC
LIMIT 1
);
