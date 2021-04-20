function recog(fn,fp)
clc;
disp('training SVM classifier1 with T1 vector features.........');
C = csvread('T1.csv');%textscan(fid,'%f%f%f%f%f%f%f%f%f%f%f%f%f%f','delimiter',',');  % Import data
data = C(:,1:38);%[C{1} C{2} C{3} C{4} C{5} C{6} C{7} C{8} C{9} C{10} C{11} C{12} C{13}]; % inputs to neural network
groups = ismember(C(:,39),1);
[train, test] = crossvalind('holdOut',groups);
cp = classperf(groups);
X = data;
y = C(:,39);
sigma = 0.1; c1 = 1;
svmStruct = svmtrain(X, y, 'kernel_function','rbf');%svmtrain(data(train,:),groups(train),'showplot',false,'boxconstraint',1e6);
disp('training completed using lBP features....');

disp('extracting test file features');
H = []; full = [];

%%% extract the test file features
   I = (imread(strcat(fp,fn)));
   if (size(I,3)>1)
      I = rgb2gray(I);
   end
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

%%%% test classify images
xx = H; 
data1 = xx(:,1:38);
classes = svmclassify(svmStruct,data1,'showplot',false);
disp(classes);

xx1 = full; 
data11 = xx1(:,1:13);
classes = svmclassify(svmStruct,data11,'showplot',false);
disp(classes);
