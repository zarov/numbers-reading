clear

% Parameters : numberrecognition(int d, int k, int m, int n)

%% Show influence of parameter k

for i = 1 : 50
    result(:,i) = numberrecognition(20, i, 6, 6);
end

k = 1:1:50;

%% Show influence of parameter m et n
% for i = 1 : 50
%      result(:,i) = numberrecognition(20, 1, i, i);
% end
% 
% m = 1:1:50;

%% Show influence of parameter d
% for i = 1 : 50
%      result(:,i) = numberrecognition(i, 1, 6, 6);
% end
% 
% d = 1:1:50;

%% Plot results

variable = k;

hold on
plot(variable,result(1,:),'cyan');
pause(0.5)
plot(variable,result(2,:),'black');
pause(0.5)
plot(variable,result(3,:),'blue');
pause(0.5)
plot(variable,result(4,:),'green');

