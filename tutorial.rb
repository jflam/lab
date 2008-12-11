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

p "That looks better. But wait, I don't really know how to plot a best-fit line through those data points. I wonder if Steve, my classmate, knows how to do this? Let's ask. As it turns out, Steve has already prepared a method that uses the Sho statistics package that does exactly this:"

code(__LINE__) {
def plot_regression(chart, x, y)
  r = Regress.new y, x
  intercept, slope = r.Beta.first, r.Beta.last
  chart.plot_straight_line drange(min(x), max(x), 1), slope, intercept
end
}

p "Steve was nice enough to share it with me. To pull Steve's changes into our local repository, this is what we need to do:"

code(__LINE__) {
!pull "steve master"
}

p "Let's call Steve's method with our local data."

code(__LINE__) {
require 'sho'
m = read_csv_matrix Mesh.open('sho/televisions.csv')

life = m.GetCol(1)
tvs = m.GetCol(2)
drs = m.GetCol(3)

chart = show_scatter(log(tvs), life)
plot_regression chart, log(tvs), life
}

p "That looks better. Now, let's do the same thing for the doctor data:"

code(__LINE__) {
chart.plot_points log(drs), life
plot_regression chart, log(drs), life
}

p "What conclusions can you draw from this data?"

p "There is a usability problem with our program as it stands right now. We'd like the chart to not be embedded within the history. Instead, it should be a topmost floating window that we can position where we want it. From reading the Sho documentation, we do know that the chart is a Windows Forms User Control. Let's see if we can find some code on the Internet that will let us host a Windows Forms control in a floating window."

p "Great! Now that we've gotten the code for hosting a Windows forms control in a floating, topmost window working, let's test our code to see if it works with the popup window."

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

chart = show_scatter(log(tvs), life)
plot_regression chart, log(tvs), life

chart.plot_points log(drs), life
plot_regression chart, log(drs), life
}

p "Now that we have a program that plots this data series, let's publish our results back to the Internet."

code(__LINE__) {
!blog 'Correlation != Causation'
}
