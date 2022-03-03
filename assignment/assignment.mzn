% TODO:
% - add assertions/specify domains excluding useless parameters' values
% - add variables
% - add constraints 
% - add objective
% TIP. for the variables, use names that are already in the output definition. 

% Parameters
0..infinity: money_limit;
set of int: menu_items = index_set(menu_prices); 
array[int] of 0..infinity: menu_prices;
array[menu_items] of string: menu_names;
array[menu_items] of int: yumyum_factors; 
array[menu_items] of var 0..(money_limit div min(menu_prices)): order;

constraint sum([order[i] * menu_prices[i] | i in menu_items]) <= money_limit;

solve maximize sum([order[i] * yumyum_factors[i] | i in menu_items]);

output ["\(menu_names[i]): \(order[i])\n" | i in menu_items];

% output ["\(menu_names[i]): \(order[i])\n" | i in menu_items] ++ 
%        ["- total price:\t\(total_price)/\(money_limit)\n"] ++
%        ["- total yumyum:\t\(total_yumyum)"];
