import ollama
def get_llama_response(prompt):
    headers = {
        'Content-Type': 'application/json',
    }
 
    response = ollama.generate(model="llama3", prompt=prompt, stream=True)
    
    data = ""
    for chunk in response:
        data += chunk.get("response", "")
    
    return data.strip() if data else "No response generated from the model."
