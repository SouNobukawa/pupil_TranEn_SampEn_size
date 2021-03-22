td_result=importdata('TD_result.txt');

td_Baseline=td_result.data(4,:);

td_flag=zeros(size(td_Baseline,2),1);

adhd_result=importdata('ADHD_result_naive.txt');

adhd_Baseline=adhd_result.data(4,:);

adhd_flag=ones(size(adhd_Baseline,2),1);


flag=[td_flag; adhd_flag];

flag=logical(flag);

%flag=(1:38)'>19;

baseline=[td_Baseline'; adhd_Baseline'];


mdl = fitglm(baseline,flag,'Distribution','binomial','Link','logit');


for i=1:1:sum(flag==0)
    class_name{i}='TD';
end

for i=1+sum(flag==0):1:sum(flag==1)+sum(flag==0)
    class_name{i}='ADHD';
end

class_name=class_name';


scores = mdl.Fitted.Probability;
[base_X,base_Y,base_T,base_AUC] = perfcurve(class_name(1:end,:),scores,'ADHD');



%%%%%%



td_result=importdata('TD_result.txt');

td_Baseline=td_result.data(2,:);

td_flag=zeros(size(td_Baseline,2),1);

adhd_result=importdata('ADHD_result_naive.txt');

adhd_Baseline=adhd_result.data(2,:);

adhd_flag=ones(size(adhd_Baseline,2),1);


flag=[td_flag; adhd_flag];

flag=logical(flag);

%flag=(1:38)'>19;

baseline=[td_Baseline'; adhd_Baseline'];


mdl = fitglm(baseline,flag,'Distribution','binomial','Link','logit');


for i=1:1:sum(flag==0)
    class_name{i}='TD';
end

for i=1+sum(flag==0):1:sum(flag==1)+sum(flag==0)
    class_name{i}='ADHD';
end

class_name=class_name';


scores = mdl.Fitted.Probability;
[TE_X,TE_Y,TE_T,TE_AUC] = perfcurve(class_name(1:end,:),scores,'ADHD');




%%%%%%



td_result=importdata('TD_result.txt');

td_Baseline=td_result.data(3,:);

td_flag=zeros(size(td_Baseline,2),1);

adhd_result=importdata('ADHD_result_naive.txt');

adhd_Baseline=adhd_result.data(3,:);

adhd_flag=ones(size(adhd_Baseline,2),1);


flag=[td_flag; adhd_flag];

flag=logical(flag);

%flag=(1:38)'>19;

baseline=[td_Baseline'; adhd_Baseline'];


mdl = fitglm(baseline,flag,'Distribution','binomial','Link','logit');


for i=1:1:sum(flag==0)
    class_name{i}='TD';
end

for i=1+sum(flag==0):1:sum(flag==1)+sum(flag==0)
    class_name{i}='ADHD';
end

class_name=class_name';


scores = mdl.Fitted.Probability;
[SampEn_X,SampEn_Y,SampEn_T,SampEn_AUC] = perfcurve(class_name(1:end,:),scores,'ADHD');


% For TE + Base line 

td_result=importdata('TD_result.txt');

td_Baseline=td_result.data([1 4],:);

td_flag=zeros(size(td_Baseline,2),1);

adhd_result=importdata('ADHD_result_naive.txt');

adhd_Baseline=adhd_result.data([1 4],:);

adhd_flag=ones(size(adhd_Baseline,2),1);


flag=[td_flag; adhd_flag];

flag=logical(flag);

%flag=(1:38)'>19;

baseline=[td_Baseline'; adhd_Baseline'];


mdl = fitglm(baseline,flag,'Distribution','binomial','Link','logit');


for i=1:1:sum(flag==0)
    class_name{i}='TD';
end

for i=1+sum(flag==0):1:sum(flag==1)+sum(flag==0)
    class_name{i}='ADHD';
end

class_name=class_name';


scores = mdl.Fitted.Probability;
[TE_Baseline_X,TE_Baseline_Y,TE_Baseline_T,TE_Baseline_AUC] = perfcurve(class_name(1:end,:),scores,'ADHD');



%%%


% For SampEn + Base line

td_result=importdata('TD_result.txt');

td_Baseline=td_result.data([3 4],:);

td_flag=zeros(size(td_Baseline,2),1);

adhd_result=importdata('ADHD_result_naive.txt');

adhd_Baseline=adhd_result.data([3 4],:);

adhd_flag=ones(size(adhd_Baseline,2),1);


flag=[td_flag; adhd_flag];

flag=logical(flag);

%flag=(1:38)'>19;

baseline=[td_Baseline'; adhd_Baseline'];


mdl = fitglm(baseline,flag,'Distribution','binomial','Link','logit');


for i=1:1:sum(flag==0)
    class_name{i}='TD';
end

for i=1+sum(flag==0):1:sum(flag==1)+sum(flag==0)
    class_name{i}='ADHD';
end

class_name=class_name';


scores = mdl.Fitted.Probability;
[SampEn_Baseline_X,SampEn_Baseline_Y,SampEn_Baseline_T,SampEn_Baseline_AUC] = perfcurve(class_name(1:end,:),scores,'ADHD');


subplot(1,2,1);

plot(base_X,base_Y,'k','Linewidth',2);

hold on;

grid on;

pbaspect([1 1 1]);

plot(SampEn_X,SampEn_Y,'r','Linewidth',2);


plot(TE_X,TE_Y,'c','Linewidth',2);



xlabel('False positive rate');

ylabel('True positive rate');

xticks([0 0.2 0.4 0.6 0.8 1.0]);
yticks([0 0.2 0.4 0.6 0.8 1.0]);

legend('Size (AUC=0.81)','SampEn (AUC=0.83)','TranEn (AUC=0.77)','Location','SouthEast');


subplot(1,2,2);


hold on;

grid on;

pbaspect([1 1 1]);


plot(SampEn_Baseline_X,SampEn_Baseline_Y,'r','Linewidth',2);

plot(TE_Baseline_X,TE_Baseline_Y,'c','Linewidth',2);


xlabel('False positive rate');

ylabel('True positive rate');

xticks([0 0.2 0.4 0.6 0.8 1.0]);
yticks([0 0.2 0.4 0.6 0.8 1.0]);


legend('Size and SampEn (AUC=0.87)','Size and TranEn (AUC=0.83)','Location','SouthEast');
