% results analysis and plots

clear;



%% limited viewing time 40 ms
exp_limited = {'data\subj_1_40.mat', 'data\subj_2_40.mat', 'data\subj_3_40.mat', 'data\subj_4_40.mat', 'data\subj_5_40.mat', 'data\subj_6_40.mat',...
    'data\subj_7_40.mat', 'data\subj_8_40.mat', 'data\subj_9_40.mat', 'data\subj_10_40.mat', 'data\subj_11_40.mat', 'data\subj_12_40.mat',};

n_limited = size(exp_limited, 2);

error_0_lim = 0; % saves errors made in upright
error_1_lim = 0; % saves errors made in rotated correct
error_2_lim = 0; % saves errors made in rotated incorrect

i_lim = zeros(n_limited,3); % matrix where all the accuracy (error) rates of all the subjects are saved

total_lim = zeros(n_limited,3); % saves number of the trials that were successful

% loop that goes through all the condi-matrices, and saves errors and calculates
% accuracy rates

for i = 1:n_limited
    
    name = string(exp_limited(1,i)); 
    load(name);
    sorted = sortrows(condi,3); % sorts condi by 0, 1, 2
    
    % calculates wrongly identified images of each group
    lim_0 = sorted(1:17,:);  % upright 
    error_0_lim = error_0_lim + sum(lim_0(:,7) ~= lim_0(:,8)); 

    lim_1 = sorted(18:34,:); % rotated correct
    error_1_lim = error_1_lim + sum(lim_1(:,7) ~= lim_1(:,8));
    
    lim_2 = sorted(35:49,:); % rotated incorrect
    error_2_lim = error_2_lim + sum(lim_2(:,7) ~= lim_2(:,8));
    
    % calculate how many trials were succesfull
    success_0 = 17 - sum(lim_0(:,7) == 0);
    total_lim(i,1) = success_0;

    success_1 = 17 - sum(lim_1(:,7) == 0);
    total_lim(i,2) = success_1;

    success_2 = 15 - sum(lim_2(:,7) == 0);
    total_lim(i,3) = success_2;

    % calcualate accuracy rates for each subject
    i_lim(i,1) = (success_0-sum(lim_0(:,7) ~= lim_0(:,8)))/success_0*100;
    i_lim(i,2) = (success_1-sum(lim_1(:,7) ~= lim_1(:,8)))/success_1*100;
    i_lim(i,3) = (success_2-sum(lim_2(:,7) ~= lim_2(:,8)))/success_2*100;

end    

lim_rot_ind = sum (i_lim(:,2:3), 2)/2;

lim_0_cor = sum(i_lim(:,1))/n_limited;
lim_1_cor = sum(i_lim(:,2))/n_limited;
lim_2_cor = sum(i_lim(:,3))/n_limited;

r_lim = [0 lim_0_cor; 1 lim_1_cor; 2 lim_2_cor];

lim_combined = (lim_1_cor+lim_2_cor)/2;

females_rows = [1, 6, 8, 9, 11, 12];
males_rows = [2, 3, 4, 5, 7, 10];

females = i_lim(females_rows, :);
females = [females(:, 1), mean(females(:, 2:3), 2)];
males = i_lim(males_rows, :);
males = [males(:, 1), mean(males(:, 2:3), 2)];

%% limited viewing time 150ms

exp_150 = {'data\subj_13_150.mat', 'data\subj_14_150.mat', 'data\subj_15_150.mat', 'data\subj_16_150.mat', 'data\subj_17_150.mat',...
    'data\subj_18_150.mat', 'data\subj_19_150.mat', 'data\subj_20_150.mat', 'data\subj_21_150.mat', 'data\subj_22_150.mat', 'data\subj_23_150.mat', 'data\subj_24_150.mat'};

n_150 = size(exp_150, 2);

error_0_150 = 0; % saves errors made in upright
error_1_150 = 0; % saves errors made in rotated correct
error_2_150 = 0; % saves errors made in rotated incorrect

i_150 = zeros(n_150,3); % matrix where all the accuracy (error) rates of all the subjects are saved

total_150 = zeros(n_150,3); % saves number of the trials that were successful

% loop that goes through all the condi-matrices, and saves errors and calculates
% accuracy rates

for i = 1:n_150
    
    name = string(exp_150(1,i)); 
    load(name);
    sorted = sortrows(condi,3); % sorts condi by 0, 1, 2
    
    % calculates wrongly identified images of each group
    lim_150_0 = sorted(1:17,:);  % upright 
    error_0_150 = error_0_150 + sum(lim_150_0(:,7) ~= lim_150_0(:,8)); 

    lim_150_1 = sorted(18:34,:); % rotated correct
    error_1_150 = error_1_150 + sum(lim_150_1(:,7) ~= lim_150_1(:,8));
    
    lim_150_2 = sorted(35:49,:); % rotated incorrect
    error_2_150 = error_2_150 + sum(lim_150_2(:,7) ~= lim_150_2(:,8));
    
    % calculate how many trials were succesfull
    success_0 = 17 - sum(lim_150_0(:,7) == 0);
    total_150(i,1) = success_0;

    success_1 = 17 - sum(lim_150_1(:,7) == 0);
    total_150(i,2) = success_1;

    success_2 = 15 - sum(lim_150_2(:,7) == 0);
    total_150(i,3) = success_2;

    % calcualate accuracy rates for each subject
    i_150(i,1) = (success_0-sum(lim_150_0(:,7) ~= lim_150_0(:,8)))/success_0*100;
    i_150(i,2) = (success_1-sum(lim_150_1(:,7) ~= lim_150_1(:,8)))/success_1*100;
    i_150(i,3) = (success_2-sum(lim_150_2(:,7) ~= lim_150_2(:,8)))/success_2*100;
    
end      

lim_150_rot_ind = sum(i_150(:,2:3), 2)/2;

lim_150_0_cor = sum(i_150(:,1))/n_150;
lim_150_1_cor = sum(i_150(:,2))/n_150;
lim_150_2_cor = sum(i_150(:,3))/n_150;


r_150 = [0 lim_150_0_cor; 1 lim_150_1_cor; 2 lim_150_2_cor];

lim_150_combined = (lim_150_1_cor+lim_150_2_cor)/2;


%% unlimited viewing time experiment 2

exp_unlimited_2 = {'data\subj_13_unlim.mat', 'data\subj_14_unlim.mat', 'data\subj_15_unlim.mat', 'data\subj_16_unlim.mat', 'data\subj_17_unlim.mat',...
    'data\subj_18_unlim.mat', 'data\subj_19_unlim.mat', 'data\subj_20_unlim.mat', 'data\subj_21_unlim.mat', 'data\subj_22_unlim.mat', 'data\subj_23_unlim.mat', 'data\subj_24_unlim.mat'};

n_unlimited_2 = size(exp_unlimited_2, 2);

i_unlim_2 = zeros(n_unlimited_2,3); % matrix where all the accuracy (error) rates of all the subjects are saved

error_0_unlim_2 = 0; % saves errors made in upright
error_1_unlim_2 = 0; % saves errors made in rotated correct
error_2_unlim_2 = 0; % saves errors made in rotated incorrect

total_unlim_2 = zeros(n_unlimited_2, 3);

for i = 1:n_unlimited_2
    
    name = string(exp_unlimited_2(1,i)); 
    load(name);
    sorted = sortrows(condi,3);
    
    % calculates wrongly identified images of each group
    unlim_0_2 = sorted(1:17,:); % upright
    error_0_unlim_2 = error_0_unlim_2 + sum(unlim_0_2(:,7) ~= unlim_0_2(:,8));
    
    unlim_1_2 = sorted(18:34,:); % rotated correct
    error_1_unlim_2 = error_1_unlim_2 + sum(unlim_1_2(:,7) ~= unlim_1_2(:,8));
   
    unlim_2_2 = sorted(35:49,:); % rotated incorrect
    error_2_unlim_2 = error_2_unlim_2 + sum(unlim_2_2(:,7) ~= unlim_2_2(:,8));

    
    % calculate how many trials were succesfull
    success_0 = 17 - sum(unlim_0_2(:,7) == 0);
    total_unlim_2(i,1) = success_0;

    success_1 = 17 - sum(unlim_1_2(:,7) == 0);
    total_unlim_2(i,2) = success_1;

    success_2 = 15 - sum(unlim_2_2(:,7) == 0);
    total_unlim_2(i,3) = success_2;


    % calcualate accuracy rates for each subject
    i_unlim_2(i,1) = (success_0-sum(unlim_0_2(:,7) ~= unlim_0_2(:,8)))/success_0*100;
    i_unlim_2(i,2) = (success_1-sum(unlim_1_2(:,7) ~= unlim_1_2(:,8)))/success_1*100;
    i_unlim_2(i,3) = (success_2-sum(unlim_2_2(:,7) ~= unlim_2_2(:,8)))/success_2*100;
    
end    

unlim2_rot_ind = sum (i_unlim_2(:,2:3), 2)/2;

unlim_0_cor_2 = sum(i_unlim_2(:,1))/n_unlimited_2;
unlim_1_cor_2 = sum(i_unlim_2(:,2))/n_unlimited_2;
unlim_2_cor_2 = sum(i_unlim_2(:,3))/n_unlimited_2;

r_unlim_2 = [0 unlim_0_cor_2; 1 unlim_1_cor_2; 2 unlim_2_cor_2];

unlim_combined_2 = (unlim_1_cor_2+unlim_2_cor_2)/2;


%% Network results


exp_networks = {'data\beit.mat', 'data\convnext.mat', 'data\swag.mat', 'data\swin.mat', 'data\vit.mat'};

n_networks = size(exp_networks, 2);

i_networks = zeros(n_networks,3); % matrix where all the accuracy (error) rates of all the networks are saved

error_0_networks = 0; % saves errors made in upright
error_1_networks = 0; % saves errors made in rotated correct
error_2_networks = 0; % saves errors made in rotated incorrect

%total_unlim = zeros(n_unlimited, 3);

for i = 1:n_networks
    

    name = string(exp_networks(1,i)); 
    load(name);
    sorted = sortrows(data,3);



    % calculates wrongly identified images of each group
    networks_0 = sorted(1:51,:); % upright
    error_0_networks = error_0_networks + sum(networks_0(:,4) == 0);
    
    networks_1 = sorted(52:102,:); % rot correct
    error_1_networks = error_1_networks + sum(networks_1(:,4) == 0);
   
    networks_2 = sorted(103:147,:); % rot incorrect
    error_2_networks = error_2_networks + sum(networks_2(:,4) == 0);

    
    % calcualate accuracy rates for each network
    i_networks(i,1) = sum(networks_0(:,4) == 1)/51*100;
    i_networks(i,2) = sum(networks_1(:,4) == 1)/51*100;
    i_networks(i,3) = sum(networks_2(:,4) == 1)/45*100;

end    

networks_rot_ind = sum (i_networks(:,2:3), 2)/2;


% calculate average accuracy rate
networks_0_cor = sum(i_networks(:,1))/n_networks;
networks_1_cor = sum(i_networks(:,2))/n_networks;
networks_2_cor = sum(i_networks(:,3))/n_networks;

r_networks = [networks_0_cor networks_1_cor networks_2_cor];

networks_combined = (networks_1_cor+networks_2_cor)/2;

r_networks_combined = [networks_0_cor networks_combined];


%% Network results Language models

exp_language = {'data\gemini_flash_answers.mat', 'data\gemini_pro_answers.mat', 'data\gpt4o_answers.mat', 'data\gpt4_vision_answers.mat', 'data\claude_sonnet_answers.mat','data\claude_opus_answers.mat'};

numNetworks = length(exp_language);

% performance matrix
performance_language = zeros(4, numNetworks);


for net = 1:numNetworks

    dataStruct = load(exp_language{net});
    
    matrix = dataStruct.data;
    
    totalCount = [51, 51, 45]; % initial counts for upright, rot correct, rot incorrect
    correctCount = [0, 0, 0];
    
    % iterate through each row in the matrix
    for row = 1:size(matrix, 1)
        condition = matrix(row, 3);
        answer = matrix(row, 4);
        
        if answer == 2
            % skip this object, reduce total count
            if condition == 0
                totalCount(1) = totalCount(1) - 1;
            elseif condition == 1
                totalCount(2) = totalCount(2) - 1;
            elseif condition == 2
                totalCount(3) = totalCount(3) - 1;
            end
        elseif answer == 1
            % correct answer, increase correct count
            if condition == 0
                correctCount(1) = correctCount(1) + 1;
            elseif condition == 1
                correctCount(2) = correctCount(2) + 1;
            elseif condition == 2
                correctCount(3) = correctCount(3) + 1;
            end
        end
    end
    
    % calculate performance for each condition
    for i = 1:3
        performance_language(i, net) = correctCount(i) / totalCount(i);
       
    end

     % calculate the average performance for rot correct and rot incorrect
    performance_language(4, net) = (performance_language(2, net) + performance_language(3, net)) / 2;

end



%% calculate 95% confidence interval error bars

% limited 40
s_lim = std(i_lim, 0, 1);
%upright
sem_1 = s_lim(1)/sqrt(n_limited); 
ci_1 = sem_1*2.17881;
%rotated correct
sem_2 = s_lim(2)/sqrt(n_limited); 
ci_2 = sem_2*2.17881;
%rotated incorrect
sem_3 = s_lim(3)/sqrt(n_limited); 
ci_3 = sem_3*2.17881;

% limited 40ms combined
combined_lim = i_lim(:, 2:end);
combined_lim = mean(combined_lim, 2);
std_combined_lim = std(combined_lim);
sem_combined_lim = std_combined_lim/sqrt(n_limited);
ci_combined_lim = sem_combined_lim * 2.17881;

% limited 150
s_150 = std(i_150, 0, 1);
%upright
sem_7 = s_150(1)/sqrt(n_150); 
ci_7 = sem_7*2.17881;
%rotated correct
sem_8 = s_150(2)/sqrt(n_150); 
ci_8 = sem_8*2.17881;
%rotated incorrect
sem_9 = s_150(3)/sqrt(n_150); 
ci_9 = sem_9*2.17881;

% limited 150ms combined
combined_150 = i_150(:, 2:end);
combined_150 = mean(combined_150, 2);
std_combined_150 = std(combined_150);
sem_combined_150 = std_combined_150/sqrt(n_150);
ci_combined_150 = sem_combined_150 * 2.17881;


%unlimited experiment 2
s_unlim_2 = std(i_unlim_2, 0, 1);
%upright
sem_10 = s_unlim_2(1)/sqrt(n_unlimited_2); 
ci_10 = sem_10*2.17881;
%rotated correct
sem_11 = s_unlim_2(2)/sqrt(n_unlimited_2); 
ci_11 = sem_11*2.17881;
%rotated incorrect
sem_12 = s_unlim_2(3)/sqrt(n_unlimited_2); 
ci_12 = sem_12*2.17881;

% unlimited combined rotated, exp 2
combined_unlim_2 = i_unlim_2(:, 2:end);
combined_unlim_2 = mean(combined_unlim_2, 2);
std_combined_unlim_2 = std(combined_unlim_2);
sem_combined_unlim_2 = std_combined_unlim_2/sqrt(n_unlimited_2);
ci_combined_unlim_2 = sem_combined_unlim_2 * 2.17881;


% networks
s_networks = std(i_networks, 0, 1);
%upright
sem_up_net = s_networks(1)/sqrt(5);
ci_up_net = sem_up_net * 2.571;
%rot cor
sem_cor_net = s_networks(2)/sqrt(5);
ci_cor_net = sem_cor_net * 2.571;
%rot incor
sem_incor_net = s_networks(3)/sqrt(5);
ci_incor_net = sem_incor_net * 2.571;

% networks rotated combined
combined_networks = i_networks(:, 2:end);
combined_networks = mean(combined_networks, 2);
std_combined_network = std(combined_networks);
sem_combined_network = std_combined_network/sqrt(5);
ci_combined_network = sem_combined_network * 2.571;


%% t-tests with original

% unlimited (2) rotated vs 40ms rotated, two-tailed unpaired t-test
[h_1, p_1, c_1, stats_1] = ttest2(combined_unlim_2, combined_lim);

% 150ms rotated vs 40ms rotated, two-tailed unpaired t-test
[h_2, p_2, c_2, stats_2] = ttest2(combined_150, combined_lim);

% unlimited (2) rotated vs 150ms rotated, two-tailed paired t-test
[h_3, p_3, c_3, stats_3] = ttest(combined_unlim_2, combined_150);

% 40ms upright vs 40ms rotated, two-tailed paired t-test
[h_4, p_4, c_4, stats_4] = ttest(i_lim(:,1), combined_lim);

% 150ms upright vs 150ms rotated, two-tailed paired t-test
[h_5, p_5, c_5, stats_5] = ttest(i_150(:,1), combined_150);


% upright unlimited (2) vs 40ms
[h_7, p_7, c_7, stats_7] = ttest2(i_unlim_2(:,1), i_lim(:,1));

% rotated unlimited 2 vs networks
[h_8, p_8, c_8, stats_8] = ttest2(combined_unlim_2, combined_networks);

% unlimited upright 2 vs rotated
[h_9, p_9, c_9, stats_9] = ttest(i_unlim_2(:,1), combined_unlim_2);

% upright 150ms vs 40ms
[h_10, p_10, c_10, stats_10] = ttest2(i_150(:,1), i_lim(:,1));

% networks upright vs rotated
[h_11, p_11, c_11, stats_11] = ttest(i_networks(:,1), combined_networks);

% networks cor vs incor
[h_12, p_12, c_12, stats_12] = ttest(i_networks(:,2), i_networks(:,3));

% lim 40 cor vs incor
[h_13, p_13, c_13, stats_13] = ttest(i_lim(:,2), i_lim(:,3));

% lim 150 cor vs incor
[h_14, p_14, c_14, stats_14] = ttest(i_150(:,2), i_150(:,3));

% unlim cor vs incor
[h_15, p_15, c_15, stats_15] = ttest(i_unlim_2(:,2), i_unlim_2(:,3));


% 40 ms female vs male upright
[h_16, p_16, c_16, stats_16] = ttest2(males(:,1), females(:,1));


% 40 ms female vs male rotated combined
[h_17, p_17, c_17, stats_17] = ttest2(males(:,2), females(:,2));


%% all human conditions (rotated combined)

err_combined = [ci_up_net ci_combined_network; 0 0; ci_10 ci_combined_unlim_2; ci_7 ci_combined_150; ci_1 ci_combined_lim];

x = 0:4;


y_error = [r_networks_combined(1) r_networks_combined(2); 0 0; unlim_0_cor_2 unlim_combined_2; lim_150_0_cor lim_150_combined; lim_0_cor lim_combined];

% VLM averages
avg_row_2 = mean(performance_language(1, :))*100;
avg_row_3 = mean(performance_language(4, :))*100;

groupData = {
    [r_networks_combined(1); r_networks_combined(2)],
    [avg_row_2; avg_row_3],
    [unlim_0_cor_2; unlim_combined_2],
    [lim_150_0_cor; lim_150_combined],
    [lim_0_cor; lim_combined]
};


groupLabels = {'deep nets', 'unlimited', '150ms', '40ms'};


colormap lines
cmap = colormap;


% blue, orange, red
%[230/255 124/255 101/255]
groupColors = {[62/255 62/255 62/255], [180/255 180/255 180/255], [52/255 70/255 110/255], [219/255 104/255 79/255], [206/255 68/255 59/255]};
groupColors2 = {[188/255 188/255 188/255], [230/255 230/255 230/255], [147/255 163/255 202/255], [238/255 193/255 177/255], [242/255 169/255 167/255]};



figure('Position', [0 0 800 400]);
lineColor = [0.8, 0.8, 0.8];
plot([-1, 5],[60,60], 'Color', lineColor);
hold on;
plot([-1, 5],[70,70], 'Color', lineColor);
hold on;
plot([-1, 5],[80,80], 'Color', lineColor);
hold on;
plot([-1, 5],[90,90], 'Color', lineColor);
hold on;
plot([-1, 5],[100,100], 'Color', lineColor);
hold on;
hold on;


for i = 1:numel(groupData)
    %bh = bar(x(i), groupData{i});
    %set(bh, 'FaceColor', groupColors{i});
    xs = [i-0.03, i-0.29+0.03, i-0.29+0.03, i-0.03]-1;
    ys = [0, 0, groupData{i}(1), groupData{i}(1)];
    patch(xs,ys,groupColors{i});


    xs = [i+0.03, i+0.29-0.03, i+0.29-0.03, i+0.03]-1;
    ys = [0, 0, groupData{i}(2), groupData{i}(2)];
    h=patch(xs,ys,groupColors{i});
    candystripe(h,'width',0.1,'units','native','angle',88, 'color', groupColors2{i});

end

hold on;

% Adding the performance results as diamond symbols

diamondSize = 40; 


%colors = {[250/255 37/255 119/255], [26/255 205/255 237/255], [255/255 194/255 28/255]};

colors = {[250/255 37/255 119/255], [16/255 88/255 232/255], [160/255 10/255 201/255]};

% plot VLM performance as diamonds

x_dummy_bar_1 = 0.8570;  % X-position for the first dummy bar
x_dummy_bar_2 = 1.145;  % X-position for the second dummy bar




% ------ plot VLM averages ------  %




offset_left1 = -0.08; 
offset_left2 = 0.06;  
offset_center1 = -0.04;   
offset_center2 = 0.04;   
offset_right1 = 0.04;
offset_right2 = 0.08;


LineWidth = 1;

% ---- Plot diamonds for dummy bar 1 ---- %
scatter(x_dummy_bar_1 + offset_left1, performance_language(1, 1) * 100, diamondSize, ...
        'd', 'MarkerEdgeColor', colors{1}, 'MarkerFaceColor', colors{1}, 'LineWidth', LineWidth);
scatter(x_dummy_bar_1 + offset_center1, performance_language(1, 2) * 100, diamondSize, ...
        'd', 'MarkerEdgeColor', colors{1}, 'MarkerFaceColor', 'none', 'LineWidth', LineWidth);

scatter(x_dummy_bar_1, performance_language(1, 3) * 100, diamondSize, ...
        'd', 'MarkerEdgeColor', colors{2}, 'MarkerFaceColor', colors{2}, 'LineWidth', LineWidth);
scatter(x_dummy_bar_1 + offset_right2, performance_language(1, 4) * 100, diamondSize, ...
        'd', 'MarkerEdgeColor', colors{2}, 'MarkerFaceColor', 'none', 'LineWidth', LineWidth);

scatter(x_dummy_bar_1 + offset_right1, performance_language(1, 5)* 100, diamondSize, ...
        'd', 'MarkerEdgeColor', colors{3}, 'MarkerFaceColor', colors{3}, 'LineWidth', LineWidth);
scatter(x_dummy_bar_1 + offset_right1, performance_language(1, 6)* 100, diamondSize, ...
        'd', 'MarkerEdgeColor', colors{3}, 'MarkerFaceColor', 'none', 'LineWidth', LineWidth);


% ---- Plot diamonds for dummy bar 2 ---- %


scatter(x_dummy_bar_2 + offset_center1, performance_language(4, 1) * 100, diamondSize, ...
        'd', 'MarkerEdgeColor', colors{1}, 'MarkerFaceColor', colors{1}, 'LineWidth', LineWidth);
scatter(x_dummy_bar_2 + offset_left2, performance_language(4, 2) * 100, diamondSize, ...
        'd', 'MarkerEdgeColor', colors{1}, 'MarkerFaceColor', 'none', 'LineWidth', LineWidth);


scatter(x_dummy_bar_2 + offset_center1, performance_language(4, 3) * 100, diamondSize, ...
        'd', 'MarkerEdgeColor', colors{2}, 'MarkerFaceColor', colors{2}, 'LineWidth', LineWidth);
scatter(x_dummy_bar_2 + offset_center2, performance_language(4, 4) * 100, diamondSize, ...
        'd', 'MarkerEdgeColor', colors{2}, 'MarkerFaceColor', 'none', 'LineWidth', LineWidth);


scatter(x_dummy_bar_2 + offset_center1, performance_language(4, 5)* 100, diamondSize, ...
        'd', 'MarkerEdgeColor', colors{3}, 'MarkerFaceColor', colors{3}, 'LineWidth', LineWidth);
scatter(x_dummy_bar_2 + offset_center2, performance_language(4, 6)* 100, diamondSize, ...
        'd', 'MarkerEdgeColor', colors{3}, 'MarkerFaceColor', 'none', 'LineWidth', LineWidth);
   


dotSize = 14;  
outlineWidth = 1.2;
grayColor = [0.4 0.4 0.4]; 


offset = 0.1;


scatter(-0.135 - offset + 2*offset*rand(size(i_networks(:,1))), i_networks(:,1), dotSize, grayColor, 'filled', 'LineWidth', outlineWidth);
scatter(0.145 + offset - 2*offset*rand(size(networks_rot_ind)), networks_rot_ind, dotSize, grayColor, 'filled', 'LineWidth', outlineWidth);

scatter(1.865 - offset + 2*offset*rand(size(i_unlim_2(:,1))), i_unlim_2(:,1), dotSize, grayColor, 'filled', 'LineWidth', outlineWidth);
scatter(2.145 + offset - 2*offset*rand(size(unlim2_rot_ind)), unlim2_rot_ind, dotSize, grayColor, 'filled', 'LineWidth', outlineWidth);

scatter(2.865 - offset + 2*offset*rand(size(i_150(:,1))), i_150(:,1), dotSize, grayColor, 'filled', 'LineWidth', outlineWidth);
scatter(3.145 + offset - 2*offset*rand(size(lim_150_rot_ind)), lim_150_rot_ind, dotSize, grayColor, 'filled', 'LineWidth', outlineWidth);

scatter(3.865 - offset + 2*offset*rand(size(i_lim(:,1))), i_lim(:,1), dotSize, grayColor, 'filled', 'LineWidth', outlineWidth);
scatter(4.145 + offset - 2*offset*rand(size(lim_rot_ind)), lim_rot_ind, dotSize, grayColor, 'filled', 'LineWidth', outlineWidth);





hold on;

errorbar([-0.143 0.145; 0.8570 1.145; 1.857 2.145; 2.8570 3.145; 3.857 4.145;], y_error, err_combined, 'k', 'LineWidth', 1.4, 'LineStyle','none');

hold on;

plot([-0.5, 4.5],[50,50], '--k');

hold on;

plot([1.5 1.5], [40 102], '--k', 'Color', [0.7 0.7 0.7], 'LineWidth', 1);

hold on;

ax = gca;
ax.Box = 'off';

% Adjust x-tick positions and labels
% xtickpositions = 0:3;
% xticks(xtickpositions);
%xticklabels(groupLabels);
xticks([]);
xlim([-0.5 4.5]);

ax.FontSize = 17;
ylim([40 102]);
yticks([40 50 60 70 80 90 100]);

ylabel('Accuracy (% correct)','FontSize',18)
set(gca,'fontname','times new roman')
% 
% 
% %print('results_upright_vs_rot', '-dpdf', '-bestfit')
% % 
%print('VLM_included_1', '-dsvg')


%% rot correct vs rot incorrect

err_combined = [ci_cor_net ci_incor_net; 0 0; ci_11 ci_12; ci_8 ci_9; ci_2 ci_3];

x = 0:4;


y_error = [networks_1_cor networks_2_cor; 0 0; unlim_1_cor_2 unlim_2_cor_2; lim_150_1_cor lim_150_2_cor; lim_1_cor lim_2_cor];

% VLM averages
avg_row_2 = mean(performance_language(2, :))*100;
avg_row_3 = mean(performance_language(3, :))*100;

groupData = {
    [networks_1_cor; networks_2_cor],
    [avg_row_2; avg_row_3],
    [unlim_1_cor_2; unlim_1_cor_2],
    [lim_150_1_cor; lim_150_2_cor],
    [lim_1_cor; lim_2_cor]
};


groupLabels = {'networks', 'unlimited', '150ms', '40ms'};


colormap lines
cmap = colormap;

% original
%groupColors = {[62/255 62/255 62/255], [58/255 78/255 124/255], [225/255 113/255 89/255], [206/255 68/255 59/255]};
%groupColors2 = {[120/255 120/255 120/255], [124/255 144/255 188/255], [234/255 164/255 149/255], [213/255 126/255 120/255]};
groupColors = {[62/255 62/255 62/255], [180/255 180/255 180/255], [52/255 70/255 110/255], [219/255 104/255 79/255], [206/255 68/255 59/255]};
groupColors2 = {[188/255 188/255 188/255], [230/255 230/255 230/255], [147/255 163/255 202/255], [238/255 193/255 177/255], [242/255 169/255 167/255]};

figure('Position', [0 0 800 400]);

lineColor = [0.8, 0.8, 0.8];

plot([-1, 5],[60,60], 'Color', lineColor);
hold on;
plot([-1, 5],[70,70], 'Color', lineColor);
hold on;
plot([-1, 5],[80,80], 'Color', lineColor);
hold on;
plot([-1, 5],[90,90], 'Color', lineColor);
hold on;
plot([-1, 5],[100,100], 'Color', lineColor);
hold on;


for i = 1:numel(groupData)
    %bh = bar(x(i), groupData{i});
    %set(bh, 'FaceColor', groupColors{i});

    %xs = [0+0.03, 0.29-0.03, 0.29-0.03, 0+0.03];
    xs = [i-0.03, i-0.29+0.03, i-0.29+0.03, i-0.03]-1;
    ys = [0, 0, groupData{i}(1), groupData{i}(1)];
    h = patch(xs,ys,groupColors{i});
    candystripe(h,'width',2,'units','native','angle',90, 'color', groupColors2{i});

    xs = [i+0.03, i+0.29-0.03, i+0.29-0.03, i+0.03]-1;
    ys = [0, 0, groupData{i}(2), groupData{i}(2)];
    h=patch(xs,ys,groupColors{i});
    candystripe(h,'width',1.5,'units','native','angle',0, 'color', groupColors2{i});


end




% if i == 1
%         hatchfill2_BoxChartOpt(bh(2),'single','HatchAngle',0, 'hatchcolor', 'w', 'HatchLineWidth', 4);

hold on;

% Adding the performance results as diamond symbols
diamondSize = 40; 


%colors = {[250/255 37/255 119/255], [26/255 205/255 237/255], [255/255 194/255 28/255]};
colors = {[250/255 37/255 119/255], [16/255 88/255 232/255], [160/255 10/255 201/255]};

% plot VLM performance as diamonds

x_dummy_bar_1 = 0.8570;  % X-position for the first dummy bar
x_dummy_bar_2 = 1.145;  % X-position for the second dummy bar




% ------ plot VLM averages ------  %




offset_left1 = -0.15; 
offset_left2 = -0.1;  
offset_center1 = -0.04;   
offset_center2 = 0.04;   
offset_right1 = 0.1;
offset_right2 = 0.15;

LineWidth = 1;

% ---- Plot diamonds for dummy bar 1 ---- %
scatter(x_dummy_bar_1 + offset_center1, performance_language(2, 1) * 100, diamondSize, ...
        'd', 'MarkerEdgeColor', colors{1}, 'MarkerFaceColor', colors{1}, 'LineWidth', LineWidth);
scatter(x_dummy_bar_1 + offset_center2, performance_language(2, 2) * 100, diamondSize, ...
        'd', 'MarkerEdgeColor', colors{1}, 'MarkerFaceColor', 'none', 'LineWidth', LineWidth);

scatter(x_dummy_bar_1 + offset_center1, performance_language(2, 3) * 100, diamondSize, ...
        'd', 'MarkerEdgeColor', colors{2}, 'MarkerFaceColor', colors{2}, 'LineWidth', LineWidth);
scatter(x_dummy_bar_1 + offset_center2, performance_language(2, 4) * 100, diamondSize, ...
        'd', 'MarkerEdgeColor', colors{2}, 'MarkerFaceColor', 'none', 'LineWidth', LineWidth);

scatter(x_dummy_bar_1 + offset_center1, performance_language(2, 5)* 100, diamondSize, ...
        'd', 'MarkerEdgeColor', colors{3}, 'MarkerFaceColor', colors{3}, 'LineWidth', LineWidth);
scatter(x_dummy_bar_1 + offset_center2, performance_language(2, 6)* 100, diamondSize, ...
        'd', 'MarkerEdgeColor', colors{3}, 'MarkerFaceColor', 'none', 'LineWidth', LineWidth);


% ---- Plot diamonds for dummy bar 2 ---- %


scatter(x_dummy_bar_2 + offset_center1, performance_language(3, 1) * 100, diamondSize, ...
        'd', 'MarkerEdgeColor', colors{1}, 'MarkerFaceColor', colors{1}, 'LineWidth', LineWidth);
scatter(x_dummy_bar_2 + offset_center2, performance_language(3, 2) * 100, diamondSize, ...
        'd', 'MarkerEdgeColor', colors{1}, 'MarkerFaceColor', 'none', 'LineWidth', LineWidth);


scatter(x_dummy_bar_2 + offset_center1, performance_language(3, 3) * 100, diamondSize, ...
        'd', 'MarkerEdgeColor', colors{2}, 'MarkerFaceColor', colors{2}, 'LineWidth', LineWidth);
scatter(x_dummy_bar_2 + offset_center2, performance_language(3, 4) * 100, diamondSize, ...
        'd', 'MarkerEdgeColor', colors{2}, 'MarkerFaceColor', 'none', 'LineWidth', LineWidth);


scatter(x_dummy_bar_2 + offset_center1, performance_language(3, 5)* 100, diamondSize, ...
        'd', 'MarkerEdgeColor', colors{3}, 'MarkerFaceColor', colors{3}, 'LineWidth', LineWidth);
scatter(x_dummy_bar_2 + offset_center2, performance_language(3, 6)* 100, diamondSize, ...
        'd', 'MarkerEdgeColor', colors{3}, 'MarkerFaceColor', 'none', 'LineWidth', LineWidth);
   





dotSize = 14;  
outlineWidth = 1.2;
grayColor = [0.4 0.4 0.4]; 

offset = 0.1;

scatter(-0.135 - offset + 2*offset*rand(size(i_networks(:,2))), i_networks(:,2), dotSize, grayColor, 'filled', 'LineWidth', outlineWidth);
scatter(0.145 + offset - 2*offset*rand(size(i_networks(:,3))), i_networks(:,3), dotSize, grayColor, 'filled', 'LineWidth', outlineWidth);

scatter(1.865 - offset + 2*offset*rand(size(i_unlim_2(:,2))), i_unlim_2(:,2), dotSize, grayColor, 'filled', 'LineWidth', outlineWidth);
scatter(2.145 + offset - 2*offset*rand(size(i_unlim_2(:,3))), i_unlim_2(:,3), dotSize, grayColor, 'filled', 'LineWidth', outlineWidth);

scatter(2.865 - offset + 2*offset*rand(size(i_150(:,2))), i_150(:,2), dotSize, grayColor, 'filled', 'LineWidth', outlineWidth);
scatter(3.145 + offset - 2*offset*rand(size( i_150(:,3))),  i_150(:,3), dotSize, grayColor, 'filled', 'LineWidth', outlineWidth);

scatter(3.865 - offset + 2*offset*rand(size(i_lim(:,2))), i_lim(:,2), dotSize, grayColor, 'filled', 'LineWidth', outlineWidth);
scatter(4.145 + offset - 2*offset*rand(size(i_lim(:,3))), i_lim(:,3), dotSize, grayColor, 'filled', 'LineWidth', outlineWidth);


hold on;

errorbar([-0.143 0.145; 0.8570 1.145; 1.857 2.145; 2.8570 3.145; 3.857 4.145;], y_error, err_combined, 'k', 'LineWidth', 1.4, 'LineStyle','none');
% 
hold on;

plot([-0.5, 4.5],[50,50], '--k');

hold on;

plot([1.5 1.5], [40 102], '--k', 'Color', [0.7 0.7 0.7], 'LineWidth', 1);

% hold on;

ax = gca;
ax.Box = 'off';



xlim([-0.5 4.5]);
xticks([]);

ax.FontSize = 17;
ylim([40 102]);
yticks([40 50 60 70 80 90 100]);
ax.GridColor = [0.1, 0.1, 0.1]; % [R, G, B]
ylabel('Accuracy (% correct)','FontSize',18)
set(gca,'fontname','times new roman')
% 
% 
% %print('results_cor_incor', '-dpdf', '-bestfit')
% 
% 
% 
%print('VLM_included_2', '-dsvg')

