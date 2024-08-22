CREATE DATABASE IF NOT EXISTS goood_health_well_being;
Use good_health_well_being;

CREATE TABLE Patients (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    location VARCHAR(100)
);

CREATE TABLE Healthcare_Providers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    specialty VARCHAR(100)
);

CREATE TABLE Diseases (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

CREATE TABLE Treatments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    disease_id INT,
    treatment_name VARCHAR(100),
    FOREIGN KEY (disease_id) REFERENCES Diseases(id)
);

CREATE TABLE Appointments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    provider_id INT,
    date DATE,
    treatment_id INT,
    FOREIGN KEY (patient_id) REFERENCES Patients(id),
    FOREIGN KEY (provider_id) REFERENCES Healthcare_Providers(id),
    FOREIGN KEY (treatment_id) REFERENCES Treatments(id)
);
INSERT INTO Patients (name, age, location) VALUES ('John Doe', 30, 'New York');
INSERT INTO Healthcare_Providers (name, specialty) VALUES ('Dr. Smith', 'Cardiology');
INSERT INTO Diseases (name) VALUES ('Hypertension');
INSERT INTO Treatments (disease_id, treatment_name) VALUES (1, 'Medication A');
INSERT INTO Appointments (patient_id, provider_id, date, treatment_id) VALUES (1, 1, '2024-08-25', 1);
SELECT * FROM Appointments WHERE patient_id = 1;
SELECT Diseases.name AS Disease, Treatments.treatment_name AS Treatment
FROM Diseases
JOIN Treatments ON Diseases.id = Treatments.disease_id;
SELECT Healthcare_Providers.name, COUNT(Appointments.id) AS NumberOfAppointments
FROM Healthcare_Providers
JOIN Appointments ON Healthcare_Providers.id = Appointments.provider_id
GROUP BY Healthcare_Providers.name;
SELECT AVG(age) AS AverageAge
FROM Patients
JOIN Appointments ON Patients.id = Appointments.patient_id;
