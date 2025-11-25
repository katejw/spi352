# code taken from Bowen et. al
from openai import OpenAI

def load_api_key(file_path):
  with open(file_path, 'r') as f:
    return f.read().strip()

clients = {
  'openai': {
    'client': OpenAI(api_key=how toload_api_key('api_keys/openai.txt')), #figure out the key/look into AI sandbox through school?
  'params': {
    'model': "gpt-4-0125-preview",
    'temperature': 0.0,
    'max_tokens': 20,
    'seed': 42,
    'messages': [{"role": "user", "content": None}], # Placeholder
  },
  'response_unpack': lambda response: (
    response.choices[0].message.content,
    response.system_fingerprint,
    response.usage.prompt_tokens,
    response.usage.completion_tokens
  )
}

def get_api_response(client_name, text, **kwargs):
client_info = clients[client_name]
client = client_info['client']
params = client_info['params'].copy()
params.update(kwargs)
params['messages'][0]['content'] = text
response = client.chat.completions.create(**params)
return client_info['response_unpack'](response)
