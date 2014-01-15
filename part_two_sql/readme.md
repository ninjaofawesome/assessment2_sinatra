The second part of this assessment will just be a theoretical "how I would do this" description, as per Blake's request.  Below I will type what I would do in SQL pro to meet the parameters of the assignment.
#################

****Create a database called wizards. The rest of the assesment all will take place in the wizards db.

	Step One: Open SQLPro.
	Step Two: type in the IP address in the Host field.  Type in the username and the host.  (IP address: 192.168.1.1 or 127.0.0.1 did not work for me for IP address, winging it from here.)

*****Create a table called wizards with the following columns (name, age).

	Step one: In the text field, type in (just like I have it here):
		CREATE TABLE wizards (
		name TEXT,
		age INTEGER
		);

	Step two: Run this command.  Table created.

****Write a statement to count the number of rows in the wizards table. How many wizards are there?

Currently there are no wizards in this table to count.  So, technically, this would work:
(Typed exactly as I have it)

SELECT * FROM wizards

However, once there are wizards in the database, you could try this?

SELECT count(‘name’)
FROM wizards


****Insert a wizard into the database.

Step One: type in (just as I have it):

INSERT INTO wizards (name, age)
VALUES ("Dad", 75)

Step two: Run this command.  My dad is now a wizard. 


***** Write a statement to count the number of rows in the wizards table. How many wizards are there now?

Step One: type in (just as I have it):

SELECT count(‘name’)
FROM wizards

Step Two: Run this command.  There should be one wizard displayed for the count.


*****Insert another wizard into the database.

Step One: Type in this, just as I have it:

INSERT INTO wizards (name, age)
VALUES ("Mom", 68)

Step Two: Run this command.  My mom is also now a wizard.

****Write a statement to change the second wizards age to 21.

Step One: Type in this, as I have it:

SELECT * FROM wizards
UPDATE age(21)


Step Two: Run this command.  My parents should be feeling like footloose and fancy free wizards at this point.

****Write a statement to change all wizards ages to 40.

Step One: Type in this, as I have it:

SELECT * FROM wizards
UPDATE age(40)

Step Two: Run this command.  My parents are now mature wizards.

****Write a statement to delete the last wizard.

Step one: Type this in, as I have it:

SELECT * FROM wizards
DESTROY last

Step two: Run this. This should delete the last entry?


****Write a statement to delete the wizards table.

Step One: Type this in, as I have it:

DROP TABLE wizards

Step Two: Run this command.  My parents have decided that the wizard life is not for them and the table is since dropped.

****Create two data models for wizards. The wizards are going to have a name, an age and two powers each. Let's pretend we're in a world where wizards have many powers, but powers belong to one wizard (two wizards cant have the same power) Each power is going to have a name and a damage amount. Write out the sql to create the two schemas and some sample records. What are the costs/benefits of the two approaches? If you only see one way of doing this that's ok. Please explain any potential problems with your approach. What questions can this schema answer easily? What questions can this schema not answer easily?

In SQLPro, I would write the first data model as this:

CREATE TABLE wizards (
	name TEXT,
	age INTEGER,
	power_1 TEXT,
	damage_1 INTEGER,
	power_2 TEXT,
	damage_2 INTEGER
);

Technically, the above statement contradicts itself, so I'm not really sure how best to handle this... unless the assumption is that over time the wizard will drop their current powers in order to gain new powers.  Or perhaps the wizard has a whole lot of powers that we don't actually know about.  If that's the case, I might reconsider two tables within a schema like this:

CREATE TABLE wizards (
	name TEXT,
	age INTEGER,
	wizard_id INTEGER
);

CREATE TABLE powers (
	power TEXT,
	damage INTEGER,
	power_id INTEGER,
	wizard_id INTEGER
);

Then I would join the wizards to whatever powers they wanted by the ID's of each.  Something like this:

SELECT *
FROM wizards
JOIN powers on powers.wizard_id = wizards.wizards_id

And hooray!  Wizards have many powers.

As for validating this, in rails I know the association would be something like this, but I can't think of how I would make that happen using SQL pro.  So I'll write it out rails style.

Class Wizards < ActiveRecord::Base
	has_many :powers
end

Class Powers <  ActiveRecord::Base
	has_one :wizard
	belongs_to :wizard
end




****Retrieve all the wizards with powers that have the letter "l" in them.

Retrieve all the wizards who have a combined damage of 10 or more.

Retrieve all the wizards sorted by their total damage. Your returned data should look like so.. wizard_name, total_damage.

Create a wizard that has no powers.

Retrieve all wizards that have no powers.

Create a data model for wizards for a world where wizards have many powers and multiple wizards can have the same power. Create some sample records.

Retrieve the first wizard and any powers he/she has with damage greater than 5.

What's the difference between an outer and inner join?

If I just write JOIN, is that an inner or outer join?

When would I want to use an outer join?