import sqlite3

# users =  {
#             "id":1,
#             "nisn": "user1",
#             "name": "user1",
#             "image_url": "user1.png",
#             "email": "user1@gmail.com",
#             "password": "12345"
#         }

# books =  [
#         {
#             "name":"XII Biologi",
#             "category": "IPA",
#             "image":"assets/images/buku.png",
#             "path":"assets/pdf/XII_Biologi.pdf"
#         },
#     ]
def connect_to_db():
    conn = sqlite3.connect('database.db')
    return conn

def create_table_users():
    try:
        conn = connect_to_db()
        conn.execute('''
            CREATE TABLE IF NOT EXISTS users (
                id INTEGER PRIMARY KEY NOT NULL,
                nisn TEXT NOT NULL UNIQUE,
                name TEXT NOT NULL,
                image_url TEXT NOT NULL,
                email TEXT NOT NULL,
                password TEXT NOT NULL
            );
        ''')

        conn.commit()
        print("User table created successfully")
    except:
        print("User table creation failed - Maybe table")
    finally:
        conn.close()

def init_table_books():
    
    books =  [
        (
            "XII Biologi",
            "IPA",
            "biologi.png",
            "assets/pdf/XII_Biologi.pdf",
        ),
        (
            "VII Matematika",
            "IPA",
            "mtk.png",
            "assets/pdf/matematika.pdf",
        ),
        (
            "Ekonomi XI",
            "IPS",
            "ekonomi3.png",
            "assets/pdf/ekonomi.pdf",
        )
    ]
    create_table_books()
    insert_books_data(books)
    

def create_table_books():
    try:
        conn = connect_to_db()
        conn.execute('''
            CREATE TABLE IF NOT EXISTS books (
                id INTEGER PRIMARY KEY NOT NULL,
                name TEXT NOT NULL,
                category TEXT NOT NULL,
                image TEXT NOT NULL,
                path TEXT NOT NULL
            );
        ''')

        conn.commit()
        print("books table created successfully")
    except:
        print("books table creation failed - Maybe table")
    finally:
        conn.close()

def insert_books_data(data):
    try:
        conn = connect_to_db()
        # Use parameterized query to insert multiple rows
        conn.executemany('''
            INSERT INTO books (name, category, image, path) 
            VALUES (?, ?, ?, ?);
        ''', data)

        conn.commit()
        print("books table inserted successfully")
    except:
        print("books table insert failed - Maybe table")
    finally:
        conn.close()

def get_books_by_category(category):
    books = []
    try:
        conn = connect_to_db()
        conn.row_factory = sqlite3.Row
        cur = conn.cursor()
        cur.execute('SELECT * FROM books WHERE category = ?;', (category,))
        rows = cur.fetchall()

        # convert row objects to dictionary
        for i in rows:
            book = {}
            book["name"] = i["name"]
            book["category"] = i["category"]
            book["image"] = i["image"]
            book["path"] = i["path"]
            books.append(book)

    except:
        books = []

    return books
def get_all_books():
    books = []
    try:
        conn = connect_to_db()
        conn.row_factory = sqlite3.Row
        cur = conn.cursor()
        cur.execute('SELECT * FROM books')
        rows = cur.fetchall()

        # convert row objects to dictionary
        for i in rows:
            book = {}
            book["name"] = i["name"]
            book["category"] = i["category"]
            book["image"] = i["image"]
            book["path"] = i["path"]
            books.append(book)

    except:
        books = []

    return books


def insert_user(user):
    inserted_user = {}
    try:
        conn = connect_to_db()
        cur = conn.cursor()
        cur.execute("INSERT INTO users (nisn, name, image_url, email, password) VALUES (?, ?, ?, ?, ?)", (user['nisn'],   
                    user['name'], user['image_url'], user['email'],   
                    user['password']) )
        conn.commit()
        inserted_user = get_user_by_id(cur.lastrowid)
    except:
        inserted_user = False
        conn.rollback()

    finally:
        conn.close()

    return inserted_user

def get_users():
    users = []
    try:
        conn = connect_to_db()
        conn.row_factory = sqlite3.Row
        cur = conn.cursor()
        cur.execute("SELECT * FROM users")
        rows = cur.fetchall()

        # convert row objects to dictionary
        for i in rows:
            user = {}
            user["id"] = i["id"]
            user["nisn"] = i["nisn"]
            user["name"] = i["name"]
            user["image_url"] = i["image_url"]
            user["email"] = i["email"]
            user["password"] = i["password"]
            users.append(user)

    except:
        users = []

    return users

def login_db(nisn, password):
    users = []
    try:
        conn = connect_to_db()
        conn.row_factory = sqlite3.Row
        cur = conn.cursor()
        cur.execute("SELECT * FROM users WHERE nisn = ? AND password = ?", (nisn, password))
        rows = cur.fetchall()

        print(len(rows))
        # convert row objects to dictionary
        if(len(rows) != 0):
            for i in rows:
                user = {}
                user["id"] = i["id"]
                user["nisn"] = i["nisn"]
                user["name"] = i["name"]
                user["image_url"] = i["image_url"]
                user["email"] = i["email"]
                user["password"] = i["password"]
                users.append(user)
        else:
            users = []

    except:
            users = []

    finally:
            conn.close()

    return users

def update_profile_image(nisn, file_path):
    users = {}
    try:
        conn = connect_to_db()
        conn.row_factory = sqlite3.Row
        cur = conn.cursor()
        cur.execute("UPDATE users SET image_url = ? WHERE nisn = ?", (file_path, nisn))
        conn.commit()
        users = get_user_by_nisn(nisn)

    except:
            users = False
            conn.rollback()

    finally:
            conn.close()

    return users



def get_user_by_id(id):
    user = {}
    try:
        conn = connect_to_db()
        conn.row_factory = sqlite3.Row
        cur = conn.cursor()
        cur.execute("SELECT * FROM users WHERE id = ?", 
                       (id,))
        row = cur.fetchone()

        # convert row object to dictionary
        user["id"] = row["id"]
        user["nisn"] = row["nisn"]
        user["name"] = row["name"]
        user["image_url"] = row["image_url"]
        user["email"] = row["email"]
        user["password"] = row["password"]
    except:
        user = {}

    return user

def get_user_by_nisn(nisn):
    user = {}
    try:
        conn = connect_to_db()
        conn.row_factory = sqlite3.Row
        cur = conn.cursor()
        cur.execute("SELECT * FROM users WHERE nisn = ?", 
                       (nisn,))
        row = cur.fetchone()

        # convert row object to dictionary
        user["id"] = row["id"]
        user["nisn"] = row["nisn"]
        user["name"] = row["name"]
        user["image_url"] = row["image_url"]
        user["email"] = row["email"]
        user["password"] = row["password"]
    except:
        user = {}

    return user