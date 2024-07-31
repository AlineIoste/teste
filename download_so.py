import requests

url = "https://github.com/AlineIoste/teste/raw/main/SynapseControl.cpython-38-x86_64-linux-gnu.so"
output_path = "/usr/local/lib/python3.10/site-packages/SynapseControl.cpython-38-x86_64-linux-gnu.so"

response = requests.get(url)
with open(output_path, 'wb') as f:
    f.write(response.content)

print(f"Downloaded {url} to {output_path}")
