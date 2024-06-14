import numpy as np;

delivery_cost = 350


price = 3.82
volume = 150


petrol_cost = price - 0.23 * price;
total_price = petrol_cost * volume + delivery_cost;

print(np.round(total_price,2))