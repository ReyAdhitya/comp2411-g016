use g_16test;
CREATE TABLE Patient (
    patient_id INT AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    phone_number VARCHAR(20),
    email VARCHAR(100) NOT NULL,

    CONSTRAINT pk_patient
        PRIMARY KEY (patient_id),

    CONSTRAINT uq_patient_email
        UNIQUE (email),


    CONSTRAINT chk_patient_first_name
        CHECK (TRIM(first_name) <> ''),

    CONSTRAINT chk_patient_last_name
        CHECK (TRIM(last_name) <> '')
) ENGINE = InnoDB;

CREATE TABLE SessionType (
    type_id INT AUTO_INCREMENT,
    type_name VARCHAR(100) NOT NULL,

    CONSTRAINT pk_sessiontype
        PRIMARY KEY (type_id),

    CONSTRAINT uq_sessiontype_name
        UNIQUE (type_name),


    CONSTRAINT chk_sessiontype_name
        CHECK (TRIM(type_name) <> '')
) ENGINE = InnoDB;

CREATE TABLE HealthSession (
    session_id INT AUTO_INCREMENT,
    type_id INT NOT NULL,
    session_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    capacity INT NOT NULL,

    CONSTRAINT pk_healthsession
        PRIMARY KEY (session_id),

    CONSTRAINT fk_healthsession_type
        FOREIGN KEY (type_id)
        REFERENCES SessionType(type_id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,

    CONSTRAINT chk_healthsession_capacity
        CHECK (capacity >= 1),

    CONSTRAINT chk_healthsession_time
        CHECK (end_time > start_time)
) ENGINE = InnoDB;

CREATE TABLE Booking (
    booking_id INT AUTO_INCREMENT,
    patient_id INT NOT NULL,
    session_id INT NOT NULL,

    status ENUM(
        'Confirmed',
        'Waitlisted',
        'Cancelled',
        'Completed'
    ) NOT NULL,

    requested_at DATETIME NOT NULL
        DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_booking
        PRIMARY KEY (booking_id),

    CONSTRAINT fk_booking_patient
        FOREIGN KEY (patient_id)
        REFERENCES Patient(patient_id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,

    CONSTRAINT fk_booking_session
        FOREIGN KEY (session_id)
        REFERENCES HealthSession(session_id)
        ON DELETE RESTRICT
        ON UPDATE restrict
        
) ENGINE = InnoDB;

