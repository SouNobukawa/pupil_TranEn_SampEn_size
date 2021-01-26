

maxiter=100;
size_sur_data=10;

m=2;
r=0.2;
factor=500;
Fs=300;
subject_num=20;
%subject_num=11;
%subject_num=23;
%subject_num=16;

tau=10;
emb_dim=5;


Baseline_file_names={'../data_TD_chose/Baseline_TD1.mat',...
                    '../data_TD_chose/Baseline_TD2.mat',...
                    '../data_TD_chose/Baseline_TD3.mat',...
                    '../data_TD_chose/Baseline_TD4.mat',...
                    '../data_TD_chose/Baseline_TD5.mat',...
                    '../data_TD_chose/Baseline_TD6.mat',...
                    '../data_TD_chose/Baseline_TD7.mat',...
                    '../data_TD_chose/Baseline_TD9.mat',...
                    '../data_TD_chose/Baseline_TD10.mat',...
                    '../data_TD_chose/Baseline_TD11.mat',...
                    '../data_TD_chose/Baseline_TD12.mat',...
                    '../data_TD_chose/Baseline_TD13.mat',...
                    '../data_TD_chose/Baseline_TD14.mat',...
                    '../data_TD_chose/Baseline_TD17.mat',...
                    '../data_TD_chose/Baseline_TD18.mat',...
                    '../data_TD_chose/Baseline_TD19.mat',...
                    '../data_TD_chose/Baseline_TD20.mat',...
                    '../data_TD_chose/Baseline_TD21.mat',...
                    '../data_TD_chose/Baseline_TD22.mat',...
                    '../data_TD_chose/Baseline_TD23.mat',...
                    }


%{
Baseline_file_names={'../data_TD/Baseline_TD1.mat',...
                    '../data_TD/Baseline_TD2.mat',...
                    '../data_TD/Baseline_TD3.mat',...
                    '../data_TD/Baseline_TD4.mat',...
                    '../data_TD/Baseline_TD5.mat',...
                    '../data_TD/Baseline_TD6.mat',...
                    '../data_TD/Baseline_TD7.mat',...
                    '../data_TD/Baseline_TD8.mat',...
                    '../data_TD/Baseline_TD9.mat',...
                    '../data_TD/Baseline_TD10.mat',...
                    '../data_TD/Baseline_TD11.mat',...
                    '../data_TD/Baseline_TD12.mat',...
                    '../data_TD/Baseline_TD13.mat',...
                    '../data_TD/Baseline_TD14.mat',...
                    '../data_TD/Baseline_TD15.mat',...
                    '../data_TD/Baseline_TD16.mat',...
                    '../data_TD/Baseline_TD17.mat',...
                    '../data_TD/Baseline_TD18.mat',...
                    '../data_TD/Baseline_TD19.mat',...
                    '../data_TD/Baseline_TD20.mat',...
                    '../data_TD/Baseline_TD21.mat',...
                    '../data_TD/Baseline_TD22.mat',...
                    '../data_TD/Baseline_TD23.mat',...
                    }

%}
%{
Baseline_file_names={'../data_TD/Baseline_TD2.mat',...
                    '../data_TD/Baseline_TD6.mat',...
                    '../data_TD/Baseline_TD7.mat',...
                    '../data_TD/Baseline_TD9.mat',...
                    '../data_TD/Baseline_TD12.mat',...
                    '../data_TD/Baseline_TD17.mat',...
                    '../data_TD/Baseline_TD19.mat',...
                    '../data_TD/Baseline_TD21.mat',...
                    '../data_TD/Baseline_TD23.mat',...
                    }
%}
%{

Baseline_file_names={'../data_ADHD/Baseline_ADHD1.mat',...
                     '../data_ADHD/Baseline_ADHD2.mat',...
                     '../data_ADHD/Baseline_ADHD4.mat',...
                     '../data_ADHD/Baseline_ADHD5.mat',...
                     '../data_ADHD/Baseline_ADHD6.mat',...
                     '../data_ADHD/Baseline_ADHD10.mat',...
                     '../data_ADHD/Baseline_ADHD12.mat',...
                     '../data_ADHD/Baseline_ADHD13.mat',...
                     '../data_ADHD/Baseline_ADHD15.mat',...
                     '../data_ADHD/Baseline_ADHD16.mat',...
                     '../data_ADHD/Baseline_ADHD17.mat'...
                    }
%}

%{
Baseline_file_names={'../data_ADHD/Baseline_ADHD1.mat',...
                     '../data_ADHD/Baseline_ADHD2.mat',...
                    '../data_ADHD/Baseline_ADHD3.mat',...
                     '../data_ADHD/Baseline_ADHD4.mat',...
                     '../data_ADHD/Baseline_ADHD5.mat',...
                     '../data_ADHD/Baseline_ADHD6.mat',...
                    '../data_ADHD/Baseline_ADHD7.mat',...
                    '../data_ADHD/Baseline_ADHD8.mat',...
                    '../data_ADHD/Baseline_ADHD9.mat',...
                     '../data_ADHD/Baseline_ADHD10.mat',...
                    '../data_ADHD/Baseline_ADHD11.mat',...
                     '../data_ADHD/Baseline_ADHD12.mat',...
                     '../data_ADHD/Baseline_ADHD13.mat',...
                     '../data_ADHD/Baseline_ADHD15.mat',...
                     '../data_ADHD/Baseline_ADHD16.mat',...
                     '../data_ADHD/Baseline_ADHD17.mat'...
                    }
%}
addpath("../HERMES_lib/tim-matlab-1.2.0/");
%{
save_file_names={'data_TD1.eps','data_TD2.eps','data_TD3.eps', ...
                    'data_TD4.eps','data_TD5.eps','data_TD6.eps', ...
                 'data_TD7.eps','data_TD9.eps','data_TD10.eps','data_TD11.eps','data_TD12.eps','data_TD13.eps','data_TD17.eps','data_TD18.eps','data_TD19.eps','data_TD20.eps','data_TD21.eps','data_TD22.eps','data_TD23.eps'};
%}
%{
save_file_names={'data_TD1.eps','data_TD2.eps', ...
                    'data_TD4.eps','data_TD5.eps','data_TD6.eps', ...
                 'data_TD7.eps','data_TD9.eps','data_TD10.eps','data_TD11.eps','data_TD12.eps','data_TD13.eps','data_TD17.eps','data_TD18.eps','data_TD19.eps','data_TD21.eps','data_TD22.eps','data_TD23.eps'};
%}



loss_threshold=1.0;

epoch_length=5;


for s_i=1:1:subject_num
  s_i

  load(char(Baseline_file_names(s_i)));

%  all_timeseries_l=data.lefteye(:,12);  
  all_timeseries_l=timeseries_l;
  %all_timeseries_r=data.righteye(:,12);
  all_timeseries_r=timeseries_r;
  
  for e_i=1:1:floor(size(all_timeseries_l,1)/(epoch_length*Fs))
    
    timeseries_l=all_timeseries_l(1+(e_i-1)*(epoch_length*Fs):e_i*(epoch_length*Fs));
    timeseries_r=all_timeseries_r(1+(e_i-1)*(epoch_length*Fs):e_i*(epoch_length*Fs));        
    
    timeseries_l(timeseries_l<=0)=NaN;
    timeseries_r(timeseries_r<=0)=NaN;
    
    timeseries_l(isinf(timeseries_l))=NaN;
    timeseries_r(isinf(timeseries_r))=NaN;
    
    
    t_p_l=sum(isnan(timeseries_l))/size(timeseries_l,1);
    t_p_r=sum(isnan(timeseries_r))/size(timeseries_r,1);

    
    if t_p_l<loss_threshold && t_p_r<loss_threshold


      
      timeseries_l=fillmissing(timeseries_l,'linear');
      timeseries_r=fillmissing(timeseries_r,'linear');
      
      passband = 50/(Fs/2);
      
      fir = fir1 ( floor ( size(timeseries_l,1) / 3 ) - 1, passband ,'low');
      timeseries_l = filtfilt(fir, 1, double (timeseries_l));
      
      fir = fir1 ( floor ( size(timeseries_r,1) / 3 ) - 1, passband ,'low');
      timeseries_r = filtfilt(fir, 1, double (timeseries_r));

%{
      passband = [0.025/(Fs/2) 50/(Fs/2)];
      
      fir = fir1 ( floor ( size(timeseries_l,1) / 3 ) - 1, passband );
      timeseries_l = filtfilt(fir, 1, double (timeseries_l));
      
      fir = fir1 ( floor ( size(timeseries_r,1) / 3 ) - 1, passband );
      timeseries_r = filtfilt(fir, 1, double (timeseries_r));
%}
      

      [iaaft_timeseries_l,iter]=IAAFT(timeseries_l,size_sur_data,maxiter);
      [iaaft_timeseries_r,iter]=IAAFT(timeseries_r,size_sur_data,maxiter);
      
      
      base_line_l(e_i)=mean(timeseries_l);
      base_line_r(e_i)=mean(timeseries_r);

      
      m_diff_dia(e_i)= mean(abs(timeseries_l-timeseries_r));
      std_diff_dia(e_i)= std(abs(timeseries_l-timeseries_r));


      ch1=delay_embed(timeseries_l',emb_dim,tau);
      ch2=delay_embed(timeseries_r',emb_dim,tau);
      w1=delay_embed_future(ch1,tau);
      w2=delay_embed_future(ch2,tau);

      te1(e_i)=transfer_entropy(ch1,ch2,w1);
      te2(e_i)=transfer_entropy(ch2,ch1,w2);
      tem(e_i)=(te1(e_i)+te2(e_i))/2;

      temp_mse=msentropy(timeseries_l,m,r,factor);
      ent1(e_i)=temp_mse(1);

      temp_mse=msentropy(timeseries_r,m,r,factor);
      ent2(e_i)=temp_mse(1);

      ent(e_i)=(ent1(e_i)+ent2(e_i))/2;

      
      for sur_i=1:1:size_sur_data

	ch1=delay_embed(iaaft_timeseries_l(:,sur_i)',emb_dim,tau);
	ch2=delay_embed(iaaft_timeseries_r(:,sur_i)',emb_dim,tau);
	w1=delay_embed_future(ch1,tau);
	w2=delay_embed_future(ch2,tau);

	sur_te1=transfer_entropy(ch1,ch2,w1);
	sur_te2=transfer_entropy(ch2,ch1,w2);
	sur_tem(sur_i)=(sur_te1+sur_te2)/2;

	sur_temp_mse=msentropy(iaaft_timeseries_l(:,sur_i),m,r,factor);
	sur_ent1=sur_temp_mse(1);

	sur_temp_mse=msentropy(iaaft_timeseries_r(:,sur_i),m,r,factor);
	sur_ent2=sur_temp_mse(1);
	sur_ent(sur_i)=(sur_ent1+sur_ent2)/2;
	
      end

      iaaft_tem(e_i)=mean(sur_tem);
      iaaft_ent(e_i)=mean(sur_ent);
      
    else

      te1(e_i)=NaN;
      te2(e_i)=NaN;
      tem(e_i)=NaN;

      base_line_l(e_i)=NaN;
      base_line_r(e_i)=NaN;

      iaaft_tem(e_i)=NaN;


      ent1(e_i)=NaN;
      ent2(e_i)=NaN;
      iaaft_ent(e_i)=NaN;
    end
  end

  b_lr=(base_line_l+base_line_r)/2;

  ent(b_lr<0)=NaN;
  tem(b_lr<0)=NaN;
  iaaft_tem(b_lr<0)=NaN;
  iaaft_ent(b_lr<0)=NaN;
  b_lr(b_lr<0)=NaN;


  ent(b_lr>5)=NaN;
  tem(b_lr>5)=NaN;
  iaaft_tem(b_lr>5)=NaN;
  iaaft_ent(b_lr>5)=NaN;
  b_lr(b_lr>5)=NaN;

  
  all_epoch_b_lr(s_i,:)=b_lr;
  all_epoch_ent(s_i,:)=ent;
  all_epoch_tem(s_i,:)=tem;

  all_b_lr(s_i)=mean(b_lr,'omitnan');
  all_tem_lr(s_i)=mean(tem,'omitnan');

  all_iaaft_tem(s_i)=mean(iaaft_tem,'omitnan');

  all_ent(s_i)=mean(ent,'omitnan');
  all_iaaft_ent(s_i)=mean(iaaft_ent,'omitnan');
  

  
  
  clear base_line_l base_line_r e_lr b_lr te1 te2 tem sur_te1 sur_te2 sur_tem iaaft_tem ent iaaft_ent;


  
end




%save('result_TE_MSE_ADHD.mat');
save('result_TE_MSE_TD.mat');
