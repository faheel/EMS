# Examination Management System
## Setup
1. Clone the repo
	```
	git clone https://github.com/faheel/examination-management-system.git
	cd examination-management-system
	```

2. Create virtual environment (Pyhton 3.5)
	```
	sudo apt install python-virtualenv
	virtualenv --python=python3.5 ve
	```
	`ve` is the name of the virtual environment

3. Activate virtual environment
	```
	source ve/bin/activate
	```

4. Install Django
	```
	pip install django
	```
	
5. Install MySQL-client
	```
	pip install mysqlclient
	```

### Create a MySQL database
1. Install MySQL-server
	```
	sudo apt install mysql-server
	```
	
	**Now from the MySQL shell**
2. Create a database with the name `ems`
	```
	create database ems;
	```

3. Create a user with the name `dev` on *localhost* having the password `aaaszsfa`
	```
	GRANT ALL PRIVILEGES ON ems.* TO 'dev'@'localhost' IDENTIFIED BY 'aaaszsfa';
	```

Done!
