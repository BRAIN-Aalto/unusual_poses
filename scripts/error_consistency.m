%% error consistency
clear;


observers = {'beit', 'convnext', 'swag', 'swin', 'vit', 'group1', 'group2', 'group3', 'group4'};
num_observers = length(observers);
kappa_matrix = zeros(num_observers, num_observers);

for i = 1:num_observers
    for j = 1:num_observers
        if i == j
            
            kappa_matrix(i, j) = 1;
        else
            
            observer_i_data = load([observers{i}, '.mat']);
            observer_j_data = load([observers{j}, '.mat']);

            
            observer_i_responses = observer_i_data.data(:, 3); 
            observer_j_responses = observer_j_data.data(:, 3); 

            % calculate the observed overlap
            c_obs = sum(observer_i_responses == observer_j_responses) / length(observer_i_responses);

            % calculate the accuracies for observer i and j
            p_i = sum(observer_i_responses == 1) / length(observer_i_responses);
            p_j = sum(observer_j_responses == 1) / length(observer_j_responses);

            % calculate the expected overlap
            c_exp = p_i * p_j + (1 - p_i) * (1 - p_j);

            % calculate cohens kappa
            kappa = (c_obs - c_exp) / (1 - c_exp);

  
            kappa_matrix(i, j) = kappa;
        end
    end
end


disp("Cohen's Kappa Matrix:");
disp(kappa_matrix);

