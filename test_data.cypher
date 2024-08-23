// Create Insurance Providers
CREATE (p1:Provider {
    id: 'P1', 
    name: 'HealthCorp', 
    address: '123 Health St', 
    phone: '123-456-7890', 
    email: 'contact@healthcorp.com', 
    website: 'www.healthcorp.com'
})
CREATE (p2:Provider {
    id: 'P2', 
    name: 'WellCare', 
    address: '456 Wellness Ave', 
    phone: '987-654-3210', 
    email: 'info@wellcare.com', 
    website: 'www.wellcare.com'
})
CREATE (p3:Provider {
    id: 'P3', 
    name: 'MediClinic', 
    address: '789 Care Blvd', 
    phone: '555-678-1234', 
    email: 'support@mediclinic.com', 
    website: 'www.mediclinic.com'
})

// Create Patients
CREATE (pat1:Patient {
    id: 'PAT1', 
    name: 'John Doe', 
    dob: '1980-01-01', 
    gender: 'Male', 
    address: '789 Main St', 
    phone: '555-123-4567', 
    email: 'john.doe@example.com', 
    marital_status: 'Married', 
    occupation: 'Engineer'
})
CREATE (pat2:Patient {
    id: 'PAT2', 
    name: 'Jane Smith', 
    dob: '1990-02-15', 
    gender: 'Female', 
    address: '101 Elm St', 
    phone: '555-234-5678', 
    email: 'jane.smith@example.com', 
    marital_status: 'Single', 
    occupation: 'Teacher'
})
CREATE (pat3:Patient {
    id: 'PAT3', 
    name: 'Michael Johnson', 
    dob: '1975-03-22', 
    gender: 'Male', 
    address: '202 Maple St', 
    phone: '555-345-6789', 
    email: 'michael.johnson@example.com', 
    marital_status: 'Divorced', 
    occupation: 'Doctor'
})
CREATE (pat4:Patient {
    id: 'PAT4', 
    name: 'Emily Davis', 
    dob: '1985-04-10', 
    gender: 'Female', 
    address: '303 Oak St', 
    phone: '555-456-7890', 
    email: 'emily.davis@example.com', 
    marital_status: 'Widowed', 
    occupation: 'Nurse'
})
CREATE (pat5:Patient {
    id: 'PAT5', 
    name: 'Sarah Wilson', 
    dob: '1992-05-30', 
    gender: 'Female', 
    address: '404 Pine St', 
    phone: '555-567-8901', 
    email: 'sarah.wilson@example.com', 
    marital_status: 'Single', 
    occupation: 'Student'
})

// Create Dependents
CREATE (dep1:Dependent {
    id: 'DEP1', 
    name: 'Emily Doe', 
    dob: '2010-06-15', 
    relationship: 'Daughter', 
    address: '789 Main St', 
    phone: '555-678-9012'
})
CREATE (dep2:Dependent {
    id: 'DEP2', 
    name: 'Anna Doe', 
    dob: '2015-11-20', 
    relationship: 'Daughter', 
    address: '789 Main St', 
    phone: '555-678-9013'
})
CREATE (dep3:Dependent {
    id: 'DEP3', 
    name: 'Sophia Johnson', 
    dob: '2005-07-25', 
    relationship: 'Daughter', 
    address: '202 Maple St', 
    phone: '555-789-0123'
})
CREATE (dep4:Dependent {
    id: 'DEP4', 
    name: 'Lily Johnson', 
    dob: '2008-09-10', 
    relationship: 'Daughter', 
    address: '202 Maple St', 
    phone: '555-789-0124'
})
CREATE (dep5:Dependent {
    id: 'DEP5', 
    name: 'Lisa Wilson', 
    dob: '2011-12-05', 
    relationship: 'Daughter', 
    address: '404 Pine St', 
    phone: '555-890-1234'
})

CREATE (spouse1:Dependent {
    id: 'S1', 
    name: 'Jane Doe', 
    dob: '1982-04-20', 
    relationship: 'Spouse', 
    address: '789 Main St', 
    phone: '555-345-6780'
})
CREATE (spouse2:Dependent {
    id: 'S2', 
    name: 'Anna Johnson', 
    dob: '1978-03-10', 
    relationship: 'Spouse', 
    address: '202 Maple St', 
    phone: '555-234-5679'
})

// Create Insurances
CREATE (ins1:Insurance {
    id: 'INS1', 
    company: 'HealthCorp', 
    policy_number: 'H12345', 
    coverage_type: 'Comprehensive', 
    start_date: '2023-01-01', 
    end_date: '2023-12-31', 
    premium: 1200.00
})
CREATE (ins2:Insurance {
    id: 'INS2', 
    company: 'WellCare', 
    policy_number: 'W67890', 
    coverage_type: 'Basic', 
    start_date: '2023-06-01', 
    end_date: '2024-05-31', 
    premium: 800.00
})
CREATE (ins3:Insurance {
    id: 'INS3', 
    company: 'MediPlan', 
    policy_number: 'M11223', 
    coverage_type: 'Extended', 
    start_date: '2023-03-15', 
    end_date: '2024-03-14', 
    premium: 1500.00
})

// Create Claims
CREATE (claim1:Claim {
    id: 'CLM1', 
    date: '2024-01-15', 
    amount: 1500.00, 
    status: 'Approved', 
    service_date: '2024-01-10', 
    description: 'Surgery for knee replacement', 
    diagnosis_code: 'K01', 
    treatment_code: 'T01'
})
CREATE (claim2:Claim {
    id: 'CLM2', 
    date: '2024-02-20', 
    amount: 500.00, 
    status: 'Pending', 
    service_date: '2024-02-15', 
    description: 'Routine check-up', 
    diagnosis_code: 'A01', 
    treatment_code: 'T02'
})
CREATE (claim3:Claim {
    id: 'CLM3', 
    date: '2024-03-25', 
    amount: 1200.00, 
    status: 'Rejected', 
    service_date: '2024-03-20', 
    description: 'Emergency room visit', 
    diagnosis_code: 'E01', 
    treatment_code: 'T03'
})
CREATE (claim4:Claim {
    id: 'CLM4', 
    date: '2024-04-10', 
    amount: 300.00, 
    status: 'Approved', 
    service_date: '2024-04-05', 
    description: 'Blood tests and lab work', 
    diagnosis_code: 'B01', 
    treatment_code: 'T04'
})
CREATE (claim5:Claim {
    id: 'CLM5', 
    date: '2024-05-05', 
    amount: 600.00, 
    status: 'Pending', 
    service_date: '2024-05-01', 
    description: 'Dental cleaning', 
    diagnosis_code: 'D01', 
    treatment_code: 'T05'
})

// Create Relationships

// Patient - Insurance relationships
CREATE (pat1)-[:HAS_INSURANCE]->(ins1)
CREATE (pat2)-[:HAS_INSURANCE]->(ins2)
CREATE (pat3)-[:HAS_INSURANCE]->(ins3)
CREATE (pat4)-[:HAS_INSURANCE]->(ins1)
CREATE (pat5)-[:HAS_INSURANCE]->(ins2)

// Claim - Insurance relationships
CREATE (claim1)-[:COVERED_BY]->(ins1)
CREATE (claim2)-[:COVERED_BY]->(ins2)
CREATE (claim3)-[:COVERED_BY]->(ins3)
CREATE (claim4)-[:COVERED_BY]->(ins1)
CREATE (claim5)-[:COVERED_BY]->(ins2)

// Patient - Claim relationships
CREATE (pat1)-[:HAS_CLAIM]->(claim1)
CREATE (pat2)-[:HAS_CLAIM]->(claim2)
CREATE (pat3)-[:HAS_CLAIM]->(claim3)
CREATE (pat4)-[:HAS_CLAIM]->(claim4)
CREATE (pat5)-[:HAS_CLAIM]->(claim5)

// Patient - Dependent relationships
CREATE (pat1)-[:HAS_DEPENDENT]->(dep1)
CREATE (pat1)-[:HAS_DEPENDENT]->(dep2)
CREATE (pat3)-[:HAS_DEPENDENT]->(dep3)
CREATE (pat3)-[:HAS_DEPENDENT]->(dep4)
CREATE (pat5)-[:HAS_DEPENDENT]->(dep5)

// Spouse Relationships
CREATE (pat1)-[:MARRIED_TO]->(spouse1)
CREATE (pat3)-[:MARRIED_TO]->(spouse2)

