% Kathryn Atherton
% ABE 55800
% 01/30/2019
% Engineering Economics I Homework

%% Problem I
clear;
P1              = 180000;                       % [$]
F1              = 15000;                        % [$]
N1              = 6;                            % [years]
A1              = 25000;                        % [$]

P2              = 210000;                       % [$]
F2              = 20000;                        % [$]
N2              = 8;                            % [years]
A2              = 20000;                        % [$]

i               = 0.2;                          % [%]

% annualize all costs and compare
% option 1
A_investment1   = present_annual(P1, i, N1);    % [$ / year]
A_future1       = future_annual(F1, i, N1);     % [$ / year]
Annual1         = A_future1 - A_investment1 ...
                    - A1                        % [$ / year]
                
% option 2
A_investment2   = present_annual(P2, i, N2);    % [$ / year]
A_future2       = future_annual(F2, i, N2);     % [$ / year]
Annual2         = A_future2 - A_investment2 ...
                    - A2                        % [$ / year]
                
%% Problem 2
clear;
income_post_tax = 22000;                        % [$/year]
rent            = 12000;                        % [$/year]
savings         = 20000;                        % [$]
savings_i       = 0.04;                         % [%]

taxes           = 2000;                         % [$/year]
maintenance     = 1600;                         % [$/year]
utilities       = 2400;                         % [$/year]
loan_i          = 0.06;                         % [%]
income_tax      = 0.25;                         % [%]

house           = 134000;                       % [$]
house_i         = 0.03;                         % [%]
N               = 4;                            % [years]

% annualize costs and compare
% renting
income_saved    = income_post_tax - rent;       % [$ / year]
savings_0       = (savings * (savings_i) * ...
                    (1 - income_tax)) + savings;% [$ in savings after year 1]
savings_1       = ((savings_0 + income_saved) ...
                    * (savings_i) * (1 - income_tax)) ...
                    + savings_0 + income_saved; % [$ in savings after year 2]
savings_2       = ((savings_1 + income_saved) * ...
                    (savings_i) * (1 - income_tax)) ...
                    + savings_1 + income_saved; % [$ in savings after year 3]
savings_3       = ((savings_2 + income_saved) * ...
                    (savings_i) * (1 - income_tax))...
                    + savings_2 + income_saved; % [$ in savings after year 4]
future_renting  = savings_3 + income_saved      % [$ after year 4]

% buying
% value of house
house_f         = single_future(house, house_i, N);

% costs of house
initial_payment = savings;
owed_0          = house - savings;              % [$ owed at year 0]
loan            = single_future(owed_0, loan_i * (1 - income_tax), N);
                                                % [$ owed total]
payment         = income_post_tax - taxes - ...
                    maintenance - utilities;    % [$ paid on loan per year]
payment_f       = annual_future(payment, loan_i * (1 - income_tax), N);
                                                % [$ paid total]
future_house    = house_f + payment_f - loan    % [$ at end of year 4]

%% Problem 3
clear;
cost            = 30000;                        % [$ / year]
installation    = 100000;                       % [$]
N               = 10;                           % [years]
land_p          = 10000;                        % [$]
land_f          = 10000;                        % [$]
i               = 0.16;                         % [%]

% annualize costs and compare
a_installation  = present_annual(installation, i, N); 
                                                % [$ / year]
a_land_p        = present_annual(land_p, i, N); % [$ / year]
a_land_f        = future_annual(land_f, i, N);  % [$ / year]
maintenance     = cost - a_installation - ...
                    a_land_p + a_land_f         % [$ / year]
                
%% Problem 4
clear; 
p               = 350000;                       % [$]
sales           = 500000;                       % [$ / year]
expenses        = 300000;                       % [$ / year]
f               = 100000;                       % [$]
N               = 10;                           % [years]
tax             = 0.47;                         % [%]
capital         = 50000;                        % [$ / year]
i               = 0.25;                         % [%]

% annualize costs and compare
depreciation    = (p - f) / N;                  % [$ / year]
gross_profit    = sales - expenses;             % [$ / year]
profit          = gross_profit - depreciation;  % [$ / year]
net_profit      = profit * (1 - tax);           % [$ / year]
TCI             = p + capital;                  % [$]
annual_p        = present_annual(p, i, N);      % [$ / year]
annual_f        = future_annual(f, i, N);       % [$ / year]
net             = net_profit - annual_p + ...  
                    annual_f                    % [$ / year]

%% Functions
function F = single_future(P, i, N)
    % single payment compount amount
    F = P * (1 + i) ^ N;
end

function P = single_present(F, i, N)
    % single payment present worth   
    P = F / (1 + i) ^ N;
end

function F = annual_future(A, i, N)
    % uniform series compount amount
    F = A * ((1 + i) ^ N - 1) / i;
end

function P = annual_present(A, i, N)
    % uniform series present worth
    P = A * ((1 + i) ^ N - 1) / (i * (1 + i) ^ N);
end

function A = future_annual(F, i, N)
    % sinking fund
    A = F * i / ((1 + i) ^ N - 1);
end

function A = present_annual(P, i, N)
    % capital recovery
    A = P * (i * (1 + i) ^ N) / (((1 + i) ^ N) - 1);
end