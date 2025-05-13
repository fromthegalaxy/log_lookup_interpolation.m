# log_lookup_interpolation.m
Generates a lookup table for f(x)=x+ln x on [2, 8] with step h, implements linear-Lagrange interpolation to estimate f(x) at arbitrary points, and tests the accuracy by comparing the interpolated values with true values at 100 random points, reporting the mean absolute deviation.
  
  Constructs and tests a tabulated approximation to

      f(x) = x + ln(x),          x ∈ [2, 8].

  The file contains three components:

    1) lookup(h)      – returns reference nodes   xref = 2:h:8   and the
                        corresponding function values yref = f(xref).

    2) LLinterp(...)  – evaluates f(x) for any x ∈ [2, 8] by **linear
                        Lagrange interpolation** between the neighbouring
                        points in (xref, yref).

    3) Script section – with  N = 60  (h = (8-2)/N) it
          • draws 100 random x-values in [2,8],
          • computes the true f(x) and the interpolated value,
          • records |f(x) − f̂(x)| and prints their mean (avg_dev).

  The reported mean absolute deviation quantifies the look-up / linear
  interpolation error.  Because the 100 test points are regenerated with
  rand each run, the average deviation will vary slightly from run to run.

  HOW TO RUN
  ----------
      >> log_lookup_interpolation

  OUTPUT
  ------
      avg_dev   – scalar, mean absolute error over 100 random samples.

  DEPENDENCIES
  ------------
      lookup.m      (included below)
      LLinterp.m    (included below)
