-- Challange 1. We want to reward our 5 oldest users. 
-- Find the 5 oldest users.
select * from users
order by created_at limit 5;

-- Challange 2. Campaign in which investors have a query
-- Most popular day of a week of registration
select 
	count(*) as accounts,
    dayofweek(created_at) as registration_day
from users
group by registration_day
order by accounts desc limit 2;

-- Challange 3. E-mail campaign for inactive users
-- Find the users who have never posted a photo
select user_name as inactive_users, image_url from users
left join photos on photos.user_id = users.id
where image_url is null;

-- Challange 4. Photo with higest likes
-- Who won?
select 
	users.id,
    user_name,
	photos.id as photo_id,
	image_url,
    count(*) as total_likes
from photos
join likes on likes.photo_id = photos.id
join users on users.id = photos.user_id
group by photos.id
order by total_likes desc limit 1;

-- Challange 5. Investors want to know
-- How many times does the average user post?
select (select count(*) from photos)/(select count(*) from users) as avg_posts;

-- Challange 6. A brand wants to know which tag to use
-- Find top 5 used tags
select tag_name, count(*) as times_used from photo_tags
join tags on tags.id = photo_tags.tag_id
group by tag_name
order by times_used desc limit 5;

-- Challange 7.
-- Find users who have liked every single photos
select user_name, user_id, count(photo_id) as total_likes from likes
join users on users.id = likes.user_id
group by user_id
having total_likes = 257;
-- or
select username, Count(*) as total_likes from users 
join likes on users.id = likes.user_id 
group by likes.user_id 
having total_likes = (select count(*) from photos); 