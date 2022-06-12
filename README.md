# enigma_final_redo
Project Final Mod 1 Turing

Self Assessment

**Functionality**
**3/4**

Enigma Class with encrypt and decrypt methods successfully implemented. Encrypt/decrypt command line interfaces successfully implemented.  I added the date/time when the files are created via CLI well.

**Object Oriented Programming**
**3.5/4**

Once I tested and built the encryption features and class, I realized decryption would work essentially the same way, except for two parts. I also noticed that both encryption and decryption required the same values(dates, keys, shifts) that were created time and time again, therefore I built a module named 'Creatables' and tapped into that anytime a value being generated could be used by both encryption and decryption.

I considered making separate classes for shifts, keys, dates, and offsets, but it seemed like that would be unnecessary because it would require more and more class object instantiation.  A module also made much more sense to me and kept classes from getting unneccesarily large.  I could have created separate modules for keys, dates, etc. but the 'Creatables' module's purpose for me was to simply to create( or generate) values that are used elsewhere in the program.

I considered inheritance with the encryption and decryption classes (inheritance from enigma) but generally thought of my encryption and decryption classes as features of enigma, versus 'is_a?' an enigma.

**Ruby Convention and Mechanics**
**3.5/4**

My method and class names clearly define the purpose of that class/method.  For example-'map_encrypt_shifts_to_characters' or 'map_decrypt_shifts_to_characters' explicitly explains that the shifts are being mapped to the characters of a message.  I was able to avoid using **each** throughout this entire project except in conjunction with ```each_slice``` or each_cons for formatting messages or shifts in a specific way.  There are no methods longer than 10 lines.

**Test Driven Development**
**2.5/4**

Mocks/Stubs accounting for randomness were not implemented.  Edge cases such as special characters were tested.  Every method was tested (simple cov score - 99%).  Although not ideal, several of my tests (inside Encryption and Decryption specs) required multiple steps that built on each other.  Therefore, I had to put several methods inside of one test.  Additionally, there was one method inside creatables.rb called generate_shifts that I could not break apart into smaller tests (and perhaps smaller methods).  I was able to use pry to determine the method was doing what I wanted it to do but could not figure out how to integrate that into TDD.  When I tested this method, I knew what I wanted the end result to be and received it but could not break the test apart to get each individual step.  This also occurred with two other methods that used multiple enumerables.  Again, I wrote the test and knew what I wanted the end result to be but couldn't break the test apart although I did use pry to check the steps.

**Version Control**
**4/4**

70 commits, 10 pull requests

I began this project with lackluster version control but soon realized that breaking it apart into branches and frequently committing allowed me to roll back when I went a direction that led nowhere.  I did this several times--a particularly useful time was when I tried to build out a cli and somehow broke my Enigma class.  I ended up getting rid of the branch I was on, pulled the previous version of the project from Github, and reopened a new branch.  There was another point in the project when I realized I was not building the CLI the way Turing wanted me to so I reverted back to a previous commit using git reset.

