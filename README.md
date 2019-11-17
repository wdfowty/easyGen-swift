# easyGen-swift
Simple and secure password generator using <a href=https://github.com/jedisct1/swift-sodium>swift-sodium</a><br>
because iCloud Keychain suggestions are broken/unreliable<br>
<br>
ported from/heavily inspired by <a href=https://www.codeproject.com/Articles/1215534/Random-Password-Generator-an-Example>https://www.codeproject.com/Articles/1215534/Random-Password-Generator-an-Example</a><br>

# To Build<br>
install libsodium<br>
	brew install libsodium<br>
<br>
add sodium.h to header search paths<br>
<br>
add https://github.com/jedisct1/swift-sodium as swift package<br>
<br>
profit<br>

# Known Issues
no way to copy password, so useless atm lol
