



CREATE TABLE IF NOT EXISTS users(
   username varchar(20) NOT NULL,
   password varchar(20) NOT NULL,
   enabled boolean NOT NULL DEFAULT FALSE,
   primary key(username)
);

CREATE TABLE IF NOT EXISTS user_roles (
  user_role_id SERIAL PRIMARY KEY,
  username varchar(20) NOT NULL,
  role varchar(20) NOT NULL,
  UNIQUE (username,role),
  FOREIGN KEY (username) REFERENCES users (username)
);

SET FOREIGN_KEY_CHECKS = 0; -- Disable foreign key checking.
TRUNCATE TABLE users;
TRUNCATE TABLE user_roles;
SET FOREIGN_KEY_CHECKS = 1; -- Enable foreign key checking.

INSERT INTO users(username,password,enabled) VALUES ('dong','dong', true);
INSERT INTO users(username,password,enabled) VALUES ('off','off', true);

INSERT INTO user_roles (username, role) VALUES ('dong', 'ROLE_USER');
INSERT INTO user_roles (username, role) VALUES ('dong', 'ROLE_ADMIN');
INSERT INTO user_roles (username, role) VALUES ('off', 'ROLE_USER');