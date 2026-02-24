# ============================================================
# Verificación analítica: armónicos esféricos son autofunciones
# del Laplaciano angular
# ============================================================

var('theta phi')
assume(theta,'real')
assume(phi,'real')

# Laplaciano angular
def laplacian_angular(f):
    return (1/sin(theta))*diff(sin(theta)*diff(f,theta),theta) + (1/sin(theta)^2)*diff(f,phi,2)

# Armónico esférico complejo
def Y(l,m):
    return spherical_harmonicY(l,m,theta,phi)

print("\n=== Verificación de ecuación propia angular ===\n")

cases=[(0,0),(1,0),(1,1),(2,0),(2,1),(2,2)]

for l,m in cases:
    f=Y(l,m)
    test=(laplacian_angular(f)+l*(l+1)*f).simplify_full()
    print("l =",l," m =",m," ->", test)

print("\nSi todo está correcto, los resultados deben ser 0.")
