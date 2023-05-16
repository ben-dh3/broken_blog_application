# Creating and authenticating users

Learn to authenticate users with the database and sessions.

## Storing users in the database

Usually, a user account will be stored in a database. User accounts can also be
considered a resource: we can create a new user account (signing up), read its
information (account page), update it, etc.

User accounts usually come with passwords. It is important to handle these
carefully.

The most important rule for this is: **never store passwords in plain text.**

So how do you store them?

## Hashing

You store passwords using a cryptographic hash.

Let's look at one to see what it does:

```python
>>> import hashlib
>>> password = "s3cretp4ss"
>>> binary_password = password.encode("utf-8")
>>> hashlib.sha256(binary_password).hexdigest()
'2ecdb8b3448acc1ea59c4ed75a7ebd31f828eaeea94edf22b633e1092e155e0b'
```

Looks like a random list of digits right?

If you run this code yourself with the same password you will see that the
output string is always the same. However, if you change the input string then
the output string is very different, even if you only change it a tiny bit.

Hashing functions are sometimes called 'one-way functions' and in that name lies
their special power. It is quick to generate the hash for a string, but very
hard to generate the original string from its hash.

Unlike encryption, there's no special key that allows you to 'decrypt' the hash.
Once you've hashed the password and thrown away the original then you're very
likely never going to be able to recover the original.

Why is this useful? Because if a malicious person gains access to your database
they will find it very difficult to recover the actual passwords of the users.
Not even you know what they are!

<details>
  <summary>:speech_balloon: Really? Are you sure?</summary>

  ---

  We're simplifying slightly here. Depending on how the hashing function is
  configured it can be easier or harder to discover the original password and
  there are techniques that attackers can use to make it easier.

  However, a well-configured hashing function does make it much harder for
  attackers to make use of a stolen list of hashed passwords.

  What does 'well-configured' mean? That's beyond our scope here. Suffice to
  say, if you're working on a production application you should either use an
  industry-standard security-tested framework to handle this for you, or trust
  the work to a security expert.

  ---

</details>

So, if we can't recover the original password, how do we actually use it?

Here's a little game to illustrate the point:

```python
import hashlib

COACH_PASSWORD_HASH = 'cb93b9e2a8713d622ec3f44c646dfe16b84f41f115ce933d0600771b7943b417'

def check_password(password):
    binary_password = password.encode("utf-8")
    hashed_password = hashlib.sha256(binary_password).hexdigest() # This part does the magic
    return hashed_password == COACH_PASSWORD_HASH

while True:
    guess = input("Enter password: ")
    print(f"Trying {guess}...")
    if check_password(guess):
        print("What! You guessed my password!")
        break
    else:
        print("Ha, nice try!")
```

Your job is to run this file and try to guess the password. Your clue is that
the coach who wrote this is very self-absorbed and used her own name as the
password. Plus, she hates uppercase letters!

<details>
  <summary>:speech_balloon: So, how does it work?</summary>

  ---

  If you have stored a hash of the password and you want to work out if the user
  has entered the right password, you can hash the password they've given you
  and compare it against the hash you already have.

  Because a hashing function always returns the same output for the same input,
  if they match then the user has entered the correct password.

  ---

</details>

## Using this in a Repository

We can use this approach in a user Repository to store and authenticate users.

```python
# File: lib/user_repository.py

from lib.database_connection import DatabaseConnection
import hashlib

class UserRepository:
    def __init__(self, connection):
        self._connection = connection

    def create(self, email, password):
        # Hash the password
        binary_password = password.encode("utf-8")
        hashed_password = hashlib.sha256(binary_password).hexdigest()

        # Store the email and hashed password in the database
        self._connection.execute(
            'INSERT INTO users (email, password) VALUES (%s, %s)',
            [email, hashed_password])

    def check_password(self, email, password_attempt):
        # Hash the password attempt
        binary_password_attempt = password_attempt.encode("utf-8")
        hashed_password_attempt = hashlib.sha256(binary_password_attempt).hexdigest()

        # Check whether there is a user in the database with the given email
        # and a matching password hash, using a SELECT statement.
        rows = self._connection.execute(
            'SELECT * FROM users WHERE email = %s AND password = %s',
            [email, hashed_password_attempt])

        # If that SELECT finds any rows, the password is correct.
        return len(rows) > 0
    
    # ...
```

## On Sessions

By design, a web server cannot remember information about a specific client — it
only receives requests, and sends back a response.

In order to keep track of data about a specific client, we can use a feature of
Flask called the session. By storing information in the session, we can make it
available in any subsequent requests from the same client.

Authentication is a very good example on how sessions can be useful — here is a
typical HTTP flow of a user signing in:

1. The user (through a web browser) signs in on a website using their
   credentials.
2. The web browser sends the HTTP request with the credentials to the server.
3. The server checks the credentials, usually by looking in a database.
4. If credentials are valid, the server **stores information about the signed-in
   user in the session** and sends back the response.
5. During any other request sent by the same client (so, by the same user),
   **the session will contain the user information stored previously**. For any
   other client, the session will not contain this information.

So the session is a way to "remember" information about a specific user, even
though the client they are using is sending many different requests to the
server.

## Using sessions in Flask

```python
from flask import Flask, render_template, request, session, redirect

app = Flask(__name__)

# This route simply returns the login page
@app.route('/login')
def login():
    return render_template('login.html')

# This route receives login information (email and password) as POST parameters,
# checks whether the credentials are valid, and if so finds the user in the database
# using the email. If all goes well, it stores the user's ID in the session
# and shows a success page.
@app.route('/login', methods=['POST'])
def login_post():
    email = request.form['email']
    password = request.form['password']

    if UserRepository.check_password(email, password):
        user = UserRepository.find_by_email(email)
        # Set the user ID in session
        session['user_id'] = user.id

        return render_template('login_success.html')
    else:
        return render_template('login_error.html')

# This route is an example of a "authenticated-only" route. It can be accessed 
# only if a user is signed-in (if we have user information in session).
@app.route('/account_page')
def account_page():
    if 'user_id' not in session:
        # No user id in the session so the user is not logged in.
        return redirect('/login')
    else:
        # The user is logged in, display their account page.
        return render_template('account.html')
```

## Exercise (without a database)

In a new web project:

Create a new login form by test-driving two routes:
  * The first route `GET /login` simply returns the login form page.
  * The second route `POST /login` receives credentials (email and password),
    should then verify the password is equal to `s3cretp4ss`, and if it is,
    store a new variable in session to indicate the user is logged in.

You can also create an index page at `GET /` which returns a page indicating
whether the user is logged in or not.

## Exercise (with a database)

Work through the same exercise as above, but this time, use the database to
store user accounts. You should also use a Repository class to find and
authenticate the user against the password submitted via the login form.


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=pills%2Fuser_authentication.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=pills%2Fuser_authentication.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=pills%2Fuser_authentication.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=pills%2Fuser_authentication.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=pills%2Fuser_authentication.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
