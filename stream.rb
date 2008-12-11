
def plot_regression(chart, x, y)
  r = Regress.new y, x
  intercept, slope = r.Beta.first, r.Beta.last
  chart.plot_straight_line drange(min(x), max(x), 1), slope, intercept
end

