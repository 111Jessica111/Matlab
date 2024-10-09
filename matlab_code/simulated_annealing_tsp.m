function simulated_annealing_tsp()
    % 城市坐标
    cities = [0 0; 1 3; 4 3; 6 1; 3 0];
    n = size(cities, 1); % 返回行数
    
    % 计算距离矩阵
    dist = zeros(n);
    for i = 1:n
        for j = 1:n
            dist(i, j) = norm(cities(i, :) - cities(j, :));
        end
    end
    
    % 参数设置
    initial_temp = 1000; % 初始温度
    cooling_rate = 0.995; % 降温速率
    max_iter = 1000; % 每个温度下的最大迭代次数
    
    % 初始化路径
    current_solution = 1:n;
    current_distance = calculate_total_distance(current_solution, dist);
    best_solution = current_solution;
    best_distance = current_distance;
    
    % 模拟退火过程
    temp = initial_temp;
    while temp > 1
        for iter = 1:max_iter
            % 生成新解（随机交换两个城市）
            new_solution = current_solution;
            idx = randperm(n, 2);
            new_solution(idx(1)), new_solution(idx(2)) = new_solution(idx(2)), new_solution(idx(1));
            
            % 计算新解的距离
            new_distance = calculate_total_distance(new_solution, dist);
            
            % 判断是否接受新解
            if new_distance < current_distance || rand() < exp((current_distance - new_distance) / temp)
                current_solution = new_solution;
                current_distance = new_distance;
                
                % 更新最佳解
                if current_distance < best_distance
                    best_solution = current_solution;
                    best_distance = current_distance;
                end
            end
        end
        % 降温
        temp = temp * cooling_rate;
    end
    
    % 输出结果
    fprintf('最优路径: %s\n', num2str(best_solution));
    fprintf('最短距离: %.2f\n', best_distance);
end

function total_distance = calculate_total_distance(solution, dist)
    total_distance = 0;
    for i = 1:length(solution)-1
        total_distance = total_distance + dist(solution(i), solution(i+1));
    end
    % 返回到起点
    total_distance = total_distance + dist(solution(end), solution(1));
end
