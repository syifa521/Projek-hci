from flask import Flask, request, jsonify, send_from_directory
from flask_cors import CORS
from db import create_table_users, get_all_books, get_books_by_category, get_user_by_id, get_users, init_table_books, insert_user, login_db, update_profile_image
from werkzeug.utils import secure_filename
import os

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = 'uploads'
app.config['ALLOWED_EXTENSIONS'] = {'png', 'jpg', 'jpeg'}
CORS(app, resources={r"/*": {"origins": "*"}})


@app.route('/init', methods=['GET'])
def init_table():
    create_table_users()
    init_table_books()

    return jsonify({"message" : "success"})

@app.route("/users", methods= ["GET"])
def getUsers() -> str:
    return jsonify(get_users()), 200

@app.route("/login", methods= ["POST"])
def login() -> str:
    try:
        nisn = request.json['nisn']
        password = request.json['password']

        users = login_db(nisn, password)
            
        if len(users) != 0:
            return jsonify({'message': 'Login successful',
                            "user": users[0]}), 200
        else:
            return jsonify({'message': 'Invalid Nisn Or Password',
                            "user": []}), 205
    except Exception as e:
            return jsonify({'message': e}), 500


@app.route("/register", methods= ["POST"])
def register() -> str:
    user = {
        "nisn" : request.json["nisn"],
        "name" : request.json["name"],
        "image_url" : request.json["image_url"],
        "email" : request.json["email"],
        "password" : request.json["password"],
    }
    result = insert_user(user)
    if result == False:
        return jsonify({"message": False}), 205    
    else:
        return jsonify(result), 200     
          


@app.route("/books", methods= ["GET"])
def get_books() -> str:
    try:
        # Get query parameters from the request
        query_params = request.args

        # Check if there are query parameters
        if query_params:
            print(dict(query_params.items()).get('category'))
            # Filter books based on query parameters
            filtered_books = get_books_by_category(dict(query_params.items()).get('category'))
            response_data = {"data": filtered_books}
            if len(filtered_books) != 0:
                return jsonify(response_data), 200
            else:
                return jsonify(response_data), 205
                 
        else:
            books = get_all_books()
            response_data = {"data": books}
            if len(books) != 0:
                return jsonify(response_data), 200
            else:
                return jsonify(response_data), 205

    except Exception as e:
            return jsonify({'message': e}), 500
    

@app.route('/update_image/<string:nisn>', methods=['POST'])
def update_image(nisn):

    if request.method == 'POST':
        file = request.files['file']
        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            file_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
            file.save(file_path)

            # Update the user's profile image path in the database
            result = update_profile_image(nisn,file_path)

            if len(result) == False:
                return jsonify({"message": False}), 205    
            else:
                return jsonify(result), 200     

@app.route('/uploads/<filename>')
def uploaded_file(filename):
    return send_from_directory(app.config['UPLOAD_FOLDER'], filename)

def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in app.config['ALLOWED_EXTENSIONS']

if __name__ == "__main__":
    app.run(host='0.0.0.0',debug=True)