###############################################################
# SIMULACIÓN CUÁNTICA
# Partícula en anillo → Momento angular → Armónicos esféricos
###############################################################

var('phi theta')

hbar = 1
m_e = 1

###############################################################
# PARTE 1 — PARTÍCULA EN UN ANILLO
###############################################################

print("=== Energías partícula en anillo ===")

R_list = [1,2,3]

for R in R_list:
    I = m_e*R^2
    print("\nRadio =",R)
    for m in range(-3,4):
        E = hbar^2*m^2/(2*I)
        print("m =",m,"E =",N(E))


###############################################################
# PARTE 2 — FUNCIÓN DE ONDA EN EL ANILLO
###############################################################

m_val = 1

psi = (1/sqrt(2*pi))*exp(I*m_val*phi)
psi2 = abs(psi)^2

print("\nψ(φ) =", psi)
print("|ψ|^2 =", psi2)

plot(psi2, (phi,0,2*pi), ymin=0, ymax=1.2,
     axes_labels=['phi','|psi|^2'],
     title="Densidad de probabilidad")


###############################################################
# PARTE 3 — CONO DE PRECESIÓN
###############################################################

print("\n=== Cono de precesión ===")

l=1
m=0

L = sqrt(l*(l+1))*hbar
Lz = m*hbar

theta0 = arccos(Lz/L)
print("Ángulo theta =", N(theta0))

param = var('t')

cone = parametric_plot3d(
    [sin(theta0)*cos(t), sin(theta0)*sin(t), cos(theta0)],
    (t,0,2*pi),
    color='blue', thickness=3)

cone


###############################################################
# PARTE 4 — ARMÓNICOS ESFÉRICOS
###############################################################

print("\n=== Armónicos esféricos ===")

# l=0 m=0
Y00 = sqrt(1/(4*pi))

# l=1 m=-1
Y1m1 = sqrt(3/(8*pi))*sin(theta)*exp(-I*phi)

print("Y00 =",Y00)
print("Y1-1 =",Y1m1)


###############################################################
# PARTE 5 — GRÁFICA ANGULAR
###############################################################

plot3d(abs(Y1m1.substitute(phi=0)), (theta,0,pi),
       (phi,0,2*pi),
       axes_labels=['theta','phi','|Y|'],
       title="Distribución angular |Y₁⁻¹|")
