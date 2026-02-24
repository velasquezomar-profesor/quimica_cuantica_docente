# ============================================================
# Visualización 3D de armónicos esféricos reales
# r(θ,φ)=|Y|
# ============================================================

var('theta phi')

def Y(l,m):
    return spherical_harmonicY(l,m,theta,phi)

def Yc(l,m):
    if m==0:
        return Y(l,0)
    return (1/sqrt(2))*(Y(l,m)+(-1)^m*Y(l,-m))

def Ys(l,m):
    return (1/(I*sqrt(2)))*(Y(l,m)-(-1)^m*Y(l,-m))

# Función generadora de superficie
def surface(expr,title_txt):
    f = fast_callable(abs(expr),vars=[theta,phi],domain=RR)
    return parametric_plot3d(
        (f(theta,phi)*sin(theta)*cos(phi),
         f(theta,phi)*sin(theta)*sin(phi),
         f(theta,phi)*cos(theta)),
        (theta,0,pi),(phi,0,2*pi),
        mesh=True,
        plot_points=60,
        title=title_txt
    )

# Estados solicitados
plots=[
    surface(Yc(0,0),"l=0 m=0"),
    surface(Yc(1,0),"l=1 m=0"),
    surface(Yc(1,1),"l=1 m=1 cos"),
    surface(Ys(1,1),"l=1 m=1 sin"),
    surface(Yc(2,0),"l=2 m=0"),
    surface(Yc(2,2),"l=2 m=2")
]

for p in plots:
    show(p)
