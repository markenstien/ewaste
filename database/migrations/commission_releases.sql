create table commission_releases(
    id int(10) not null PRIMARY key AUTO_INCREMENT,
    user_id int(10) not null,
    status enum('pending','approved','declined'),
    amount decimal(10,2),
    created_at timestamp DEFAULT now(),
    updated_at timestamp ON UPDATE now()
);