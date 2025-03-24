# Project-ShopAluraGeek

**I invite you to watch the walkthrough of my web application:**
https://www.youtube.com/watch?v=zg3Vkg1Py5M


## 👀 Previews:

![](https://raw.githubusercontent.com/jcardonamde/Project-ShopAluraGeek/main/tienda/app/static/imgs/Visual1.png)

![](https://raw.githubusercontent.com/jcardonamde/Project-ShopAluraGeek/main/tienda/app/static/imgs/Visual2.png)


**Published under the topic:**
https://github.com/topics/challengeonealurageeklatam

## Description
Project-ShopAluraGeek is my first E-Commerce platform themed around Geek culture, integrating both Backend and Frontend components. The development was based on the user stories provided in the challenge, with additional functionalities added to enhance the application's value. Users can register, log in, and manage their products through an administrative interface.

<br>

:wrench:
***Features:***

- [x] CRUD Model: Allows creation, reading, updating, and deletion of products.
- [x] User Management: Registration and login to access the administrative panel.
- [x] Dynamic Validations: Use of AJAX to prevent information loss in forms.
- [x] Email Notifications: Sending emails for various user actions.

<br>

**Technologies Used** 💻

:snake:
***Backend:***

- [x] Object-Oriented Programming (OOP) and implementation of the Model-View-Controller (MVC) pattern.
- [x] Flask: Web development framework.
- [x] MySQL: Database management.
- [x] Libraries: Database connection and email notification sending.


:art: ***Frontend:***

- [x] HTML5 and CSS3: Structure and styling of the pages.
- [x] Bootstrap 5: Responsive design and pre-defined components.
- [x] JavaScript: Validations and dynamic functionalities.
- [x] AJAX: Real-time validations to enhance user experience.

<br>

:page_facing_up: **User Story**

AluraGeek wants to reach more customers and increase its sales, so they plan to implement an e-commerce platform to take the company to the next level and embrace digital transformation.

To achieve this, they are requesting our help as developers. The e-commerce platform must meet the following requirements:

* A home page that includes a login button and a search engine for browsing the products offered by the company.
* A banner displaying discounts, promotions, or relevant information.
* A product gallery showcasing product details such as an image, product name, price, and a link to the product description page.
* A product details page containing the product image, name, description, and price.
* A footer with a contact form and other relevant information.
* A login form to authenticate users who need access to the admin menu.
* An admin menu where users can add, edit, search, or delete products from the store.
* The website must be responsive, ensuring that customers can easily shop using mobile devices such as tablets and smartphones.

<br>

## Installation and Execution

To run this project locally, follow these steps:

1. Clone the repository:
```bash
git clone https://github.com/jcardonamde/Project-ShopAluraGeek.git
```

2. Navigate to the project directory:
```bash
cd Project-ShopAluraGeek
```

3. Create and activate a virtual environment:
```bash
python -m venv env
source env/bin/activate  # On Windows: env\Scripts\activate
```

4. Install dependencies:
```bash
pip install -r requirements.txt
```

5. Set up the database:
* Create a MySQL database named shop_alura_geek.
* Import the schema and initial data from the database/schema.sql file.

6. Configure environment variables:
Create a .env file in the project's root with the following variables:
```bash
FLASK_APP=run.py
FLASK_ENV=development
SECRET_KEY=your_secret_key
DATABASE_URI=mysql+pymysql://user:password@localhost/shop_alura_geek
```

7. Start the application:
```bash
flask run
```

8. Access the application:
Open your browser and visit http://127.0.0.1:5000/ to see the application in action.

<br>

## Contributions

If you wish to contribute to this project, please follow these steps:

1. Fork the repository.
2. Create a new branch (git checkout -b feature/new-feature).
3. Make your changes and commit with descriptive messages.
4. Push your changes to your fork (git push origin feature/new-feature).
5. Open a Pull Request in this repository.


   
