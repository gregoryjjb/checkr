![Checkr](./checkr-logo-sm.png)

Built with Ruby on Rails.

Current features:

* Guest accounts
* Admin accounts
* File uploading for training purposes (admin only)
* File checking for guests and admins
* User editing by admins

## Project Structure

Sessions are handled by Rails magic using cookies.

There are two models (tables): `User` and `TrainingFile`. A `User` is either a guest or an admin depending on the value of the `admin` column. A `TrainingFile` is a file that was uploaded by an admin to train the malware detection.

Actual files are discareded after being analyzed. Instead, a fingerprint consisting of a sequence of bytes is extracted and stored in the database in base64.