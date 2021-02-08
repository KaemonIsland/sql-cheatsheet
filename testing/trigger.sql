DELIMITER $$

CREATE TRIGGER must_be_adult
	BEFORE INSERT ON people FOR EACH ROW
	BEGIN
			IF NEW.age < 18
			THEN
				SIGNAL SQLSTATE "45000"
					SET MESSAGE_TEXT = "Must be an adult!"
			END IF;
	END;

$$

DELIMITER ;

-- Logging Unfollows for the test code. Triggers after a user unfollows another

DELIMITER $$

CREATE TRIGGER capture_unfollow
	AFTER DELETE ON follows FOR EACH ROW
	BEGIN
		INSERT INTO unfollows
		SET
			follower_id = OLD.follower_id,
			followee_id = OLD.followee_id;
	END;

$$

DELIMITER;
