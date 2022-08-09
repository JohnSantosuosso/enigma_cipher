## Enigma Cipher

Enigma is a Command Line Interface(CLI) app built entirely in Ruby that utilizes RSpec and TDD to provide the user with the option to encrypt a message, which can later be decrypted after the encrypted message is read from a text file. The cipher itself is built partially off of the famous 'Caesar Cipher,' with additional encryption measures and character shifts added to increase the complexity of the encryption pattern.

**_Getting Started_**

 1.  **Create a new directory on your computer where you'd like the program to live** 

     ```mkdir /Users/your_user_name/your_folder/enigma_cipher```
  
 2.  **Navigate into the recently created directory** 

     ```/Users/your_user_name/your_folder  $cd enigma_cipher ```
  
 3.  **Clone the repository by clicking on the code button on Github repo page. Then, copy the repo information using SSH.**

     ![183747041-40f47875-442e-4008-8d00-8c45bf2731fe](https://user-images.githubusercontent.com/95776577/183752233-c9130b38-ce16-4b4c-aeb4-fdf0d0d4a137.png)


  
 4.  **Inside the recently created directory, clone the recently copied repository information** 

      ```$git clone git@github.com:JohnSantosuosso/enigma_cipher.git```

 5. **Open the repository in your preferred IDE.  If you are using VSCode, use the code command shown below.** 

     ```$code```
     
 6. **Write your message to be encrypted.** 
      
      Locate the ```message.txt``` file inside the project.  Enter the message you wish to encrypt.
      
      <img width="350" alt="enigma" src="https://user-images.githubusercontent.com/95776577/183780200-c6789f6e-3963-4315-8455-9c96a7021053.png">
      
 7. **Navigate to your terminal while located inside the project directory.  Run encryption by calling the encrypt class.** 
      
       ```$ ruby ./lib/encrypt.rb message.txt encrypted.txt```
       
       You should receive a message indicating the message has been encrypted:
       ```Created encrypted.txt at 09/08/2022 19:46 with the key 61950 and the date 80922.```
       
 7. **Open the encrypted.txt file inside the project.  Your message is now encrypted. If no key or date was provided, they are auto-generated.** 
 
       <img width="375" alt="enigma2" src="https://user-images.githubusercontent.com/95776577/183781010-b7098ed7-4731-48ee-8232-e88d95557961.png">
 
 8.  **To decrypt the encrypted file, use the terminal to call the decrypt class and view decrypted.txt.  The program will automatically extract the key and      date from the encrypted.txt file.** 
     
     ```$ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt```
       
