
require 'sho'
m = read_csv_matrix Mesh.open('sho/televisions.csv')

chart = show_scatter(log(tvs), life)

def plot_regression(chart, x, y)
  r = Regress.new y, x
  intercept, slope = r.Beta.first, r.Beta.last
  chart.plot_straight_line drange(min(x), max(x), 1), slope, intercept
end

plot_regression chart, log(tvs), life

chart.plot_points log(drs), life
plot_regression chart, log(drs), life

