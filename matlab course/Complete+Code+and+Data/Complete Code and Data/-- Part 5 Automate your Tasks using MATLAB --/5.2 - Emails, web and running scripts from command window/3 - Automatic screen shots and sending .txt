%%----- The screenshot.m contains the code below -------
%% ------------------- Importing Libraries --------------------------------

clear all 
import java.awt.Robot;
import java.awt.event.*;
robot = java.awt.Robot();

%% -------------------- Taking a ScreenShot -------------------------------
Screen_size = get(0,'screensize'); 
image = robot.createScreenCapture(java.awt.Rectangle(1, 1, Screen_size(3),Screen_size(4))); 

RGB_Image = image.getRGB(0,0,Screen_size(3), Screen_size(4),[],0,Screen_size(3));
RGB_Image = typecast(RGB_Image, 'uint8');
ss_image(:,:,1) = reshape(RGB_Image(3:4:end),Screen_size(3),Screen_size(4))';
ss_image(:,:,2) = reshape(RGB_Image(2:4:end),Screen_size(3),Screen_size(4))';
ss_image(:,:,3) = reshape(RGB_Image(1:4:end),Screen_size(3),Screen_size(4))';

imwrite(ss_image,'d:\ss_image.jpg');  


%% -------------------- Emailing the ScreenShot -----------------------------

setpref('Internet','SMTP_Server', 'smtp.gmail.com');
setpref('Internet','E_mail','nouman.azam@gmail.com');
setpref('Internet','SMTP_Username','nouman.azam@gmail.com');
setpref('Internet','SMTP_Password','mominaaayan1131');

props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.starttls.enable','true');

sendmail('nouman.azam@nu.edu.pk','Issue in MATLAB','I got this issue please have a look','D:\ss_image.jpg'); 

