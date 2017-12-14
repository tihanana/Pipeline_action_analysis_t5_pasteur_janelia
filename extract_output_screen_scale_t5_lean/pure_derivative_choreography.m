function deriv_value = pure_derivative_choreography(value)


deriv_value = diff(value);
deriv_value = [deriv_value; deriv_value(end)];

end