#!/usr/bin/env python3
"""
Run this script once to generate the ADMIN_PASSWORD_HASH env var value.
Usage: python3 set_admin_password.py
"""
import getpass
from werkzeug.security import generate_password_hash

password = getpass.getpass("Enter admin password: ")
confirm = getpass.getpass("Confirm password: ")

if password != confirm:
    print("Passwords do not match.")
    raise SystemExit(1)

hashed = generate_password_hash(password)
print("\nAdd these to your environment (e.g. in /etc/environment or your systemd service):\n")
print(f'ADMIN_USERNAME=admin')
print(f'ADMIN_PASSWORD_HASH={hashed}')
print(f'SECRET_KEY=<generate a random 32-byte hex string, e.g.: python3 -c "import secrets; print(secrets.token_hex(32))">')
