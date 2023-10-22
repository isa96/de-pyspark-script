import subprocess

# Specify the path to your shell script file
shell_script_path = 'download_taxi_data.sh'

# Run the shell script
subprocess.run(['sh', shell_script_path])
