# Enigma Cipher

**Enigma** is a Command Line Interface(CLI) app built in **Ruby**. This app provides the user with the ability to encrypt a message which can later be decrypted when the encrypted message is read from a text file and processed.

The cipher is partially based on the ***Caesar Cipher***, but uses an additional encryption process based on the user-provided key and date.  If the user chooses not to provide a key or date, the program will automatically generate either or both.

<!-- TABLE OF CONTENTS -->
<h2 id="table-of-contents"> :book: Table of Contents</h2>

<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#techical-requirements"> ➤ Technical Requirements</a></li>
    <li><a href="#project-files-description"> ➤ Project Files Description</a></li>
    <li><a href="#getting-started"> ➤ Getting Started</a></li>
    <li><a href="#scenario1"> ➤ Scenario 1: Encrypting a Message (no date and key provided) </a></li>
    <li><a href="#scenario2"> ➤ Scenario 2: Decrypt an Encrypted File </a></li>
    <li><a href="#scenario3"> ➤ Scenario 3: Encrypt a Message (key provided)  </a></li>
    <li><a href="#scenario4"> ➤ Scenario 4: Scenario 4: Encrypt a Message (date provided)</a></li>
    <li><a href="#credits"> ➤ Credits</a></li>
  </ol>
</details>

<!-- TECHNICAL REQUIREMENTS -->
<h2 id="techical-requirements"> 💻 Technical Requirements</h2>
<ul>
  <li>Ruby 2.7.4</li>
  <li>RSpec 3.11</li></ul>
   
<!-- PROJECT FILES DESCRIPTION -->
<h2 id="project-files-description"> :floppy_disk: Project Files Description</h2>

<ul>
  <li><b>decrypt.rb</b>
  <ol>
  <li>Provides "read access" to an encrypted text file</li>
  <li>Calls the decryption processes </li>
  <li>Writes output to <i>decrypt.txt</i></li></ol>
  <li><b>decryption.rb</b><ol>
  <li>Facilitates decryption processes</li></ol>
   <li><b>encrypt.rb</b>
    <ol>
  <li>Provides "read access" to a plaintext file</li>
  <li>Calls the encryption processes </li>
  <li>Writes output to <i>encrypt.txt</i></li></ol>
  <li><b>encryption.rb</b><ol>
  <li>Facilitates encryption processes</li></ol>
  <li><b>enigma.rb</b><ol>
  <li>Calls the encryption/decryption processes</li>
  <li>Receives key and date input from CLI (if provided)</li>
  <li>Directs inputs based on whether encrypt or decrypt has been specified</li></ol>
</ul>

<h3>Some other supporting files</h3>
<ul>
  <li><b>creatable.rb</b><ol>
   <li>Creates keys and date if either or both were not provided by the user</li>
  <li>Creates shift and encryption/decryption logic enacted on message</li></ol>
   <li><b>decrypted_message.txt</b><ol>
  <li>Where a decrypted message's output appears</li></ol>
   <li><b>encrypted_message.txt</b><ol>
  <li>Where an encrypted message's output appears</li></ol>
   <li><b>spec</b><ol>
  <li>Folder containing tests for all methods</li></ol>
</ul>

<!-- GETTING STARTED -->
<h2 id="getting-started"> :book: Getting Started</h2>

<p><b>1. </b> Create a new directory on your computer where you'd like the program to live.</p>
<pre><code>$ mkdir /your_folder/enigma_cipher</code></pre>

<p><b>2. </b> Navigate into the recently created directory.</p>
<pre><code>$ cd /your_folder/enigma_cipher</code></pre>
<p><b>3. </b> Copy the repository by clicking on the code button on Github repo page (using SSH).</p>

![183747041-40f47875-442e-4008-8d00-8c45bf2731fe](https://user-images.githubusercontent.com/95776577/183752233-c9130b38-ce16-4b4c-aeb4-fdf0d0d4a137.png)

<p><b>4. </b> Clone the recently copied repository information into your currenty directory.</p>
<pre><code>$ git clone git@github.com:JohnSantosuosso/enigma_cipher.git</code></pre>

<p><b>5. </b> Open the repository in your preferred IDE.  If you are using VSCode, use the code command shown below:</p>
<pre><code>$ code .</code></pre>


<!-- SCENARIO1 -->
<h2 id="scenario1"> :small_orange_diamond: Scenario 1: Encrypting a Message (no date and key provided)</h2>

<ul><li>Locate the <b>message.txt</b> file inside the project and provide the message you wish to encrypt:</li>
<br>
 <img width="550" alt="enigma" src="https://user-images.githubusercontent.com/95776577/183780200-c6789f6e-3963-4315-8455-9c96a7021053.png">
 <br><br>
<li>Open your terminal while inside the project directory. Run encryption processes by calling <b>encrypt.rb</b> and specifying required text files.</li>
<pre><code>$ ruby ./lib/encrypt.rb message.txt encrypted.txt</code></pre>
<li>Note the CLI message indicating encryption was successful.</li>
<pre><code>$ Created encrypted.txt at 09/08/2022 19:46 with the key 61950 and the date 80922.</code></pre>
<li>Open <b>encrypted.txt</b> inside the project and view the encrypted message.</li>
<br>
 <img width="550" alt="enigma2" src="https://user-images.githubusercontent.com/95776577/183781010-b7098ed7-4731-48ee-8232-e88d95557961.png">
<br></ul>

<!-- SCENARIO2 -->
<h2 id="scenario2"> :small_orange_diamond: Scenario 2: Decrypt an Encrypted File </h2>

<ul><li>Open your terminal while inside the project directory. Run decryption processes by calling <b>decrypt.rb</b> and specifying required text files.</li>
<pre><code>$ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt</code></pre>
<li>Note the CLI message indicating decryption was successful.</li>
<pre><code>$ Created decrypted.txt at 09/08/2022 19:46 with the key 61950 and the date 80922.</code></pre>
<p><i>The program extracts the date and key from <b>encrypted.txt</b> to decrypt the message.</i></p>
<li>Open <b>decrypted.txt</b> inside the project and view the encrypted message.</li>
<br>
<img width="550" alt="Screen Shot 2022-09-03 at 6 01 42 PM" src="https://user-images.githubusercontent.com/95776577/188288962-36125cd5-659c-4ccd-bb99-e3c05a0fbecb.png">
<br></ul>

<!-- SCENARIO3 -->
<h2 id="scenario3"> :small_orange_diamond: Scenario 3: Encrypt a Message (key provided) </h2>

<ul><li>Provide a random five digit key when utilizing CLI to encrypt a message. </li>
<pre><code>$ ruby ./lib/encrypt.rb message.txt encrypted.txt 82648</code></pre>
<li>Note the CLI message indicating encryption was successful.</li>
<pre><code>$ Created encrypted.txt at 09/08/2022 19:46 with the key 82648 and the date 80922.</code></pre>
<p><i>The program generates a date value using the current date since a date was not provided.</i></p>
<li>Open <b>encrypted.txt</b> inside the project and view the encrypted message.</li></ul>

<!-- SCENARIO4 -->
<h2 id="scenario4"> :small_orange_diamond: Scenario 4: Encrypt a Message (date provided) </h2>

<ul><li>Provide a random five digit key when utilizing CLI to encrypt a message. </li>
<pre><code>$ ruby ./lib/encrypt.rb message.txt encrypted.txt 080922</code></pre>
<li>Note the CLI message indicating encryption was successful.</li>
<pre><code>$ Created encrypted.txt at 09/08/2022 19:46 with the key 82648 and the date 80922.</code></pre>
<p><i>NoteThe program randomly generates a key since a key was not provided.</i></p>
<li>Open <b>encrypted.txt</b> inside the project and view the encrypted message.</li></ul>

<!-- CREDITS -->
<h2 id="credits"> :scroll: Credits</h2>
<h3>John Santosuosso</h3>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/johnsantosuosso)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/john-santosuosso)
