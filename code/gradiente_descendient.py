import numpy as np

# parámetros de la elipse
a = 4
b = 1

# tamaño de paso
eta = 0.1

# punto inicial (sobre la elipse)
x = 0.2
y = sqrt((1 - a*x^2)/b)

# función gradiente
def grad_f(x,y):
    return np.array([2*x,2*y])

def grad_g(x,y):
    return np.array([2*a*x,2*b*y])

for i in range(10):

    gf = grad_f(x,y)
    gg = grad_g(x,y)

    # componente tangencial
    proj = np.dot(gf,gg)/np.dot(gg,gg)
    grad_t = gf - proj*gg

    # paso de descenso
    x_new = x - eta*grad_t[0]
    y_new = y - eta*grad_t[1]

    # proyección sobre la elipse
    s = sqrt(a*x_new^2 + b*y_new^2)
    x_new = x_new/s
    y_new = y_new/s

    # gráfico
    ellipse = parametric_plot(
        (cos(t)/sqrt(a), sin(t)/sqrt(b)),
        (t,0,2*pi),
        color='black'
    )

    point_old = point((x,y), size=40, color='red')
    point_new = point((x_new,y_new), size=40, color='blue')

    grad_vec = arrow((x,y),(x+gf[0]*0.2,y+gf[1]*0.2),color='green')
    tang_vec = arrow((x,y),(x-grad_t[0]*0.2,y-grad_t[1]*0.2),color='purple')

    show(ellipse + point_old + point_new + grad_vec + tang_vec)

    print("Iteración:",i)
    print("posición:",x_new,y_new)

    x,y = x_new,y_new
