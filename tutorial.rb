p "For each of the forty largest countries in the world (according to 1990 population figures), data are given for the country's life expectancy at birth, number of people per television set, and number of people per physician."

p "Your job is to write a program that determines the correlation, if any, between these data. Your program should use the Sho libraries where possible, and you should work with a partner to finish this assignment. One way of breaking up the work is to have on of you work on the graphical elements, and have the other work on analyzing the data."

p "The data set for this assignment is already loaded into the Live Mesh for the class. There, you'll find a file called televisions.csv that contains the data for this assignment. You can read the data into a local matrix usig this command:"

code(__LINE__) {
require 'sho'
m = read_csv_matrix Mesh.open('sho/televisions.csv')
}

p "The first column contains country names, the second column contains the life expectency at birth, the third column contains the number of people per TV, and the fourth column contains the number of people per doctor. To retrieve columns from the matrix you can use the GetCol(n) function that returns a vector for that column:"

code(__LINE__) {
life = m.GetCol(1)
tvs = m.GetCol(2)
drs = m.GetCol(3)
}

p "The first thing that you might want to do is plot tvs vs. life:"

code(__LINE__) {
show_scatter(tvs, life)
}

p "You'll see that there isn't a particularly good correlation there. So let's plot the log of tvs vs. life:"

code(__LINE__) {
chart = show_scatter(log(tvs), life)
}

p "That looks better. Let's see what it looks like to fit a least-squares regression line against that data:"

code(__LINE__) {
r1 = Regress.new life, log(tvs)
intercept, slope = r1.Beta.first, r1.Beta.last
chart.plot_straight_line drange(0, 7, 1), slope, intercept
}

p "Let's do the same thing for the doctor data:"

code(__LINE__) {
chart.plot_points log(drs), life
r2 = Regress.new life, log(drs)
intercept, slope = r2.Beta.first, r2.Beta.last
chart.plot_straight_line drange(0, 11, 1), slope, intercept
}

p "Now, let's look at the R-squared values for the two regressions:"

code(__LINE__) {
puts "tvs: #{r1.Rsq} doctors: #{r2.Rsq}"
}

p "What conclusions can you draw from this data?"

p "Now, let's switch to the other student."

p "Finally, let's pull the code from the other student and test run it in our application."

code(__LINE__) {
!pull 'steve master'
}

p "We'll need to re-run our calculations from before since pulling from a remote repository may reset our contents. Let's test our code to see if it works with the popup window."

code(__LINE__) {
require 'sho'

chart = ShoChart.new
w = create_winforms_floating_window chart
w.width = 400
w.height = 400
w.top = 0
w.left = 800
w.show
}

p "Now let's plot the same data series on the popup chart."

code(__LINE__) {
m = read_csv_matrix Mesh.open('sho/televisions.csv')

life = m.GetCol(1)
tvs = m.GetCol(2)
drs = m.GetCol(3)

chart.plot_points(log(tvs), life)
r1 = Regress.new life, log(tvs)
intercept, slope = r1.Beta.first, r1.Beta.last
chart.plot_straight_line drange(0, 7, 1), slope, intercept

chart.plot_points log(drs), life
r2 = Regress.new life, log(drs)
intercept, slope = r2.Beta.first, r2.Beta.last
chart.plot_straight_line drange(0, 11, 1), slope, intercept
}
