data = thingSpeakRead(748297,'ReadKey','UUWV7AEUZKBC6727');
depth_of_cut = data(1,2);
speed = data(1,1);
x = abs(data(1,3));
y = abs(data(1,4));
z = abs(data(1,5));
temperature = data(1,6);
max_accl = max([x,y,z]);
min_accl = min([x,y,z]);
if(speed==500)
    max_vibration = 352.45*sqrt(max_accl);
    min_vibration = 352.45*sqrt(min_accl);
elseif (speed==1000)
    max_vibration = 376.82*sqrt(max_accl);
    min_vibration = 376.82*sqrt(min_accl);
elseif (speed==1500)
    max_vibration = 407*sqrt(max_accl);
    min_vibration = 407*sqrt(min_accl);
end
t = table(depth_of_cut,max_vibration,min_vibration,speed,temperature,'VariableNames',{'DEPTHOFCUT','MAXVIBRATION','MINVIBRATION','SPEED','TEMPERATURE',});
label = trainedModel.predictFcn(t);
if(label==0)
    status="Wear";
elseif(label==1)
    status="Not Wear";
end
t_predicted = table(depth_of_cut,max_vibration,min_vibration,speed,temperature,status,'VariableNames',{'DEPTHOFCUT','MAXVIBRATION','MINVIBRATION','SPEED','TEMPERATURE','PREDICTED_LABEL'});
disp(t_predicted)
