from neo4j import GraphDatabase
import numpy as np
from scipy.spatial.distance import cosine

NEO4J_URI = "bolt://localhost:7687"
NEO4J_USER = "llm"
NEO4J_PASSWORD = "TestLLMNeo4j"

# Initialize Neo4j driver
driver = GraphDatabase.driver(NEO4J_URI, auth=(NEO4J_USER, NEO4J_PASSWORD))

def query_neo4j():
    query = """
    MATCH (pat:Patient)
OPTIONAL MATCH (pat)-[hasDiagnosis:HAS_DIAGNOSIS]->(dx:Diagnosis)
OPTIONAL MATCH (pat)-[hasPrescription:HAS_PRESCRIPTION]->(rx:Prescription)
OPTIONAL MATCH (pat)-[hasLabTest:HAS_LAB_TEST]->(lab:LabTest)
OPTIONAL MATCH (pat)-[hasInsurance:HAS_INSURANCE]->(ins:Insurance)
OPTIONAL MATCH (pat)-[hasDependent:HAS_DEPENDENT]->(dep:Dependent)
OPTIONAL MATCH (pat)-[marriedTo:MARRIED_TO]->(spouse:Dependent)
OPTIONAL MATCH (claim:Claim)-[:COVERED_BY]->(ins)
OPTIONAL MATCH (pat)-[madeClaim:MADE_CLAIM]->(claim)
RETURN 
    pat.name AS patient_name, 
    pat.dob AS patient_dob,
    pat.gender AS patient_gender,
    pat.address AS patient_address,
    pat.phone AS patient_phone,
    pat.email AS patient_email,
    pat.marital_status AS patient_marital_status,
    pat.occupation AS patient_occupation,
    ins.company AS insurance_company,
    ins.policy_number AS insurance_policy_number,
    ins.coverage_type AS insurance_coverage_type,
    ins.start_date AS insurance_start_date,
    ins.end_date AS insurance_end_date,
    ins.premium AS insurance_premium,
    dx.code AS diagnosis_code, 
    dx.description AS diagnosis_description, 
    rx.drug_name AS prescription_drug_name, 
    rx.dosage AS prescription_dosage, 
    rx.frequency AS prescription_frequency, 
    lab.test_name AS lab_test_name, 
    lab.result AS lab_test_result, 
    lab.date AS lab_test_date,
    claim.date AS claim_date,
    claim.amount AS claim_amount,
    claim.status AS claim_status,
    claim.service_date AS claim_service_date,
    claim.description AS claim_description,
    dep.name AS dependent_name,
    dep.dob AS dependent_dob,
    dep.relationship AS dependent_relationship,
    spouse.name AS spouse_name,
    spouse.dob AS spouse_dob,
    spouse.relationship AS spouse_relationship
    LIMIT 100

    """
    with driver.session() as session:
        result = session.run(query)
        return [record for record in result]

# def get_nearest_neighbors(query_embedding, top_k=5):
#     query = """
#     MATCH (n)
#     RETURN ID(n) AS node_id, n.embedding AS embedding
#     """
#     with driver.session() as session:
#         result = session.run(query)
#         nodes = list(result)
        
#         # Compute similarities
#         similarities = []
#         for node in nodes:
#             node_embedding = node.get('embedding')
#             if node_embedding is None:
#                 continue  # Skip if embedding is missing
#             node_embedding = np.array(node_embedding)
#             if node_embedding.ndim != 1:
#                 continue  # Skip if embedding is not 1-D
#             sim = 1 - cosine(query_embedding, node_embedding)
#             similarities.append((node['node_id'], sim))
        
#         # Sort and get top_k results
#         similarities.sort(key=lambda x: x[1], reverse=True)
#         return similarities[:top_k]

# def store_embeddings(node_id, embedding):
    query = """
    MATCH (n)
    WHERE ID(n) = $node_id
    SET n.embedding = $embedding
    """
    with driver.session() as session:
        session.run(query, node_id=node_id, embedding=embedding.tolist())

print(query_neo4j())
