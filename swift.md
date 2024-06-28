# Swift installation

# how to install swift on a ubuntu machine
			 
To find out which version of Ubuntu you are running, open a terminal and type the following command:
```bash
lsb_release -a
```
This command will display information about your Ubuntu distribution, including the version number.

To check how much disk space you have left on your Ubuntu machine, open a terminal and use the following command: `df -h`  
This command displays the amount of disk space used and available on all mounted filesystems, with sizes shown in human-readable format (e.g., in GB or MB).

If at school (42Berlin) it is better to use `sgoinfre` for downloading and extracting the Swift installation files, since I tried using `goinfre` and the installation disappeared! But I might have missed something there.

To download the Swift package to `/sgoinfre` using `curl`, you can use the following command:
```bash
curl -L https://download.swift.org/swift-5.10.1-release/ubuntu2204/swift-5.10.1-RELEASE/swift-5.10.1-RELEASE-ubuntu22.04.tar.gz -o /sgoinfre/goinfre/Perso/lbrusa/swift-5.10.1-RELEASE-ubuntu22.04.tar.gz
```
This command uses `curl` with the `-L` option to follow redirects and `-o` to specify the output file path. 

To continue your Swift installation after downloading the Swift package to `/sgoinfre` or any other directory:
- Navigate to the directory where you downloaded the Swift package.  Ex     
```bash
   cd /sgoinfre/goinfre/Perso/lbrusa/
```
- Extract the Swift package.  
```bash
   tar -xvzf swift-5.10.1-RELEASE-ubuntu22.04.tar.gz
```
- Add Swift to your PATH. Assuming you extracted Swift in `/sgoinfre/goinfre/perso/lbrusa`, you can add the following line to your `.bashrc` or `.zshrc` file:
```bash
   echo 'export PATH=/sgoinfre/goinfre/Perso/lbrusa/swift-5.10.1-RELEASE-ubuntu22.04/usr/bin:$PATH' >> ~/.bashrc
```
and in zsh:
```bash
   echo 'export PATH=/sgoinfre/goinfre/Perso/lbrusa/swift-5.10.1-RELEASE-ubuntu22.04/usr/bin:$PATH' >> ~/.zshrc
```
Then, apply the changes by running:
```bash
   source ~/.bashrc
   source ~/.zshrc
```
 
- Verify the installation by running:
```bash
   swift --version
```
This command should display the installed Swift version.

## Install Swift on macOS

Swift is included in Xcode and it will give you access to the apple frameworks to develop for macOS, iOS etc.

To install Swift on a Mac just install Xcode from the App Store. Swift is included in Xcode.  

If you do not like to install Xcode the best option is to install the command line tools
```bash
xcode-select --install
```
It gives access to tools like `swift`, `clang`, `git`, and others.


