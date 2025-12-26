# Classic Ciphers Suite

A collection of three C programs designed to encrypt, manipulate, and process text using historical cryptographic methods. This project demonstrates string manipulation, ASCII math, and command-line argument handling in C.

## Included Tools

### 1. Caesar Cipher
A substitution cipher that shifts every letter in a plaintext by a fixed number of positions (the key) down the alphabet.
* **Usage:** `./caesar <key>` (where key is a non-negative integer)

### 2. Vigenère Cipher
A more advanced polyalphabetic substitution cipher that uses a keyword to apply a sequence of different Caesar shifts.
* **Usage:** `./vigenere <keyword>` (where keyword is an alphabetic string)

### 3. Initialism Generator
A utility that extracts the first letter of every word in a string and capitalizes them to create an acronym or initialism.
* **Usage:** Run the program and provide a string when prompted.

Concepts Applied
Modular Arithmetic: Using (x + k) % 26 to handle alphabet wrapping.

ASCII Mapping: Manually shifting characters based on standard integer values (65 for 'A', 97 for 'a').

Command Line Arguments: Validating argc and parsing argv.

Index Tracking: Maintaining separate counters for plaintext and keyword indices in the Vigenère cipher.

License
This project is open-source and available under the MIT License.
---

## Getting Started

### Compilation
Use `clang` or `make` to compile the source files:

```bash
make caesar
make vigenere
make initials
