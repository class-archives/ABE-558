% Kathryn Atherton
% ABE 55800
% Cost Correlations Homework
% 01/25/2019
%% Problem 6-1
clear;
cost_100m2_1990         = 4200;                             % [$]
X_20m2                  = 20;                               % [m^2]
X_100m2                 = 100;                              % [m^2]
X                       = X_20m2 / X_100m2;                 % [-]
exp_10_40               = 0.60;                             % [-]
cost_20m2_1990          = cost_100m2_1990 * X ^ exp_10_40   % [$]
index_1990              = 357.6;                            % [-], from Table 6-2 (page 238)
index_2000              = 394.1;                            % [-], from Table 6-2 (page 238)
exp_40_200              = 0.81;                             % [-]
cost_100m2_2000         = cost_100m2_1990 * (index_2000 / ...
                            index_1990)                     % [$]
                        
 %% Problem 6-2
 clear; 
cost_100m2_1990         = 4200;                              % [$]
X_plot                  = 10:0.1:200;                        % [m^2]
X_100m2                 = 100;                               % [m^2]
X                       = X_plot ./ X_100m2;                 % [-]
exp_10_40               = 0.60;                              % [-]
exp_40_200              = 0.81;                              % [-]
index_1990              = 357.6;                             % [-]
index_2000              = 394.1;                             % [-]
index                   = index_2000 / index_1990;           % [-]
for i = 1:1:length(X_plot)
    if X_plot(i) <= 40
        cost_2000(i)    = cost_100m2_1990 * index * (X(i) ...
                            ^ exp_10_40);                     % [$]
    else 
        cost_2000(i)    = cost_100m2_1990 * index * (X(i) ...
                            ^ exp_40_200);                    % [$]
    end
end

figure
loglog(X_plot, cost_2000)
title({"log-log plot of 2000 Purchase Cost","vs. Surface Area of Heat Exchanger"})
xlabel('log(Heat Exchanger Surface Area [m^2])')
ylabel('log(Purchase cost in 2000 [$])')

%% Problem 6-7
clear;
equipment               = 500000;                           % [$]
equipment_perc_fci      = mean([15,40])/100;                % [%], from Table 6-3 (page 240)
fci                     = equipment / equipment_perc_fci    % [$]
wci                     = mean([10,20])/100;                % [%], from page 233
tci                     = fci / (1-wci)                     % [$], from page 232
eng_perc_fci            = mean([4, 20])                     % [%], from Table 6-3 (page 240)
eng_fci                 = eng_perc_fci / 100 * fci          % [$]
contractor_perc_fci     = mean([2,6])                       % [%], from Table 6-3 (page 240)
contractor_fci          = contractor_perc_fci / 100 * fci   % [$]

%% Problem 6-10
clear;
tci                     = 1000000;                          % [$]
wci                     = 100000;                           % [$]
product                 = 8000;                             % [kg / day]
days                    = 365;                              % [days / year]
ratio                   = 1.0;                              % [-]
fci                     = tci - wci;                        % [$], from page 232
gross_sales             = ratio * fci;                      % [$]
product_year            = product * days;                   % [kg / year]
price_kg                = gross_sales / product_year        % [$ / kg]

%% Problem 6-11
clear;
labor_phil_cost_1990    = 425000;                           % [$]
index_1990              = 357.6;                            % [-], from Table 6-2 (page 238)
index_1998              = 389.5;                            % [-], from Table 6-2 (page 238)
labor_phil_index_1998   = 1.06;                             % [-], from Table 6-12 (page 256)
labor_miami_index_1998  = 0.84;                             % [-], from Table 6-12 (page 256), 
prod_phil_index_1998    = 0.96;                             % [-], from Table 6-12 (page 256)
prod_miami_index_1998   = 0.91;                             % [-], from Table 6-12 (page 256
labor_phil_cost_1998    = labor_phil_cost_1990 * ...
                            (index_1998 / index_1990);      % [$]
rel_lab_rate            = labor_miami_index_1998 / ...
                            labor_phil_index_1998;          % [-]
rel_prod_rate           = prod_miami_index_1998 ...
                            / prod_phil_index_1998;         % [-]
rel_lab_cost            = rel_lab_rate / rel_prod_rate;     % [-]
labor_miami_cost_1998   = labor_phil_cost_1998 * ...
                            rel_lab_cost                    % [$]

%% Problem 6-13
clear; 
tci                     = 1500000;                          % [$]
product                 = 3000000;                          % [kg / year]
price                   = 0.82;                             % [$ / kg]
wci                     = 0.15 * tci;                       % [$]
raw_materials           = 0.09;                             % [$ / kg]
labor                   = 0.08;                             % [$ / kg]
utilities               = 0.05;                             % [$ / kg]
packaging               = 0.008;                            % [$ / kg]
dist                    = 0.05;                             % [% of tpc]
tax                     = 0.35;                             % [% of gross profit]
fci                     = tci - wci;                        % [$]
maintenance             = 0.1 * fci;                        % [$]
maintenance_kg          = maintenance / product;            % [$ / kg]
var_cost                = raw_materials + maintenance_kg ...
                            + utilities + packaging;        % [$ /kg]
supervision             = 0.2 * labor;                      % [$ / kg]
insurance               = 0.01 * fci / product;             % [$ / kg]
depreciation            = 0.15 * fci / product;             % [$ / kg]
plant_overhead          = 0.6;                              % [% of fixed costs]
fix_cost                = (labor + supervision + insurance ...
                            + depreciation) / (1 - ...
                            plant_overhead);                % [$ / kg]
manufacturing           = var_cost + fix_cost               % [$ / kg]
tpc                     = manufacturing / (1- dist)         % [$ / kg]
tpc_year                = tpc * product                     % [$ / year]
profit                  = price - tpc                       % [$ / kg]
profit_taxed            = profit * (1 - tax)                % [$ / kg]

%% Problem 6-14
clear;
product                 = 100;                              % [kg]
fci                     = 4000000;                          % [$]
output                  = 9000000;                          % [kg]
raw_materials           = 0.25;                             % [$ / kg]
utilities               = (50 * 4.4 / 1000) + (0.9 * 0.045)...
                            + (0.083 * 0.53 / 1000 * 997);  % [$ / kg]
labor                   = 12 * 25 * 24 * 300 / output;      % [$ / kg]
supervision             = 0.2 * labor;                      % [$ / kg]
maintenance             = mean([7,11]) / 100 * fci / ...
                            output;                         % [$ / kg]
distribution            = 0.02;                             % [% of tpc]
plant_overhead          = 0.5 * (labor + maintenance + ...
                            supervision);                   % [$ / kg]
var_cost                = raw_materials + maintenance + ...
                            utilities;                      % [$ / kg]
fix_cost                = plant_overhead + labor + ...
                            supervision;                    % [$ / kg]
manufacturing           = var_cost + fix_cost;              % [$ / kg]
manufacturing_100       = manufacturing * product           % [$ / 100 kg]

%% Problem 6-16
clear;
product                 = 5000;                             % [kg / day]
price                   = 1.75;                             % [$ / kg]
var_cost                = 2000000;                          % [$ / year at 100% capacity]
fix_cost                = 700000;                           % [$ / year at 100% capacity]
tax                     = 0.35;                             % [% of earnings]
income                  = product * price * 365;            % [$ / year]
slope                   = income / product;                 % [$ / kg]
product_be              = slope * (product);                % [$]
fix_cost_kg             = fix_cost / product_be             % [$ / kg]
price                   = price * 1.1;                      % [$ / kg]
income_new              = product * price * 365;            % [$ / year]
earnings                = income - var_cost - fix_cost;     % [$ / year]
earnings_new            = income_new - var_cost - fix_cost; % [$ / year]
profit                  = earnings * (1 - tax);             % [$ / year]
profit_new              = earnings_new * (1 - tax);         % [$ / year]
increase                = profit_new - profit               % [$ / year]

%% Problem 6-17
clear;
sales                   = 0.5;                              % [% of fci]
tci                     = 2500000;                          % [$]
wci                     = 0.2 * tci;                        % [$]
tax                     = 0.35;                             % [$]
fci                     = tci - wci;                        % [$]
tpc                     = 1500000;                          % [$]
sales                   = sales * fci;                      % [$]
profit                  = sales * (1 - tax);                % [$]
perc_tci_earnings       = sales / tci * 100                 % [% of tci]
perc_tci_profit         = profit / tci * 100                % [% of tci]