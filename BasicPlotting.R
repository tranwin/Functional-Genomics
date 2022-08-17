# Visualizes how the GDP per capita changes in relationship to life expectancy
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color = continent)) +
geom_point(size=2, pch=12) + scale_x_log10() +
geom_smooth(method="lm", size=1)