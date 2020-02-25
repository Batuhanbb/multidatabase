#### Trigger-1  ####
delimiter //
create trigger contacts_after_graduated
             after insert
             on USER for each row
             begin
           
                 IF (SELECT UserType from user where ArrivalDate in(select max(ArrivalDate) from User))='G'
                 THEN 
                INSERT into Graduated
                ( UserID,
                Created_date
                  )
                VALUES
                ( NEW.UserID,
                sysdate()
                
                  );
                   END IF;
             END; //
             
             
#### Trigger-2 ####             
delimiter //
create trigger contacts_after_student
             after insert
             on USER for each row
             begin
           
                 IF (SELECT UserType from user where ArrivalDate in(select max(ArrivalDate) from User))='S'
                 THEN 
                INSERT into Student
                ( UserID,
                  
                  Created_date)
                VALUES
                ( NEW.UserID,
                  sysdate()
                  );
                   END IF;
             END; //
             
#### Trigger-3 ####
delimiter //
create trigger contacts_after_assistant
             after insert
             on USER for each row
             begin
           
                 IF (SELECT UserType from user where ArrivalDate in(select max(ArrivalDate) from User))='A'
                 THEN 
                INSERT into Assistant
                ( UserID,
                  
                  Created_date)
                VALUES
                ( NEW.UserID,
                  sysdate()
                  );
                   END IF;
             END; //
             
#### Trigger-4 ####             
delimiter //
create trigger contacts_after_teacher
             after insert
             on USER for each row
             begin
				IF (SELECT UserType from user where ArrivalDate in(select max(ArrivalDate) from User))='T'
                 THEN 
                INSERT into Teacher
                ( UserID,
                  
                  Created_date)
                VALUES
                ( NEW.UserID,
                  sysdate()
                  );
                   END IF;
             END; //
        
 #### Trigger-5 ####  
delimiter //
CREATE TRIGGER graduated_update
    BEFORE UPDATE
    ON Graduated FOR EACH ROW
BEGIN
 
    INSERT INTO educationtaker(EducationTakerID) Values(new.EducationTakerID);
 END; // 


#### Trigger-6 ####
delimiter //
CREATE TRIGGER student_update
    BEFORE UPDATE
    ON Student FOR EACH ROW
BEGIN
 
    INSERT INTO educationtaker(EducationTakerID) Values(new.EducationTakerID);
 END; // 
 
 
 #### Trigger-7 #### 
 delimiter //
CREATE TRIGGER teacher_update
    BEFORE UPDATE
    ON Teacher FOR EACH ROW
BEGIN
 
    INSERT INTO instructor(InstructorID) Values(new.InstructorID);
 END; // 

#### Trigger-8 ####
 delimiter //
CREATE TRIGGER assistant_update
    BEFORE UPDATE
    ON Assistant FOR EACH ROW
BEGIN
 
    INSERT INTO instructor(InstructorID) Values(new.InstructorID);
 END; //       
 
 delimiter //
 
 #### Trigger-9 #### 
CREATE TRIGGER user_profile
    AFTER INSERT
    ON user FOR EACH ROW
BEGIN
 
    INSERT INTO Profile(PUserID) Values(new.UserID);
 END; //   



 
