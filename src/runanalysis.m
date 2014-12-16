clear

% Parameters : numberrecognition(int d, int k, int m, int n)

%% Show influence of parameter k

% for i = 1 : 50
%     resultk(:,i) = numberrecognition(6, i, 19, 9);
% end

% figure
% plot(variable,result(2,:),'magenta');

%% Show influence of parameter d
% for i = 1 : 50
%      result(:,i) = numberrecognition(i, 5, 19, 9);
% end
% 
% d = 1:1:50;
% 
% variable = d;
% figure
% plot(variable,result(1,:),'magenta');

%% Show influence of parameter m et n
% for i = 1 : 50
%     resultm(:,i) = numberrecognition(6, 1, i, 6);
%      result(:,i) = numberrecognition(14, 1, i, i);
% end
% 
% m = 1:1:50;
% variable = m;
% figure
% plot(variable,result(2,:),'magenta');


% Plots 

% figure
% subplot(1,2,1), plot(m,resultm(2,:),'magenta');
% subplot(1,2,2), plot(n,resultn(2,:),'magenta');
% 
% subplot(2,2,1), plot(variable,result(1,:),'magenta');
% subplot(2,2,2), plot(variable,result(2,:),'magenta');
% subplot(2,2,3), plot(variable,result(3,:),'black');
% subplot(2,2,4), plot(variable,result(4,:),'black');

% k = 1:1:50;
% hold on
% 
% subplot(2,1,1)
% hold on
% plot(variable,result(2,:),'blacko');
% pause(0.5)
% plot(variable,result(1,:),'cyan+');
% pause(0.5)
% plot(variable,result(3,:),'b*');
% pause(0.5)
% plot(variable,result(4,:),'green');
% 
% subplot(2,1,2)
% hold on
% plot(k,resultk(2,:),'blacko');
% pause(0.5)
% plot(k,resultk(1,:),'c+');
% pause(0.5)
% plot(k,resultk(3,:),'b*');
% pause(0.5)
% plot(k,resultk(4,:),'g');

