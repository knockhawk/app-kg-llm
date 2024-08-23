import streamlit as st
import numpy as np
from neo4j_utils import query_neo4j#, get_nearest_neighbors, store_embeddings
from llama_utils import get_llama_response

# Streamlit app layout
st.title("Chat with Your Data")

# Initialize chat history and state
if 'messages' not in st.session_state:
    st.session_state['messages'] = []

def add_message(role, content):
    st.session_state['messages'].append({"role": role, "content": content})

def conversational_chat(user_query):
    # Get relevant information from Neo4j
    neo4j_results = query_neo4j()
    
    # Generate embedding for the query
    query_embedding = np.random.rand(300)  # Replace with actual embedding
    
    # Find nearest neighbors
   # nearest_neighbors = get_nearest_neighbors(query_embedding)
    
    # Create prompt for Llama3
    prompt = f"Based on the following information:\n{neo4j_results}\n\nAnswer the following question:\n{user_query}"
    
    # Get response from Llama3
    llama_response = get_llama_response(prompt)
    
    return llama_response

# Containers for chat history and user input
response_container = st.container()
input_container = st.container()

with input_container:
    with st.form(key='my_form', clear_on_submit=True):
        user_query = st.text_input("You:", placeholder="Ask me something...", key='input')
        submit_button = st.form_submit_button(label='Send')

        if submit_button and user_query:
            # Process query and get response
            response = conversational_chat(user_query)
            
            # Add user and assistant messages to chat history
            add_message("user", user_query)
            add_message("assistant", response)
            
            # Clear input field by creating a new form
            st.experimental_rerun()

with response_container:
    if st.session_state['messages']:
        for message in st.session_state['messages']:
            role = message['role']
            content = message['content']
            if role == "user":
                st.chat_message(role).markdown(content)
            else:
                st.chat_message(role).markdown(content)
