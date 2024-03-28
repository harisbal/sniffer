import btmgmt

response = btmgmt.command_str("find")

exit_code, stdout_string = response
print(stdout_string)
