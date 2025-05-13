# log_lookup_interpolation.m
Generates a lookup table for f(x)=x+ln x on [2, 8] with step h, implements linear-Lagrange interpolation to estimate f(x) at arbitrary points, and tests the accuracy by comparing the interpolated values with true values at 100 random points, reporting the mean absolute deviation.
