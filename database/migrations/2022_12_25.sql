alter table users 
    add column verifier_application_status enum('pending','approved','declined');