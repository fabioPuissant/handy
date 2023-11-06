CREATE SCHEMA handy;

-- User Table
CREATE TABLE IF NOT EXISTS handy.users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    password_salt VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL,
    contact_info TEXT,
    registration_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    last_login_date TIMESTAMP WITH TIME ZONE,
    user_status VARCHAR(50)
);

-- Categories Table
CREATE TABLE IF NOT EXISTS handy.categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

-- Job Posts Table
CREATE TABLE IF NOT EXISTS handy.job_posts (
    job_id SERIAL PRIMARY KEY,
    posted_by_user_id INT NOT NULL,
    category_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    post_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    start_date TIMESTAMP WITH TIME ZONE,
    end_date TIMESTAMP WITH TIME ZONE,
    status VARCHAR(50),
    location VARCHAR(255),
    estimated_budget DECIMAL(10, 2),
    actual_cost DECIMAL(10, 2),
    FOREIGN KEY (posted_by_user_id) REFERENCES handy.users (user_id),
    FOREIGN KEY (category_id) REFERENCES handy.categories (category_id)
);

-- Handyman Details Table
CREATE TABLE IF NOT EXISTS handy.handyman_details (
    handyman_detail_id SERIAL PRIMARY KEY,
    handyman_id INT NOT NULL,
    specialization TEXT,
    experience_years INT,
    certification_details TEXT,
    FOREIGN KEY (handyman_id) REFERENCES handy.users (user_id)
);

-- Bids Table
CREATE TABLE IF NOT EXISTS handy.bids (
    bid_id SERIAL PRIMARY KEY,
    job_id INT NOT NULL,
    bid_by_user_id INT NOT NULL,
    bid_amount DECIMAL(10, 2),
    bid_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50),
    FOREIGN KEY (job_id) REFERENCES handy.job_posts (job_id),
    FOREIGN KEY (bid_by_user_id) REFERENCES handy.users (user_id)
);

-- Contracts Table
CREATE TABLE IF NOT EXISTS handy.contracts (
    contract_id SERIAL PRIMARY KEY,
    job_id INT NOT NULL,
    handyman_id INT NOT NULL,
    job_poster_id INT NOT NULL,
    agreed_price DECIMAL(10, 2),
    contract_terms TEXT,
    start_date TIMESTAMP WITH TIME ZONE,
    end_date TIMESTAMP WITH TIME ZONE,
    sign_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50),
    FOREIGN KEY (job_id) REFERENCES handy.job_posts (job_id),
    FOREIGN KEY (handyman_id) REFERENCES handy.users (user_id),
    FOREIGN KEY (job_poster_id) REFERENCES handy.users (user_id)
);

-- Reviews Table
CREATE TABLE IF NOT EXISTS handy.reviews (
    review_id SERIAL PRIMARY KEY,
    reviewed_by_user_id INT NOT NULL,
    reviewed_user_id INT NOT NULL,
    job_id INT NOT NULL,
    rating INT NOT NULL,
    comment TEXT,
    title VARCHAR(256),
    review_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (reviewed_by_user_id) REFERENCES handy.users (user_id),
    FOREIGN KEY (reviewed_user_id) REFERENCES handy.users (user_id),
    FOREIGN KEY (job_id) REFERENCES handy.job_posts (job_id)
);

-- Invoices Table
CREATE TABLE IF NOT EXISTS handy.invoices (
    invoice_id SERIAL PRIMARY KEY,
    contract_id INT NOT NULL,
    amount DECIMAL(10, 2),
    issue_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    due_date TIMESTAMP WITH TIME ZONE,
    status VARCHAR(50),
    FOREIGN KEY (contract_id) REFERENCES handy.contracts (contract_id)
);

-- Insert into users
INSERT INTO handy.users (username, email, password_hash, password_salt, role, contact_info, registration_date, last_login_date, user_status)
VALUES
('jobposter1', 'poster1@example.com', 'hash1', 'salt1', 'JOB_POSTER', 'contact1', current_timestamp, current_timestamp, 'active'),
('jobposter2', 'poster2@example.com', 'hash2', 'salt2', 'JOB_POSTER', 'contact2', current_timestamp, current_timestamp, 'active'),
('jobposter3', 'poster3@example.com', 'hash3', 'salt3', 'JOB_POSTER', 'contact3', current_timestamp, current_timestamp, 'active'),
('handyman1', 'handyman1@example.com', 'hash1', 'salt1', 'HANDYMAN', 'contact1', current_timestamp, current_timestamp, 'active'),
('handyman2', 'handyman2@example.com', 'hash2', 'salt2', 'HANDYMAN', 'contact2', current_timestamp, current_timestamp, 'active'),
('handyman3', 'handyman3@example.com', 'hash3', 'salt3', 'HANDYMAN', 'contact3', current_timestamp, current_timestamp, 'active'),
('admin1', 'admin1@example.com', 'hash1', 'salt1', 'ADMIN', 'contact1', current_timestamp, current_timestamp, 'active'),
('admin2', 'admin2@example.com', 'hash2', 'salt2', 'ADMIN', 'contact2', current_timestamp, current_timestamp, 'active'),
('admin3', 'admin3@example.com', 'hash3', 'salt3', 'ADMIN', 'contact3', current_timestamp, current_timestamp, 'active');

-- Insert into categories
INSERT INTO handy.categories (name, description)
VALUES
('Plumbing', 'All tasks related to plumbing'),
('Electrical', 'Electrical repair and installation tasks'),
('Carpentry', 'Woodwork and carpentry tasks');

-- Assuming that users and categories have been inserted, and user IDs and category IDs are known
-- Insert into job_posts
INSERT INTO handy.job_posts (posted_by_user_id, category_id, title, description, post_date, start_date, end_date, status, location, estimated_budget, actual_cost)
VALUES
(1, 1, 'Fix leaky faucet', 'A leaky faucet in the bathroom', current_timestamp, current_timestamp, null, 'open', 'Brussels', 100.00, null),
(2, 2, 'Install new lights', 'Installation of ceiling lights in the living room', current_timestamp, current_timestamp, null, 'open', 'Antwerp', 200.00, null),
(3, 3, 'Build a new deck', 'Building a new wooden deck in the backyard', current_timestamp, current_timestamp, null, 'open', 'Ghent', 1500.00, null);

-- Insert into handyman_details (assuming the user IDs for handymen are known)
INSERT INTO handy.handyman_details (handyman_id, specialization, experience_years, certification_details)
VALUES
(4, 'General Plumbing', 5, 'Certified Plumber'),
(5, 'Household Electrical Systems', 10, 'Certified Electrician'),
(6, 'Residential Carpentry', 3, 'Certified Carpenter');

-- Insert into bids (assuming job post IDs are known)
INSERT INTO handy.bids (job_id, bid_by_user_id, bid_amount, bid_date, status)
VALUES
(1, 4, 90.00, current_timestamp, 'pending'),
(2, 5, 180.00, current_timestamp, 'pending'),
(3, 6, 1300.00, current_timestamp, 'pending');

-- Insert into contracts (assuming job post IDs and user IDs are known)
INSERT INTO handy.contracts (job_id, handyman_id, job_poster_id, agreed_price, contract_terms, start_date, end_date, sign_date, status)
VALUES
(1, 4, 1, 90.00, 'Contract terms here', current_timestamp, current_timestamp, current_timestamp, 'signed'),
(2, 5, 2, 180.00, 'Contract terms here', current_timestamp, current_timestamp, current_timestamp, 'signed'),
(3, 6, 3, 1300.00, 'Contract terms here', current_timestamp, current_timestamp, current_timestamp, 'signed');

-- Insert into reviews (assuming user IDs are known)
INSERT INTO handy.reviews (reviewed_by_user_id, reviewed_user_id, job_id, rating, title, comment, review_date)
VALUES
(1, 4, 1, 5, 'Good handyman', 'Great work!', current_timestamp),
(2, 5, 2, 4, 'My review', 'Very professional', current_timestamp),
(3, 6, 3, 5, 'My review title','Excellent craftsmanship!', current_timestamp);

-- Insert into invoices (assuming contract IDs are known)
INSERT INTO handy.invoices (contract_id, amount, issue_date, due_date, status)
VALUES
(1, 90.00, current_timestamp, current_timestamp + interval '30 days', 'issued'),
(2, 180.00, current_timestamp, current_timestamp + interval '30 days', 'issued'),
(3, 1300.00, current_timestamp, current_timestamp + interval '30 days', 'issued');

GRANT USAGE ON SCHEMA handy TO fabio;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA handy TO fabio;