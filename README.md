![Checkr](./checkr-logo-sm.png)

Built with Ruby on Rails.

Current features:

* Guest accounts
* Admin accounts
* File uploading for training purposes (admin only)
* File checking for guests and admins
* User editing by admins

## How to Run

Ruby/Rails is an absolute nightmare to get running on Windows, I ended up using the Windows Subsystem for Linux.

* Install Ruby (I recommend using [RVM](https://rvm.io/))
* Install Bundler: `gem install bundler`
* Install `sqlite3` somehow
* Clone the project
* Install dependencies with `bundle install`
* Run database migrations: `rails db:migrate RAILS_ENV=development`
* Start the server: `rails s`

If it complains that `rails` isn't a command you might have to install it specifically with `gem install rails -v 5.2.3`.

## Project Structure

Sessions are handled by Rails magic using cookies.

There are two models (tables): `User` and `TrainingFile`. A `User` is either a guest or an admin depending on the value of the `admin` column. A `TrainingFile` is a file that was uploaded by an admin to train the malware detection.

### Virus Detection

Actual files are discareded after being analyzed. Instead, a fingerprint consisting of a sequence of bytes is extracted and stored in the database in base64.

Fingerprinting training files is done in `app/models/training_file.rb`, in the `file=` function. Checking test files is done in `app/controllers/testing_files_controller.rb`.

### Permissions

Anybody can register for an account and run Checkr on files they want to test. To upload training files, a user can be made an admin by an existing user.

### CSS

Styling done using [Bulma](https://bulma.io/). Logo made by me.