% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% About MainCode.m : This file is a MATLAB M-file.        %%%%%%%%%%%%%%%%                       
% It runs in Matlab software of Mathworks                 %%%%%%%%%%%%%%%%
% ''''''''''''''''''''''''''''''''''''''''''''''''''''''''%%%%%%%%%%%%%%%%
% Project Description: Presented here is a code to generate certificates  
% for workshops, conferences, symposium etc. 
% The same can be extended to generate reports for large data sets. 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Group members Name
%>>>>Syed Zulfiqar Ali
%>>>>Syed Hasnat Ali
%>>>>Anees Javaid
%>>>>Afzal Ameen
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc % Clear command window.
clear all %Clear variables and functions from memory
close all % closes all the open figure windows
home % Send the cursor home

filename = 'Registration_Details.xls';
[num,txt] = xlsread(filename)
% Read Excel sheet containing details. Text is read from the file
% seperately from numbers


len=length(txt)
% obtain length of text in excel or number of certificates to be generated
% This code provides scalability

blankimage = imread('pic.png');
% Read blank certificate image

for i=2:len
    for j= 2:2 
        text_names(i,j)=txt(i,j)
    end
end
% Obtain names from the txt variable which are in 2nd column

for i=2:len
    for j= 3:3
      text_topic(i,j)=txt(i,j)
    end
end
% Obtain topics from the txt variable which are in 3rd column


%Ignore first row which is heading
for i=2:len
        text_all=[text_names(i,2) text_topic(i,3)]
        % combine names and topics
        
        position = [600 500;600 850];  %First For X- Axis  second for Y-Axis     
        % obtain positions to insert on image, MSPaint or any image editor
        
        RGB = insertText(blankimage,position,text_all,'FontSize',30,'BoxOpacity',0);
        %Provide parameters for function insertText
        %Font size is 22 and opacity of box is 0 means 100% transparent
        
        figure
        imshow(RGB)        
        %Obtain and display figure in color
        
        y=i-1
        filename=['Certificate_Topic_' num2str(y)]
        lastf=[filename '.png']
        saveas(gcf,lastf)
        % generate and save files with .tif extension
end    

% Code works for any length of data ROWWISE AND COLUMNWISE
