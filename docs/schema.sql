-- DROP DATABASE IF EXISTS fooddb;
CREATE DATABASE fooddb;
USE fooddb;

SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE IF NOT EXISTS user(
`id` INTEGER AUTO_INCREMENT NOT NULL,
`username` varchar(255) NOT NULL,
`password` varchar(255) NOT NULL,
PRIMARY KEY (id),
`createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS recipe (
    `recipe_id` INTEGER AUTO_INCREMENT PRIMARY KEY,
    `frequency` ENUM('danger','primary','secondary') DEFAULT 'primary', /* using bootstrap class as priority colouring */
    `title` VARCHAR(255) NOT NULL,
    `user_id` INTEGER NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `sourceUrl` VARCHAR(255) NOT NULL DEFAULT "https://rapidapi.com/webknox/api/recipe/endpoints",
    `imageUrl` VARCHAR(255) NOT NULL DEFAULT "https://spoonacular.com/application/frontend/images/food-api/spoonacular-recipe-card-widget.jpg",
    CONSTRAINT FOREIGN KEY (user_id) REFERENCES user(id),
    `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)
