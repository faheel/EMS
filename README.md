# Examination Management System

[![Deployed to Heroku][heroku-shield]][app-link]
[![Made with Django][django-shield]][django-link]

[![Demo][screenshot]][app-link]

## Setup
1. Clone the repo and `cd` into it

2. Create a Python 3 virtual environment

	```bash
	sudo apt install python3-dev python-virtualenv
	```

	```bash
	virtualenv --python=/usr/bin/python3 ve
	```

	`ve` is the name of the virtual environment

3. Activate the virtual environment

	```bash
	source ve/bin/activate
	```

4. Install the requirements

	```bash
	pip install -r requirements.txt
	```

### Create a PostgreSQL database
1. Install PostgreSQL

	```bash
	sudo apt install postgresql postgresql-contrib libpq-dev
	```

2. Open the PostgreSQL shell

	```bash
	sudo -u postgres psql postgres
	```

3. Create a user with the name `dev`

	```SQL
	CREATE USER dev;
	```

4. Create a database with the name `ems`

	```SQL
	CREATE DATABASE ems OWNER dev;
	```

	Now exit the PostgreSQL shell by entering `\q`. You should be back in the shell with `ve` activated

5. Apply migrations

	```bash
	python3 manage.py migrate
 	```

#### Create Django superuser
```bash
python3 manage.py createsuperuser --username admin
```

**Setup is now complete!** :tada:

## Launch
First, make sure that the virtual environment we created, i.e. `ve`, is activated. Then run

```bash
python3 manage.py runserver
```

Once the development server has started, you may visit http://127.0.0.1:8000/ to check out the app.


[heroku-shield]: https://img.shields.io/badge/Deployed_to-Heroku-7e57c2.svg?style=for-the-badge
[app-link]: https://e-m-s.herokuapp.com/
[django-shield]: https://img.shields.io/badge/Made_with-Django-44B78B.svg?style=for-the-badge
[django-link]: https://www.djangoproject.com
[screenshot]: https://cloud.githubusercontent.com/assets/11466676/22126660/95d09678-debe-11e6-9e1b-009f1ca782ee.png
