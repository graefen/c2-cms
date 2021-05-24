-- Users
CREATE TABLE users (
    user_id SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_name CHAR(30) NOT NULL UNIQUE,
    user_password VARCHAR(1024) NOT NULL
);
CREATE INDEX user_name_idx ON users (user_name);
INSERT INTO users (user_name, user_password) VALUES ('admin', '21232f297a57a5a743894a0e4a801fc3');

-- Categories
CREATE TABLE categories (
    category_id MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    category_slug CHAR(64) NOT NULL UNIQUE,
    category_title VARCHAR(256) NOT NULL
);
CREATE INDEX category_slug_idx ON categories (category_slug);

-- Articles
CREATE TABLE articles (
    article_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    article_slug CHAR(128) NOT NULL UNIQUE,
    article_category_id MEDIUMINT NOT NULL,
    article_markdown VARCHAR(64512),
    article_html VARCHAR(64512),
    article_title VARCHAR(2048),
    article_is_published BOOLEAN NOT NULL DEFAULT 0,
    article_created TIMESTAMP NOT NULL,
    article_modified TIMESTAMP NOT NULL,
    FOREIGN KEY (article_category_id)
        REFERENCES categories(category_id)
        ON DELETE RESTRICT
);
CREATE INDEX article_slug_idx ON articles (article_slug);
CREATE INDEX article_pub_idx ON articles (article_is_published, article_modified);
