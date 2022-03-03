% TODO:
% - add assertions/specify domains excluding useless parameters' values
% - add variables
% - add constraints 
% - add objective
% TIP. for the variables, use names that are already in the output definition. 

% Parameters
int: money_limit;
int: menu_length;
set of int: menu_items = index_set(menu_prices); 
array[int] of int: menu_prices;
array[menu_items] of string: menu_names;
array[menu_items] of int: yumyum_factors; 
array[1..menu_length] of var 0..infinity: order;

constraint sum([order[i] * menu_prices[i] | i in 1..menu_length]) <= money_limit;

solve maximize sum([order[i] * yumyum_factors[i] | i in 1..menu_length]);

output ["\(menu_names[i]): \(order[i])\n" | i in 1..menu_length];

% output ["\(menu_names[i]): \(order[i])\n" | i in menu_items] ++ 
%        ["- total price:\t\(total_price)/\(money_limit)\n"] ++
%        ["- total yumyum:\t\(total_yumyum)"];
