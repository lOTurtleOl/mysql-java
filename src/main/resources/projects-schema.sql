DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS project;

CREATE TABLE project (
	project_id INT NOT NULL AUTO_INCREMENT,
	project_name VARCHAR(128) NOT NULL,
	estimated_hours DECIMAL(7,2),
	actual_hours DECIMAL(7,2),
	difficulty INT,
	notes TEXT,
	PRIMARY KEY (project_id) 
);

CREATE TABLE category (
	category_id INT NOT NULL AUTO_INCREMENT,
	category_name VARCHAR(128) NOT NULL,
	PRIMARY KEY (category_id)
);

CREATE TABLE step (
	step_id INT NOT NULL AUTO_INCREMENT,
	project_id INT NOT NULL,
	step_text TEXT NOT NULL,
	step_order INT NOT NULL,
	PRIMARY KEY (step_id),
	FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE
);

CREATE TABLE material (
	material_id INT NOT NULL AUTO_INCREMENT,
	project_id INT NOT NULL,
	material_name VARCHAR(128) NOT NULL,
	num_required INT,
	cost DECIMAL(7,2),
	PRIMARY KEY (material_id),
	FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE
);

CREATE TABLE project_category (
	category_id INT NOT NULL,
	project_id INT NOT NULL,
	FOREIGN KEY (category_id) REFERENCES category(category_id) ON DELETE CASCADE,
	FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE
);

INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES('Hang a door', 4, 5, 3, 'Need to hang like barn door');
INSERT INTO material (project_id, materal_name, num_required, cost) VALUES(1, 'Door hangers', 4, 35));
INSERT INTO material (project_id, materal_name, num_required, cost) VALUES(1, 'Screws', 20, 4);
INSERT INTO step (project_id, step_text, step_order) VALUES(1, 'Align hangers on opening side of door', 1);
INSERT INTO step (project_id, step_text, step_order) VALUES(1, 'Screw hangers into frame', 2);
INSERT INTO category (category_id, category_name) VALUES(1, 'Doors and Windows');
INSERT INTO category (category_id, category_name) VALUES(2, 'Repairs');
INSERT INTO category (category_id, category_name) VALUES(3, 'Gardening');
INSERT INTO project_category (project_id, category_id) VALUES(1, 1);
INSERT INTO project_category (project_id, category_id) VALUES(1, 2);