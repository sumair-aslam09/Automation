# # Create a file and write some text to it
with open("/root/sample.txt", "w") as file:
    file.write("This is a sample text file.")

# Read the contents of the file
with open("/root/sample.txt", "r") as file:
    content = file.read()

print("File Contents:", content)
