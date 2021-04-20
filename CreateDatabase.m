function CreateDatabase(TrainDatabasePath)

TrainFiles = dir(TrainDatabasePath);

Train_Number = 0;

for i = 1:size(TrainFiles,1)
    %if not(strcmp(TrainFiles(i).name,'.')|strcmp(TrainFiles(i).name,'..')|strcmp(TrainFiles(i).name,'Thumbs.db'))
        Train_Number = Train_Number + 1; % Number of all images in the training database
    %end
end
G = [];
H = [];
full = [];

for i = 1 : Train_Number
    %%%%%%%%%%% Extract GLCM features
    if not(strcmp(TrainFiles(i).name,'.')|strcmp(TrainFiles(i).name,'..')|strcmp(TrainFiles(i).name,'Thumbs.db'))
        disp(TrainFiles(i).name);
        I = (imread(strcat('./sample/',TrainFiles(i).name)));
      if (size(I,3)>1)
        I = rgb2gray(imread(strcat('./sample/',TrainFiles(i).name)));
      end
       %%%%%%%% extract LBP features
       I2=imrotate(I,90);
       mapping=getmaplbphf(8);
       h=lbp(I,1,8,mapping,'h');
       h=h/sum(h);
       histograms(1,:)=h;
       h=lbp(I2,1,8,mapping,'h');
       h=h/sum(h);
       histograms(2,:)=h;
       lbp_hf_features=constructhf(histograms,mapping);
       full = [full ; lbp_hf_features(1,:)];
    end
end
csvwrite('lbp.csv',full);


